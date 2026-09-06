# Roy Tong

**Building [AgentMeasure](https://github.com/roy-tong/AgentMeasure) — check whether your agent metrics mean what their labels claim.**

[Run the checks](https://github.com/roy-tong/AgentMeasure/tree/main/conformance/pack) · [Project website](https://roy-tong.github.io/AgentMeasure/) · [中文说明](https://github.com/roy-tong/AgentMeasure/blob/main/README.zh-CN.md) · [My blog](https://roy-tong.github.io/)

## One task. Two attempts. What do you count?

One declared operation has a failed attempt, then a successful retry:

| Measurement | Result |
| --- | --- |
| Logical operations | 1 |
| Execution attempts | 2 |
| Operation success | 1 / 1 = 100% |
| Attempt success | 1 / 2 = 50% |

Both success rates describe the same execution, at different grains. If a trace cannot establish the grouping or outcome, the result is **UNPROVABLE**.

AgentMeasure turns these distinctions into local checks and CI results: **PASS / FAIL / UNPROVABLE**. It is useful for agent-framework maintainers, MCP/API providers, and teams comparing agent evaluations.

## Evidence you can inspect

- **Merged upstream:** my [OpenLIT token-accounting fix](https://github.com/openlit/openlit/pull/1476) prevents reasoning tokens from being added to an output total that already includes them.
- **Independent test cases:** [Urusilla’s external conformance vectors](https://github.com/roy-tong/AgentMeasure/tree/main/conformance/vectors/external) exposed measurement defects, including [an operation-grain metric aggregated at assignment grain](https://github.com/roy-tong/AgentMeasure/issues/12). The report records the fix and regression fixture.
- **Explicit limits:** the [Conformance Pack](https://github.com/roy-tong/AgentMeasure/tree/main/conformance/pack) checks execution grain, retry reconciliation, cost preservation, operation grain, and evidence boundaries. Token and cache checks are **not yet supported** by the pack; the OpenLIT fix is a separate upstream contribution.

## Try it locally

With Git and Python 3 installed, run the included fixtures:

```bash
git clone https://github.com/roy-tong/AgentMeasure.git
cd AgentMeasure
python3 conformance/pack/agentmeasure selftest
```

This checks the repository’s fixtures. To check your own measurements, [prepare an FMT-002 fixture and optionally provide metric claims](https://github.com/roy-tong/AgentMeasure/tree/main/conformance/pack#input-contract). Raw data stays local unless you choose to share it.

**Help make the checks better:** [contribute a counterexample or discuss a measurement](https://github.com/roy-tong/AgentMeasure/discussions). Start with a synthetic or public fixture and the number you expected. If the project is useful, [star or share AgentMeasure](https://github.com/roy-tong/AgentMeasure).

## The question behind the project

When agents become software consumers, what counts as one use, one completed task, or one useful outcome? I am building AgentMeasure to make those units inspectable.

[Read the essay](https://roy-tong.github.io/en/notes/when-the-software-consumer-becomes-an-agent/) · [中文：当软件的消费者变成 Agent](https://roy-tong.github.io/notes/when-the-software-consumer-becomes-an-agent/)

<details>
<summary>Other research tools and agent-readable catalog</summary>

| Tool | What it does |
| --- | --- |
| [iRead Research Monitor](https://github.com/roy-tong/iRead) | Ongoing source discovery and evidence-aware research digests |
| [User Demand Research (SURE)](https://github.com/roy-tong/user-demand-research) | Auditable demand evidence and research reports (Skill + CLI + MCP) |
| [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | Public videos to timestamped, searchable research text |
| [Roy's AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | Public research, essays, and a read-only agent index |

Machine-readable catalog: https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json

```bash
gh skill preview roy-tong/roy-tong find-research-tool
gh skill install roy-tong/roy-tong find-research-tool --agent codex --scope user
```

The router helps select a tool; it does not perform the selected tool’s work.

</details>

---

I also write about AI, products, embodied intelligence, and building companies. [Personal blog](https://roy-tong.github.io/) · [About](https://roy-tong.github.io/about/) · [X](https://x.com/elliwoodtong) · [Contact](https://roy-tong.github.io/support/)
