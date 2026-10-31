# Roy Tong

<p align="center">
  <a href="https://github.com/roy-tong/verovo"><img src="assets/verovo-logo.png" alt="Verovo" height="52"></a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://github.com/roy-tong/askovo"><img src="assets/askovo-logo.png" alt="Askovo" height="52"></a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://github.com/roy-tong/Growovo"><img src="assets/growovo-logo.png" alt="Growovo" height="52"></a>
</p>

**Building the ovo series — [Verovo](https://github.com/roy-tong/verovo), [Askovo](https://github.com/roy-tong/askovo) and [Growovo](https://github.com/roy-tong/Growovo). AI made generation cheap; verification became the product.**

Each tool makes a specific decision inspectable: **Askovo** — what to build; **Verovo** — whether the charges and delivery hold up; **Growovo** — where the users come from. All three type the claim, grade the evidence (E0–E5), gate on what the data can prove, and keep unresolved questions visible.

| Product | What it verifies |
| --- | --- |
| **[Verovo](https://github.com/roy-tong/verovo)** | **AI service charges and delivery, from the buyer’s side.** Independent charge and delivery reviews support reconciliation, acceptance, remediation and renewal. Local tools compare explicit criteria with evidence and re-count supported bills. [Website](https://roy-tong.github.io/verovo/) · [中文](https://github.com/roy-tong/verovo/blob/main/README.zh-CN.md) |
| **[Askovo](https://github.com/roy-tong/askovo)** | **Product and business reasoning.** 场景 → 用户 → 痛点 → 需求 → 特性 → 产品 → 商业， for PMs, user researchers, user ops and market/demand/business analysts (Skill + CLI + MCP). `askovo audit` flags conclusions that exceed their evidence — exit code 1, so it can gate CI. |
| **[Growovo](https://github.com/roy-tong/Growovo)** | **Growth, with evidence at every step.** 定 → 造 → 跑： an agent-native GTM operator that takes a shipped product toward verifiable real-user growth. The `mkt` kernel (CLI / MCP / Skill) is live across X, Email, Reddit, LinkedIn, GitHub and HN; every command carries a PROVEN / PORTED / UNVERIFIED label. |

## Try them in one minute

**Verovo — review charges and delivery** (main-branch preview; synthetic local task):

```bash
git clone https://github.com/roy-tong/verovo.git
cd verovo
python3 healthcheck/verovo review --sample --html buyer-review.html
```

The report keeps matching charges, an unmet delivery requirement and a missing
observation separate. Rule applicability and source truth still require human
review. [Inspect the synthetic report](https://roy-tong.github.io/verovo/examples/buyer-review.html)
· [Prepare your own task](https://github.com/roy-tong/verovo/blob/main/docs/buyer-review.md).
The new command is not included in the v0.9.0 tag.

**Askovo — run the product-reasoning chain** (built-in synthetic case):

```bash
pipx install git+https://github.com/roy-tong/askovo.git
askovo demo
```

**Growovo** runs on your own accounts through a local, zero-credential browser session, and every write path defaults to dry-run — so start from the [repository](https://github.com/roy-tong/Growovo) rather than a one-liner.

## Evidence you can inspect

- **Verovo**: local tests and synthetic reports verify engineering behavior, not customer demand. Buyer Ledger's 26 catalog entries are not live integrations; real customer-bill validation remains pending. The current GitHub release is CLI v0.9.0; the new buyer review runs from main, and PyPI publication remains pending (2026-10-31). My [OpenLIT token-accounting fix](https://github.com/openlit/openlit/pull/1476) (merged upstream) stops reasoning tokens from being added to an output total that already includes them.
- **Askovo**: `askovo demo` reports `status: pass`, `overclaims: 0` — that proves the reasoning chain, evidence citations and gates hold together, **not** that any demand, market size or launch is real. The chain now extends to business conclusions, and `askovo audit` exits 1 when a conclusion exceeds its evidence.
- **Growovo**: every command carries a verification level — PROVEN, PORTED or UNVERIFIED. The kernel refuses campaigns without human approval, only operates accounts its user owns, and stores no credentials.
- The [external conformance vectors](https://github.com/roy-tong/verovo/tree/main/conformance/vectors/external) that shaped verovo's measurement checks are public, with defects, fixes and regression fixtures recorded.

## The question behind the series

When software's consumers become agents and producers become AI, what counts as one use, one completed task, one verified outcome? The ovo series makes those units inspectable — for buyers checking charges and delivery, product teams reasoning from users to business, and growth work that has to prove what it actually moved.

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
