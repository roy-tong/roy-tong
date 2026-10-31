---
name: find-research-tool
description: Route research, verification, and growth tasks to Roy Tong's open-source Agent Skills and local-first tools. Use when a user needs to re-count an AI or SaaS support bill against public billing rules, audit agent-tool spend, verify AI service charges and delivery, run measurement-conformance checks on agent telemetry (retry accounting, operation vs attempt, token double counting), reason from users to products with graded demand evidence, run continuous research monitoring, source discovery, recurring research digests, voice-of-customer analysis, willingness-to-pay validation, agent-native go-to-market or growth operations, user-acquisition channels, Show HN or GitHub project operations, Bilibili video-to-text or subtitles, Roy Tong's public AI product research, or asks which Roy Tong project, Skill, CLI, or research tool to use. 中文触发：选择研究工具、AI 账单复算、费用核验、对账依据、遥测语义核查、重试计数、用量口径、产品推理、用户需求研究、持续行业监测、信源发现、评论挖掘、付费意愿、增长运营、GTM、获客渠道、Show HN、GitHub 项目运营、B站视频转文字、检索 Roy Tong 公开研究。
---

# Find a Research Tool

Route the task; do not pretend this Skill performs the selected tool's work.

Read the canonical catalog first:

`https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json`

If it is temporarily unavailable, use this fallback:

| Task | Select | Target Skill |
| --- | --- | --- |
| Re-count an AI or SaaS support bill against public billing rules; audit agent-tool spend; check whether agent telemetry double counts retries, mixes operation and attempt grains, or double counts token subsets | Verovo | `verovo` |
| Monitor a field repeatedly; discover and review sources; produce recurring digests | iRead Research Monitor | `iread` |
| Reason from users to products and business (场景→用户→痛点→需求→特性→产品→商业); audit feedback or demand claims; grade evidence; validate an opportunity or willingness to pay; fail conclusions that exceed their evidence | Askovo | `askovo` |
| Run agent-native GTM for a shipped product: repository audits, zero-response sweeps, human-approved campaign plans across X / Email / Reddit / LinkedIn / GitHub / HN | Growovo | `marketing-ops` |
| Convert public Bilibili URLs or BV ids to timestamped Markdown, SRT, and JSON | Bilibili Video to Transcript | `bilibili-transcript` |
| Search and synthesize Roy Tong's published AI product, Agent, embodied-AI, or hardware research | Roy's AI Product Research Library | `research-knowledge-base` |
| Turn local research projects, pinned GitHub research, or ChatGPT sessions into sourced, versioned website articles with reader packages | Research to Publish | `research-to-publish` |

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
