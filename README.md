# Roy Tong

<p align="center"><strong>English</strong> · <a href="README.zh-CN.md">简体中文</a></p>

<p align="center"><img src="assets/banner.svg" alt="Roy Tong — OVO, Prove Anything" width="100%"></p>

**OVO · Prove Anything. Agents do the work. We make the results count.**

We believe agent work should lead to better decisions, completed execution and business results people can understand. OVO builds open-source products toward that future.

[![Askovo on PyPI](https://img.shields.io/pypi/v/askovo?label=askovo)](https://pypi.org/project/askovo/)
[![Growovo on PyPI](https://img.shields.io/pypi/v/growovo?label=growovo)](https://pypi.org/project/growovo/)
[![Verovo on PyPI](https://img.shields.io/pypi/v/verovo?label=verovo)](https://pypi.org/project/verovo/)

## Three products, one belief

| Product | Core value | What it makes possible |
|---|---|---|
| **[Askovo](https://github.com/roy-tong/askovo)** | **Great products grow from quantitative reasoning.** | Automatically collect and analyze user and market data, then build product definitions and decisions step by step. [Website](https://roy-tong.github.io/Askovo/) · [Decision replay](https://roy-tong.github.io/Askovo/en/examples/decision-replay.html) |
| **[Growovo](https://github.com/roy-tong/Growovo)** | **You set the goal. Growovo carries out the work.** | Deliver the whole business workflow from product facts and content to channel execution, follow-up and result readback. [Website](https://roy-tong.github.io/Growovo/) · [Controlled run](https://roy-tong.github.io/Growovo/examples/controlled-run.en.html) |
| **[Verovo](https://github.com/roy-tong/verovo)** | **Make every dollar spent on AI services make sense.** | Bring supplier rules, invoices, usage and delivery into one buyer review for charges, acceptance, renewal and task economics. [Website](https://roy-tong.github.io/Verovo/) · [Replay a period](https://roy-tong.github.io/Verovo/examples/replayable-period.html) |

Each product works independently and is open source. Together they explore a larger idea: as agents do more of the work, people need a better way to turn that work into trusted outcomes.

**Execution boundary:** only Email is committed for unattended execution. X non-API browser writes are **DISABLED**; X remains read-only with dry runs, drafts and manual handoff until a compliant official API is connected.

The shift is concrete: **from research reports to product definitions, from campaigns sent to execution delivered, from invoice totals to buyer decisions.**

## Start with the work you want to change

**“I want product decisions grounded in quantitative research.”**

```bash
pipx install askovo
askovo demo
```

Askovo turns automatic data collection and analysis into a reasoned product definition, helping teams understand why, for whom and what to build.

**“I want a system that carries the work all the way through.”**

```bash
pipx install growovo
mkt demo
```

Growovo delivers the execution chain from objective to content, channels, follow-up and readback. You set the direction; Growovo does the work. The demo also writes `data/demo/proof-bundle`; its `proof_status=FAIL` comes from an intentionally failed check.

**“I want to understand what our AI spend actually bought.”**

```bash
pipx install verovo
verovo review --sample --html buyer-review.html
```

Verovo connects charges, delivery and task economics so your next acceptance or renewal starts with a clear record.

## Why Prove Anything

A finished response is only the beginning. The useful next step is a result people can inspect, replay and build on. OVO’s shared **Proof Bundle** work carries the task, execution, artifacts and checks behind a result across different products and environments.

The goal is bigger than three tools: make independent review a normal part of agent work, just as version control became a normal part of software work.

Current public examples are synthetic. They verify local execution and evidence handling, not customer adoption, market demand or business growth.

[Read the essay](https://roy-tong.github.io/en/notes/when-the-software-consumer-becomes-an-agent/) · [中文：当软件的消费者变成 Agent](https://roy-tong.github.io/notes/when-the-software-consumer-becomes-an-agent/)

<details>
<summary>Other research tools and agent-readable catalog</summary>

| Tool | What it does |
| --- | --- |
| [iRead Research Monitor](https://github.com/roy-tong/iRead) | Ongoing source discovery and evidence-aware research digests |
| [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | Public videos to timestamped, searchable research text |
| [Research to Publish](https://github.com/roy-tong/research-to-publish) | Sourced, versioned research articles with publishing packages and receipts |
| [agent-tool-center](https://github.com/roy-tong/agent-tool-center) | First-party skills and pipelines behind my research, content and operations work |
| [Roy's AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | Public research, essays and a read-only agent index |

Machine-readable catalog: https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json

```bash
gh skill preview roy-tong/roy-tong find-research-tool
gh skill install roy-tong/roy-tong find-research-tool --agent codex --scope user
```

The router helps select a tool; it does not perform the selected tool's work.

</details>

---

I write about AI, products, embodied intelligence and building companies. [Personal blog](https://roy-tong.github.io/) · [About](https://roy-tong.github.io/about/) · [X](https://x.com/elliwoodtong) · [Contact](https://roy-tong.github.io/support/)
