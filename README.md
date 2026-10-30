# Roy Tong

**Building the ovo series — [verovo](https://github.com/roy-tong/verovo) and [askovo](https://github.com/roy-tong/askovo). AI made generation cheap; verification became the product.**

Every ovo tool is a second pair of eyes for one decision: type the claim, grade the evidence (E0–E5), gate on what the data can actually prove, and record what remains unknown.

| Product | What it verifies |
| --- | --- |
| **[verovo](https://github.com/roy-tong/verovo)** | **AI service charges and delivery.** A local CLI re-counts supported bills against public billing rules; the Buyer Ledger catalogues 26 agent-tool billing models. [Website](https://roy-tong.github.io/verovo/) · [中文](https://github.com/roy-tong/verovo/blob/main/README.zh-CN.md) |
| **[askovo](https://github.com/roy-tong/askovo)** | **Product reasoning.** 场景 → 用户 → 痛点 → 需求 → 特性 → 产品 — evidence-led demand research for PMs, user researchers and user ops (Skill + CLI + MCP). |

## Try either in one minute

**verovo — re-count a support bill** (synthetic export, real command, runs locally):

```bash
pip install "git+https://github.com/roy-tong/verovo@v0.9.0#subdirectory=healthcheck"
verovo recount --sample
```

The output prints the vendor's rule with its public source, findings in both directions, then the dollars — and states plainly which amounts are rule-priced findings, not recovered money.

**askovo — run the product-reasoning chain** (built-in synthetic case):

```bash
git clone https://github.com/roy-tong/askovo.git && cd askovo
pipx install --editable .
askovo demo
```

## Evidence you can inspect

- **verovo**: 106 tests pass on synthetic data and CI compares frozen showcase outputs; **no real platform bill has been validated yet**. CLI 0.9.0 is tagged on GitHub; the PyPI publish is pending. My [OpenLIT token-accounting fix](https://github.com/openlit/openlit/pull/1476) (merged upstream) stops reasoning tokens from being added to an output total that already includes them.
- **askovo**: `askovo demo` reports `status: pass`, `overclaims: 0` — that proves the reasoning chain, evidence citations and gates hold together, **not** that any demand, market size or launch is real.
- The [external conformance vectors](https://github.com/roy-tong/verovo/tree/main/conformance/vectors/external) that shaped verovo's measurement checks are public, with defects, fixes and regression fixtures recorded.

## The question behind the series

When software's consumers become agents and producers become AI, what counts as one use, one completed task, one verified outcome? The ovo series makes those units inspectable — for buyers re-counting a bill, and for product teams reasoning from users to features.

[Read the essay](https://roy-tong.github.io/en/notes/when-the-software-consumer-becomes-an-agent/) · [中文：当软件的消费者变成 Agent](https://roy-tong.github.io/notes/when-the-software-consumer-becomes-an-agent/)

<details>
<summary>Other research tools and agent-readable catalog</summary>

| Tool | What it does |
| --- | --- |
| [iRead Research Monitor](https://github.com/roy-tong/iRead) | Ongoing source discovery and evidence-aware research digests |
| [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | Public videos to timestamped, searchable research text |
| [Research to Publish](https://github.com/roy-tong/research-to-publish) | Sourced, versioned research articles with WeChat and Xiaohongshu delivery packages and publication receipts |
| [agent-tool-center](https://github.com/roy-tong/agent-tool-center) | First-party skills and pipelines behind my research, content and ops lines |
| [Roy's AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | Public research, essays, and a read-only agent index |

Machine-readable catalog: https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json

```bash
gh skill preview roy-tong/roy-tong find-research-tool
gh skill install roy-tong/roy-tong find-research-tool --agent codex --scope user
```

The router helps select a tool; it does not perform the selected tool's work.

</details>

---

I also write about AI, products, embodied intelligence, and building companies. [Personal blog](https://roy-tong.github.io/) · [About](https://roy-tong.github.io/about/) · [X](https://x.com/elliwoodtong) · [Contact](https://roy-tong.github.io/support/)
