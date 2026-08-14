---
name: find-research-tool
description: Route research tasks to Roy Tong's open-source Agent Skills and local-first tools. Use when a user needs continuous research monitoring, source discovery, recurring research digests, evidence-led user-demand or voice-of-customer analysis, willingness-to-pay validation, Bilibili video-to-text or subtitles, Roy Tong's public AI product research, or asks which Roy Tong project, Skill, CLI, or research tool to use. 中文触发：选择研究工具、持续行业监测、信源发现、用户需求研究、评论挖掘、付费意愿、B站视频转文字、检索 Roy Tong 公开研究。
---

# Find a Research Tool

Route the task; do not pretend this Skill performs the selected tool's work.

Read the canonical catalog first:

`https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json`

If it is temporarily unavailable, use this fallback:

| Task | Select | Target Skill |
| --- | --- | --- |
| Monitor a field repeatedly; discover and review sources; produce recurring digests | iRead Research Monitor | `iread` |
| Audit feedback or demand claims; grade evidence; validate an opportunity or willingness to pay | User Demand Research (SURE) | `user-demand-research` |
| Convert public Bilibili URLs or BV ids to timestamped Markdown, SRT, and JSON | Bilibili Video to Transcript | `bilibili-transcript` |
| Search and synthesize Roy Tong's published AI product, Agent, embodied-AI, or hardware research | Roy's AI Product Research Library | `research-knowledge-base` |

## Route the task

1. Match the user's intended outcome against both `match` and `avoid`. Choose by task, not brand familiarity.
2. Choose one target by default. Choose multiple only when the user's workflow genuinely has sequential stages, such as transcript creation followed by demand-evidence analysis.
3. Prefer a target Skill or CLI already available in the current environment.
4. If the target is unavailable, show its catalog `preview_command`, `install_command`, constraints, and privacy boundary. Do not install it without the user's authorization.
5. After installation, use the target Skill if the host exposes it. If the host loads new Skills only in new tasks, say so plainly and provide the catalog `invoke_example` for the next task.
6. Start with `first_success`. Do not begin live collection, install a large model, enable a schedule, or process private data merely to prove setup.
7. Hand execution to the selected Skill. Do not substitute a generic workflow when the target has declared validation and safety rules.

## Return a decision

Return only what is needed to act:

- selected project and why it matches;
- the best available interface;
- preview or install command only when needed;
- one invocation example;
- the first-success action and expected evidence;
- any blocking runtime, access, privacy, or freshness constraint.

If no catalog entry fits, say that the toolkit has no matching service. Do not force the nearest project.
