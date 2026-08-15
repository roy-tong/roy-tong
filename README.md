<p align="center">
  <img src="assets/banner.svg" alt="ROY TONG · 产品经理 · 连续创业者 — 把前沿技术转化为可商业化的产品" width="100%">
</p>

# Roy Tong

**产品经理 · 连续创业者**

长期关注 AI、具身智能与智能硬件，研究新技术如何从概念走向真实需求、产品与商业。

[个人主页](https://roy-tong.github.io/) · [全部文章](https://roy-tong.github.io/archive/) · [Agent 工具目录](https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json) · [联系我](https://roy-tong.github.io/support/)

## 正在做

- 把研究工具 **iRead** 打磨成每天自用的研究流水线：说一个领域，得到信源提案与日报、周报、月报；
- 写「**技术 → 产品翻译**」系列：把技术机会翻译成产品与商业决策的判断方法；
- 研究具身智能、AI Agent 与 AI 终端的产品形态。

## 文章：三个系列，一条主线

主线：**把前沿技术转化为可商业化的产品**。所有文章围绕这条主线，从三个角度展开：

| 系列 | 回答什么问题 | 入口 |
| --- | --- | --- |
| **A · 技术 → 产品翻译** | 一个技术机会应该变成什么产品、先服务谁、凭什么成立 | [进入系列](https://roy-tong.github.io/series/tech-to-product/) |
| **B · Agent 与 AI 终端** | Agent、机器人、AI 硬件的新产品形态与交互范式 | [进入系列](https://roy-tong.github.io/series/agent-and-terminals/) |
| **C · 从软件到硬件的产品管理** | 跨软硬件做产品时，组织、阶段门与 Owner 怎么设 | [进入系列](https://roy-tong.github.io/series/software-to-hardware-pm/) |

最近：

- [空间计算需要自己的“触控时刻”](https://roy-tong.github.io/notes/spatial-computing-touch-moment/) — 空间内容成为计算平台之前，需要稳定、可组合、可撤销的通用交互原语。
- [RAG 之后，Agent 需要 Context Recommendation](https://roy-tong.github.io/notes/agent-context-recommendation-after-rag/) — 复杂 Agent 需要动态决定每轮注入什么上下文、工具、状态与规则。
- [家庭机器人为什么技术上更难，经济上可能更丰富](https://roy-tong.github.io/notes/home-robots-harder-richer/) — 家庭是变化环境、多人关系与多支付机制叠加的生活系统。

## 开源项目

项目展示名先说明任务，品牌名和稳定 ID 用于调用。

| 你要完成的任务 | 项目 | 你能获得什么 | Agent 接口 |
| --- | --- | --- | --- |
| 持续监测一个领域 | [iRead Research Monitor](https://github.com/roy-tong/iRead) | 待审核信源 → 日报、周报、月报 | Skill + 本地 CLI |
| 判断用户证据能否支持需求结论 | [User Demand Research (SURE)](https://github.com/roy-tong/user-demand-research) | 研究契约、证据账本、机会卡与证据缺口 | Skill + 研究验收器 |
| 把 B 站视频变成研究文本 | [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | 时间戳 Markdown、SRT、JSON | Skill + 本地 CLI |
| 检索我的公开研究 | [Roy's AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | 原文链接、综合判断、待核验缺口 | Skill + `llms.txt` |

`iRead` 保留为品牌，但始终与 `Research Monitor` 连用；`SURE` 保留为方法名，仓库与 Skill 统一为 `user-demand-research`。

### 让 Agent 自动选择

不必先记住项目名。安装一次只负责路由的 `find-research-tool`：

```bash
gh skill preview roy-tong/roy-tong find-research-tool
gh skill install roy-tong/roy-tong find-research-tool --agent codex --scope user
```

然后直接描述任务：

```text
用 find-research-tool 为这个任务选择工具：
我需要持续跟踪家庭机器人，先审核信源，再生成每周变化报告。
```

路由器会选择项目、说明运行边界并给出最小可验收动作；它不会暗中安装其他工具。机器可读目录固定在 [`agent-tools.json`](https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json)，包含任务词、排除场景、安装命令、输入输出、首次成功标准、平台限制和隐私边界。

所有项目都遵循同一服务约定：先预览接口，再安装；先通过低风险 `first_success`，再处理真实数据或启用长期任务；返回实际产物和失败条件，不把 Star、Clone 或安装量冒充成功调用。

[Agent 可读研究索引](https://roy-tong.github.io/llms.txt)

过去近十年，我一直在 AI、软件与智能硬件之间做产品，也经历过多次创业。现在主要关注具身智能、AI 硬件和 Agent 产品。
