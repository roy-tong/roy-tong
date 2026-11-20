# Roy Tong

<p align="center"><img src="assets/banner.svg" alt="Roy Tong — verification became the product" width="100%"></p>

**Building the ovo series — [Verovo](https://github.com/roy-tong/verovo), [Askovo](https://github.com/roy-tong/askovo), [Growovo](https://github.com/roy-tong/Growovo). AI made generation cheap; verification became the product.**

[![Verovo on PyPI](https://img.shields.io/pypi/v/verovo?label=verovo)](https://pypi.org/project/verovo/)
[![Askovo on PyPI](https://img.shields.io/pypi/v/askovo?label=askovo)](https://pypi.org/project/askovo/)
[![Verovo stars](https://img.shields.io/github/stars/roy-tong/Verovo?style=social)](https://github.com/roy-tong/verovo/stargazers)

Three products, one business workflow: **Askovo researches and validates → Growovo executes recurring operations → Verovo reconciles costs with verified outcomes.** Each is independently useful as **CLI, Agent Skill and/or MCP**, keeps its own evidence and acceptance rules, and is open source.

| Product | What you get |
|---|---|
| **[Verovo](https://github.com/roy-tong/Verovo)** | Compare the billing rules, invoice, usage and delivery records for one period. Review charge differences, delivery against buyer criteria and gaps in coverage. Supplier self-attestation leaves buyer acceptance unproven. The signed report preserves the evidence for that revision. [Website](https://roy-tong.github.io/Verovo/) |
| **[Askovo](https://github.com/roy-tong/Askovo)** | Bring one product decision and the material behind it. Review the sources and counterexamples with the person who owns the decision. If the evidence falls short, Askovo lists what to collect. Reopen the same decision when new evidence arrives. [Website](https://roy-tong.github.io/Askovo/) |
| **[Growovo](https://github.com/roy-tong/Growovo)** | Give Growovo the product facts, audience and actions you authorize. It checks drafts, queues approved work and records receipts. An uncertain email send stops the batch for review. Track replies, activation and sales from their own records. [Website](https://roy-tong.github.io/Growovo/) |

Optional document/invoice parsers are adapters, not bundled forks; extraction and platform receipts are not automatically proof of verified research, customer conversion, or booked financial value.

## Try it in one minute

**Verovo — review charges and delivery** (synthetic local task, no accounts):

```bash
pipx install verovo
verovo review --sample --html buyer-review.html
```

The report keeps matching charges, an unmet delivery requirement and a missing observation separate; rule applicability still requires human review. [Inspect the synthetic report](https://roy-tong.github.io/Verovo/examples/buyer-review.html) · [Prepare your own task](https://github.com/roy-tong/verovo/blob/main/docs/buyer-review.md)

**Askovo — run the product-reasoning chain** (built-in synthetic case):

```bash
pipx install askovo
askovo demo
```

**Growovo** runs on your own accounts through a local, zero-credential browser session, and every write path defaults to dry-run — so start from the [repository](https://github.com/roy-tong/Growovo) rather than a one-liner.

## Evidence you can inspect

Every line below says what is proven and what is not:

- **Verovo**: local tests and synthetic reports verify engineering behavior, **not** customer demand. Buyer Ledger's 26 catalog entries are not live integrations; real customer-bill validation remains pending. Current release: CLI on [PyPI](https://pypi.org/project/verovo/) — see the live version badge above. My [OpenLIT token-accounting fix](https://github.com/openlit/openlit/pull/1476) (merged upstream) stops reasoning tokens from being added to an output total that already includes them.
- **Askovo**: `askovo demo` reports `status: pass`, `overclaims: 0` — that proves the reasoning chain, evidence citations and gates hold together, **not** that any demand, market size or launch is real. `askovo audit` exits 1 when a conclusion exceeds its evidence.
- **Growovo**: every command carries a verification level — PROVEN, PORTED or UNVERIFIED. The kernel refuses campaigns without human approval, only operates accounts its user owns, and stores no credentials.
- The [external conformance vectors](https://github.com/roy-tong/verovo/tree/main/conformance/vectors/external) that shaped Verovo's measurement checks are public, with defects, fixes and regression fixtures recorded.

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
