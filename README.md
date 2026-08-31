<p align="center">
  <img src="assets/banner.svg" alt="ROY TONG · Product Manager · Repeat Founder — turning frontier tech into shippable products" width="100%">
</p>

# Roy Tong

**Building [AgentMeasure](https://github.com/roy-tong/AgentMeasure) — open measurement & conformance infrastructure for AI agents.**

Measure what agent telemetry actually counts: attempts, operations, retries, token accounting, and evidence boundaries.

[AgentMeasure](https://github.com/roy-tong/AgentMeasure) · [Conformance vectors](https://github.com/roy-tong/AgentMeasure/tree/main/conformance) · [Website](https://roy-tong.github.io/AgentMeasure/) · [中文主页](https://roy-tong.github.io/)

### Recent external evidence

- ✓ [OpenLIT](https://github.com/openlit/openlit/pull/1476) — token-accounting invariant merged upstream (reasoning ⊂ output; adding them reports tokens that never happened)
- ✓ [Urusilla](https://github.com/roy-tong/AgentMeasure/tree/main/conformance/vectors/external) — 2 external conformance vectors → [3 defects found and fixed](https://github.com/roy-tong/AgentMeasure/issues/12), each with the finder's fixture as the regression guard
- ✓ Agent semantics reviewed in public across [Langfuse](https://github.com/orgs/langfuse/discussions/16383) · [DeepEval](https://github.com/confident-ai/deepeval/issues/3110) · OTel GenAI

---

## Building now — AgentMeasure

**AgentMeasure tests whether agent telemetry metrics actually mean what their labels claim.**

- Attempts vs operations — one logical use vs N executions
- Retry accounting — a retried call is not two users
- Token double counting — subsets must not be added into totals
- Evidence vs inference — what a trace proves vs what it merely suggests
- Eval repeatability — n runs are n measurements, not one verdict

Proven in the wild: an invariant [merged into OpenLIT's main](https://github.com/openlit/openlit/pull/1476), two external conformance vectors from an independent contributor, three externally found defects fixed publicly. Long term: a common measurement layer for the Agent Capability Economy.

[Try the 2-minute local demo](https://github.com/roy-tong/AgentMeasure#try-it-in-2-minutes) · [Send a trace, get a measurement check](https://github.com/roy-tong/AgentMeasure#external-provider-trials)

## Research

Product and industry research in four directions. Facts first; conclusions revised as evidence changes.

| Direction | Central question |
| --- | --- |
| **Embodied Intelligence** | how robots move from demo to real tasks, product definition, and commercialization |
| **Multimodal Interaction** | what the next interaction paradigm looks like when voice, vision, and space become I/O |
| **On-device AI** | how models, compute, privacy, and form factors jointly shape the AI product experience |
| **Agents** | how agents acquire context, choose capabilities, call software — and form a new software economy |

[Research library →](https://roy-tong.github.io/research/)

## Writing

Judgments worth keeping, discussing, and falsifying (中文):

- [AI Native 之后，产品的基本单位变了](https://roy-tong.github.io/notes/ai-native-basic-unit/)
- [RAG 之后，Agent 需要 Context Recommendation](https://roy-tong.github.io/notes/agent-context-recommendation-after-rag/)
- [空间计算需要自己的“触控时刻”](https://roy-tong.github.io/notes/spatial-computing-touch-moment/)
- [家庭机器人为什么技术上更难，经济上可能更丰富](https://roy-tong.github.io/notes/home-robots-harder-richer/)

[All essays →](https://roy-tong.github.io/essays/)

## Other tools

| Tool | What it does |
| --- | --- |
| [User Demand Research (SURE)](https://github.com/roy-tong/user-demand-research) | auditable demand evidence and research reports from goals, scope, and sample design (Skill + CLI + MCP) |
| [iRead Research Monitor](https://github.com/roy-tong/iRead) | continuous source discovery with evidence-aware daily / weekly / monthly digests |
| [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | public videos → timestamped, searchable research text |
| [AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | public research, essays, and an agent-readable index |

Machine-readable tool catalog (agent routing): `https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json`

Router skill:

```bash
gh skill preview roy-tong/roy-tong find-research-tool
gh skill install roy-tong/roy-tong find-research-tool --agent codex --scope user
```

---

Product manager and repeat founder, ~10 years across AI, software, and intelligent hardware. [About](https://roy-tong.github.io/about/) · [GitHub](https://github.com/roy-tong) · [X / Twitter](https://x.com/elliwoodtong) · [Contact](https://roy-tong.github.io/support/)
