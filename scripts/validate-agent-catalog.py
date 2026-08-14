#!/usr/bin/env python3
"""Validate the public Agent catalog and its human/Skill projections."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
CATALOG_PATH = ROOT / "agent-tools.json"
SCHEMA_PATH = ROOT / "schemas" / "agent-tools.schema.json"
README_PATH = ROOT / "README.md"
ROUTER_PATH = ROOT / "skills" / "find-research-tool" / "SKILL.md"
EXPECTED_IDS = {
    "research-monitor",
    "user-demand-research",
    "bilibili-video-to-transcript",
    "ai-product-research-library",
}
OBSOLETE_CANONICAL_NAMES = {
    "sure-user-demand-research",
    "scene-user-demand-research",
}


def fail(message: str) -> None:
    print(f"error: {message}", file=sys.stderr)
    raise SystemExit(1)


def load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        fail(f"cannot read valid JSON from {path.relative_to(ROOT)}: {exc}")
    if not isinstance(value, dict):
        fail(f"{path.relative_to(ROOT)} must contain a JSON object")
    return value


def require_nonempty_string(value: Any, field: str) -> str:
    if not isinstance(value, str) or not value.strip():
        fail(f"{field} must be a non-empty string")
    return value


def require_string_list(value: Any, field: str) -> list[str]:
    if not isinstance(value, list) or not value:
        fail(f"{field} must be a non-empty array")
    for index, item in enumerate(value):
        require_nonempty_string(item, f"{field}[{index}]")
    return value


def main() -> int:
    catalog = load_json(CATALOG_PATH)
    schema = load_json(SCHEMA_PATH)
    readme = README_PATH.read_text(encoding="utf-8")
    router_text = ROUTER_PATH.read_text(encoding="utf-8")

    schema_version = require_nonempty_string(catalog.get("schema_version"), "schema_version")
    if schema.get("properties", {}).get("schema_version", {}).get("const") != schema_version:
        fail("catalog schema_version does not match the JSON Schema const")

    catalog_url = require_nonempty_string(catalog.get("catalog_url"), "catalog_url")
    if catalog_url not in readme or catalog_url not in router_text:
        fail("catalog_url must appear in both README.md and the router Skill")

    router = catalog.get("router")
    if not isinstance(router, dict):
        fail("router must be an object")
    if router.get("skill") != "find-research-tool":
        fail("router.skill must be find-research-tool")
    for field in ("preview_command", "install_command", "invoke_example"):
        require_nonempty_string(router.get(field), f"router.{field}")
    if router["preview_command"] not in readme or router["install_command"] not in readme:
        fail("README.md must publish the router preview and install commands")

    tools = catalog.get("tools")
    if not isinstance(tools, list) or not tools:
        fail("tools must be a non-empty array")

    seen_ids: set[str] = set()
    seen_names: set[str] = set()
    for index, tool in enumerate(tools):
        if not isinstance(tool, dict):
            fail(f"tools[{index}] must be an object")
        prefix = f"tools[{index}]"
        tool_id = require_nonempty_string(tool.get("id"), f"{prefix}.id")
        name = require_nonempty_string(tool.get("name"), f"{prefix}.name")
        if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", tool_id):
            fail(f"{prefix}.id must use lowercase hyphen-case")
        if tool_id in seen_ids or name in seen_names:
            fail(f"duplicate tool id or name: {tool_id} / {name}")
        seen_ids.add(tool_id)
        seen_names.add(name)

        for field in ("brand", "summary", "status", "invoke_example", "privacy"):
            require_nonempty_string(tool.get(field), f"{prefix}.{field}")
        for field in ("match", "avoid", "input", "output", "constraints"):
            require_string_list(tool.get(field), f"{prefix}.{field}")

        repository = require_nonempty_string(tool.get("repository"), f"{prefix}.repository")
        match = re.fullmatch(r"https://github\.com/(roy-tong/[A-Za-z0-9._-]+)", repository)
        if not match:
            fail(f"{prefix}.repository must be an https://github.com/roy-tong URL")
        repo_slug = match.group(1)

        skill = tool.get("skill")
        if not isinstance(skill, dict):
            fail(f"{prefix}.skill must be an object")
        skill_name = require_nonempty_string(skill.get("name"), f"{prefix}.skill.name")
        preview = require_nonempty_string(skill.get("preview_command"), f"{prefix}.skill.preview_command")
        install = require_nonempty_string(skill.get("install_command"), f"{prefix}.skill.install_command")
        if not preview.startswith("gh skill preview "):
            fail(f"{prefix}.skill.preview_command must use gh skill preview")
        if not install.startswith("gh skill install "):
            fail(f"{prefix}.skill.install_command must use gh skill install")
        if repo_slug not in preview or repo_slug not in install or skill_name not in install:
            fail(f"{prefix}.skill commands must contain the canonical repository and Skill name")

        surfaces = tool.get("surfaces")
        if not isinstance(surfaces, list) or not surfaces:
            fail(f"{prefix}.surfaces must be a non-empty array")
        if not any(isinstance(surface, dict) and surface.get("type") == "agent-skill" for surface in surfaces):
            fail(f"{prefix}.surfaces must include an agent-skill")

        first_success = tool.get("first_success")
        if not isinstance(first_success, dict):
            fail(f"{prefix}.first_success must be an object")
        require_nonempty_string(first_success.get("action"), f"{prefix}.first_success.action")
        require_nonempty_string(first_success.get("success"), f"{prefix}.first_success.success")

        for expected in (name, repository):
            if expected not in readme:
                fail(f"README.md is missing catalog value: {expected}")
        for expected in (name, skill_name):
            if expected not in router_text:
                fail(f"router Skill is missing catalog value: {expected}")

    missing_ids = EXPECTED_IDS - seen_ids
    if missing_ids:
        fail(f"catalog is missing expected tool ids: {', '.join(sorted(missing_ids))}")

    canonical_text = "\n".join((readme, CATALOG_PATH.read_text(encoding="utf-8"), router_text))
    obsolete = sorted(name for name in OBSOLETE_CANONICAL_NAMES if name in canonical_text)
    if obsolete:
        fail(f"obsolete canonical names remain in Agent-facing entry points: {', '.join(obsolete)}")

    print(f"validated {len(tools)} Agent tools, router, README, and schema (v{schema_version})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
