# Agent navigation

This repository is the public catalog for Roy Tong's research tools. It is not the implementation repository for iRead, User Demand Research, Bilibili Video to Transcript, or the public research library.

- Treat `agent-tools.json` as the canonical machine-readable catalog and `README.md` as its human-facing projection.
- Use `skills/find-research-tool/SKILL.md` only to route a task. Do not claim that the router performs a target tool's work.
- Prefer capability names over opaque brands in new copy. Keep repository and Skill identifiers stable unless a migration explicitly updates every catalog, README, metric, and command reference.
- Never install a target Skill, enable a schedule, or process user data merely because a task matched the catalog. Preview the interface and obtain the approval required by that target tool.
- Keep installs, calls, and successful outputs as separate metrics.

After changing an Agent-facing entry point, run:

```bash
python3 scripts/validate-agent-catalog.py
bash -n scripts/agent-discovery-report.sh
```
