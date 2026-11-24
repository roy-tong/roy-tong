# Roy Tong

<p align="center"><a href="README.md">English</a> · <strong>简体中文</strong></p>

<p align="center"><img src="assets/banner.svg" alt="Roy Tong — OVO, Prove Anything" width="100%"></p>

**OVO · Prove Anything。Agent 做事，OVO 让结果经得起追问。**

OVO 构建三个开源产品：用真实证据支持产品研究，在明确授权内执行增长工作，独立核验 AI 支出与价值。

[![Askovo on PyPI](https://img.shields.io/pypi/v/askovo?label=askovo)](https://pypi.org/project/askovo/)
[![Growovo on PyPI](https://img.shields.io/pypi/v/growovo?label=growovo)](https://pypi.org/project/growovo/)
[![Verovo on PyPI](https://img.shields.io/pypi/v/verovo?label=verovo)](https://pypi.org/project/verovo/)

## 三个产品，同一个判断

| 产品 | 核心价值 | 能帮你完成什么 |
|---|---|---|
| **[Askovo](https://github.com/roy-tong/askovo)** | **好产品，先从真实证据开始。** | 汇集用户与市场证据、检验需求假设，再决定做什么、不做什么。[官网](https://roy-tong.github.io/Askovo/) · [决策重放](https://roy-tong.github.io/Askovo/examples/decision-replay.html) |
| **[Growovo](https://github.com/roy-tong/Growovo)** | **你定目标和边界，Growovo 持续完成增长运营。** | 执行授权动作、跟进回复，把回执和业务结果留在同一持久运行时。[官网](https://roy-tong.github.io/Growovo/) · [受控执行](https://roy-tong.github.io/Growovo/examples/controlled-run.html) |
| **[Verovo](https://github.com/roy-tong/verovo)** | **知道 Agent 花了多少、账单对不对、花得值不值。** | 跟踪支出、独立核验账单，并把成本连接到已验收任务结果。[官网](https://roy-tong.github.io/Verovo/) · [重放账期](https://roy-tong.github.io/Verovo/examples/replayable-period.html) |

每个产品都能独立使用，也都是开源项目。它们共同探索一个问题：当 Agent 承担越来越多工作，人如何把这些工作转化为可信结果。

**执行边界：**自动化服从明确的账号授权、动作范围、配额和风险审核。新权限、高影响力声明、金钱、合同和不可逆承诺需要相应审批。

这条变化很具体：**从研究答案走向真实证据，从内容排队走向授权内完成工作，从账单总额走向支出与价值决定。**

## 从你想改变的工作开始

**“我想让产品决定建立在真实证据上。”**

```bash
pipx install askovo
askovo demo
```

Askovo 采集并组织真实用户与市场证据，让反例跟着决定走，帮助团队检验仍不知道的事。

**“我想要一个能把工作执行到底的系统。”**

```bash
pipx install growovo
mkt demo
```

Growovo 把目标、授权、动作、回复和回执放进同一持久运行时。常规工作在批准范围内执行，新权限和不可逆承诺会升级审核。

**“我想知道 AI 支出究竟买到了什么。”**

```bash
pipx install verovo
verovo review --sample --html buyer-review.html
```

Verovo 把费用、交付和任务经济性连接起来，让下一次验收或续约从一份清楚的记录开始。

## 为什么是 Prove Anything

一份完成的回答只是开始。真正有用的下一步，是得到一个人们可以检查、重放并继续使用的交付物。OVO 共享的 **Proof Bundle** 工作，把任务、执行、产物和检查带到不同产品与环境中。

目标不只是三个工具：让独立复核成为 Agent 工作的常规环节，就像版本控制已经成为软件工作的常规环节。

当前公开示例均为合成样例。它们验证本地执行与证据处理，不证明客户采用、市场需求或业务增长。

[阅读英文文章](https://roy-tong.github.io/en/notes/when-the-software-consumer-becomes-an-agent/) · [中文：当软件的消费者变成 Agent](https://roy-tong.github.io/notes/when-the-software-consumer-becomes-an-agent/)

<details>
<summary>其他研究工具与 Agent 可读目录</summary>

| 工具 | 用途 |
| --- | --- |
| [iRead Research Monitor](https://github.com/roy-tong/iRead) | 持续发现信源，并生成有证据意识的研究摘要 |
| [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | 把公开视频转成带时间戳、可检索的研究文本 |
| [Research to Publish](https://github.com/roy-tong/research-to-publish) | 生成有来源、可追踪版本的研究文章、发布材料与回执 |
| [agent-tool-center](https://github.com/roy-tong/agent-tool-center) | 研究、内容和运营工作的第一方 Skill 与执行管线 |
| [Roy's AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | 公开研究、文章与只读 Agent 索引 |

机器可读目录：https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json

```bash
gh skill preview roy-tong/roy-tong find-research-tool
gh skill install roy-tong/roy-tong find-research-tool --agent codex --scope user
```

路由只负责选择工具，不会替目标工具完成任务。

</details>

---

我也写 AI、产品、具身智能和公司创建。[个人博客](https://roy-tong.github.io/) · [关于我](https://roy-tong.github.io/about/) · [X](https://x.com/elliwoodtong) · [联系方式](https://roy-tong.github.io/support/)
