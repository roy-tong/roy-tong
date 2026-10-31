# Roy Tong

**Building the ovo series — [Verovo](https://github.com/roy-tong/verovo), [Askovo](https://github.com/roy-tong/askovo) and [Growovo](https://github.com/roy-tong/Growovo). AI made generation cheap; verification became the product.**

Three independent products cover a practical business workflow: **Askovo researches and validates**, **Growovo executes recurring operations**, and **Verovo connects costs with verified business outcomes**. Each preserves its own evidence and acceptance rules.

| Product | What you get |
|---|---|
| **[Askovo](https://github.com/roy-tong/Askovo)** | Give it a business question and authorized sources; it plans and performs bounded research, analyzes evidence, checks claims, and delivers traceable decisions. Optional local PDF/Office intake via Docling produces unreviewed, source-hashed text. |
| **[Growovo](https://github.com/roy-tong/Growovo)** | Let an Agent carry out recurring community and content operations on authorized accounts. Actions are reviewed, rate-limited, verified and logged; a new privacy-safe operations memory summarizes receipts without replaying them. |
| **[Verovo](https://github.com/roy-tong/Verovo)** | Reconcile AI supplier charges with tasks and business outcomes; calculate verified-success cost and evidence-backed ROI. Optional invoice2data intake extracts an unreviewed invoice draft, never a booked cost. [Website](https://roy-tong.github.io/Verovo/) · [中文](https://github.com/roy-tong/Verovo/blob/main/README.zh-CN.md) |

Each project is independently useful through **CLI, Agent Skill and/or MCP**, and all three are open-source. Optional document/invoice parsers are adapters, not bundled forks. Extraction and platform receipts are not automatically proof of verified research, customer conversion, or booked financial value.

## Try them in one minute

**Verovo — review charges and delivery** (main-branch preview; synthetic local task):

```bash
git clone https://github.com/roy-tong/verovo.git
cd verovo
python3 healthcheck/verovo review --sample --html buyer-review.html
```

The report keeps matching charges, an unmet delivery requirement and a missing
observation separate. Rule applicability and source truth still require human
review. [Inspect the synthetic report](https://roy-tong.github.io/Verovo/examples/buyer-review.html)
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
