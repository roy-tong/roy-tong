# Roy Tong

**产品经理 · 连续创业者**

## 把前沿技术转化为可商业化的产品

长期关注 AI、具身智能与智能硬件，研究新技术如何从概念走向真实需求、产品与商业。

[个人主页](https://roy-tong.github.io/) · [全部文章](https://roy-tong.github.io/archive/) · [Agent 工具目录](https://raw.githubusercontent.com/roy-tong/roy-tong/main/agent-tools.json) · [联系我](https://roy-tong.github.io/support/)

## 最近的文章

- [空间计算需要自己的“触控时刻”](https://roy-tong.github.io/notes/spatial-computing-touch-moment/) — 空间内容成为计算平台之前，需要稳定、可组合、可撤销的通用交互原语。
- [空降管理者如何从职位合法性走向组织合法性](https://roy-tong.github.io/notes/appointed-manager-organizational-legitimacy/) — 头衔提供决策权，共同解决问题的记录才会形成组织合法性。
- [家庭机器人为什么技术上更难，经济上可能更丰富](https://roy-tong.github.io/notes/home-robots-harder-richer/) — 家庭的变化环境、多人关系与责任结构，怎样同时抬高技术难度并扩展价值空间。
- [Geek、Professional、B、C：不同市场负责消灭不同不确定性](https://roy-tong.github.io/notes/market-roles-remove-uncertainty/) — 不把市场当成熟度阶梯，而把它们当成消灭不同未知的证据环境。
- [AI Wearable 的竞争，不是眼镜对耳机](https://roy-tong.github.io/notes/ai-wearable-modalities-body-comfort/) — 从输入输出模态、交互控制、身体位置和佩戴舒适性重新理解竞争。
- [竞品分析为什么不该从参数表开始](https://roy-tong.github.io/notes/competitive-analysis-software-hardware/) — 软件比较工作流、迁移与持续迭代，硬件还要进入系统耦合、量产、可靠性和售后。
- [AI Native 之后，产品的基本单位变了](https://roy-tong.github.io/notes/ai-native-basic-unit/) — 为什么页面、文件、图层和时间线会逐步退回到视图与控制面。
- [Agent 向左，具身向右：AI 在信息空间与物理世界的分岔](https://roy-tong.github.io/notes/agent-left-embodied-right/) — 为什么共享模型能力的两条 AI 路线，会在失败成本、评测、安全、部署与商业化上逐步分岔。

## 开源项目

项目展示名先说明任务，品牌名和稳定 ID 用于调用。

| 你要完成的任务 | 项目 | Agent 接口 | 输入 → 可验收输出 |
| --- | --- | --- | --- |
| 持续监测一个领域 | [iRead Research Monitor](https://github.com/roy-tong/iRead) | Skill + 本地 CLI | 研究领域 → 待审核信源、日报、周报、月报 |
| 判断用户证据能否支持需求结论 | [User Demand Research (SURE)](https://github.com/roy-tong/user-demand-research) | Skill + 研究验收器 | 决策问题与证据 → 研究契约、证据账本、机会卡、证据缺口 |
| 把 B 站视频变成研究文本 | [Bilibili Video to Transcript](https://github.com/roy-tong/bilibili-transcript-pipeline) | Skill + 本地 CLI | URL / BV 号 → 时间戳 Markdown、SRT、JSON |
| 检索我的公开研究 | [Roy's AI Product Research Library](https://github.com/roy-tong/roy-tong.github.io) | Skill + `llms.txt` | 研究问题 → 原文链接、综合判断、待核验缺口 |

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

[Agent 可读研究索引](https://roy-tong.github.io/llms.txt) · [发现与安装指标](metrics/README.md) · [调用统计边界](metrics/CALL-MEASUREMENT.md)

过去近十年，我一直在 AI、软件与智能硬件之间做产品，也经历过多次创业。现在主要关注具身智能、AI 硬件和 Agent 产品。
