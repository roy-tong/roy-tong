# Roy Tong

**产品经理 · 连续创业者 · 产品负责人**

我把前沿技术变成用户愿意用、团队交付得出、业务验证得了的产品。过去近十年，我在平安银行、百度、科大讯飞、字节跳动和大疆做过企业 AI、消费软件、影像与智能硬件，也有多次创业经历。

现在关注：`AI Products` · `Physical AI` · `Intelligent Hardware` · `Product Commercialization` · `Agent Skills`

[给人：阅读我的判断](https://roy-tong.github.io/#writing) · [给 Agent：使用开放能力](#给-agent-的开放能力) · [关于我](https://roy-tong.github.io/about/) · [联系](https://roy-tong.github.io/support/)

## 我正在形成的判断

1. **Agent 在信息空间完成任务，机器人在物理空间改变世界。** 两者共享模型能力，但产品约束、失败成本和价值兑现方式不同。
2. **AI Native 之后，产品的基本单位从界面转向可验收的任务闭环。** 模型之外，工具、记忆、权限、工作流和人工复核共同决定产品是否成立。
3. **Geek、Professional、B 端和 C 端不是一条漏斗。** 它们是四种消灭不确定性的市场角色，下一市场应由当前最大的未知决定。
4. **研究的价值不是信息更多，而是让一个决定改变。** 事实、推断、假设、反例和停止条件必须同时被保留。

## 从这些文章认识我

- [从 AI 应用到真实世界：我的一次转向](https://roy-tong.github.io/notes/from-ai-software-to-physical-world/) — 创业与大疆经历如何改变我对软件、硬件、竞争门槛和具身智能的理解。
- [WAIC 之后：AI 产业开始为“把事做成”买单](https://roy-tong.github.io/notes/waic-from-models-to-systems/) — 从模型走向工具、工作流、交付与组织采用。
- [具身智能入门：产业、公司、产品、技术与职业地图](https://roy-tong.github.io/notes/embodied-intelligence-beginners-guide/) — 面向产品人与转型者的结构化入门地图。
- [场景—用户—需求：让大规模用户研究更接近真实决策](https://roy-tong.github.io/notes/scene-user-demand-evidence-research/) — 从用户声音走向可审计、可反驳的需求证据。

[查看全部文章](https://roy-tong.github.io/archive/) · [Agent 可读知识索引](https://roy-tong.github.io/llms.txt)

## 给 Agent 的开放能力

每个项目都必须先回答三个问题：**Agent 什么时候应该发现它、第一次成功能否在一分钟内发生、什么结果算通过。**

| Agent 任务 | 项目 | 60 秒内的第一次成功 | 当前边界 |
| --- | --- | --- | --- |
| 持续研究一个领域 | [iRead](https://github.com/roy-tong/iRead) | `iread demo` 离线生成 Markdown + JSON 报告 | 公开 Beta；维护者完成 7 天真实使用前不宣称稳定 |
| 判断需求证据是否成立 | [User Demand Research](https://github.com/roy-tong/user-demand-research) | 验证合成研究并拦截缺少商业证据的“已验证”结论 | SURE = Structured User Research with Evidence；不是泛行业报告生成器 |
| 把 B 站视频变成研究文本 | [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | 离线生成 Markdown、SRT、JSON 与 manifest | 真实转写明确要求 Apple Silicon + MLX |
| 判断竞争与市场进入 | [Product Decision Skills](https://github.com/roy-tong/product-decision-skills) | 一条命令验证 2 个 Skill、40 条触发样例与 2 套案例 | v0.1 只含 Competitive Analysis 与 Market Entry Strategy |

### Product Decision Skills v0.1

```bash
git clone https://github.com/roy-tong/product-decision-skills.git
cd product-decision-skills
python3 evals/validate_repository.py
```

- `competitive-analysis`：从替代方案、用户任务、决策标准和 Why Switch 重构竞品分析；
- `market-entry-strategy`：让 Geek、Professional、B2B 与 Consumer 分别承担消灭不确定性的角色。

## 我的工作方式

`定义真实任务` → `区分事实 / 推断 / 假设` → `选择最能消灭未知的市场` → `预先写下继续、回退与停止条件`

如果你正在处理 AI 产品、具身智能、AI 硬件或复杂的 0→1 产品，请带上任务、用户、现有证据和最难的未知：[联系 Roy](https://roy-tong.github.io/support/)。
