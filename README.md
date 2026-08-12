# Roy.Tong

**I build tools and components that help agents research, transform evidence, and reuse knowledge.**

我的项目默认按 Agent 产品来建设：先让 Agent 能发现，再让它能安装、调用、检查结果；同时明确权限、失败状态和数据边界。

[个人网站](https://roy-tong.github.io) · [Agent 可读知识索引](https://roy-tong.github.io/llms.txt) · [研究文章](https://roy-tong.github.io/archive/)

## Agent 工具栈

| Agent 需要完成的任务 | 项目 | 接口 | 输入 → 输出 |
| --- | --- | --- | --- |
| 持续监测一个研究领域 | [iRead](https://github.com/roy-tong/iRead) | Agent Skill + 本地 CLI | 研究领域 → 待审核信源、日报、周报、月报 |
| 从用户证据判断需求 | [SURE](https://github.com/roy-tong/sure-user-demand-research) | 标准 Agent Skill | 决策问题与证据 → 研究契约、证据账本、机会卡 |
| 把 B 站视频变成研究文本 | [Bilibili Transcript Pipeline](https://github.com/roy-tong/bilibili-transcript-pipeline) | Agent Skill + CLI | URL / BV 号 → 时间戳 Markdown、SRT、JSON |
| 检索我的公开研究 | [Roy's Research Knowledge Base](https://github.com/roy-tong/roy-tong.github.io) | Agent Skill + `llms.txt` | 研究问题 → 原文链接、综合判断、证据缺口 |

## 一条命令安装

GitHub CLI 可以把标准 Skill 安装到 Codex、Claude Code、Cursor、GitHub Copilot、Gemini CLI 等 Agent：

```bash
gh skill install roy-tong/iRead iread --agent codex --scope user
gh skill install roy-tong/sure-user-demand-research scene-user-demand-research --agent codex --scope user
gh skill install roy-tong/bilibili-transcript-pipeline bilibili-transcript --agent codex --scope user
gh skill install roy-tong/roy-tong.github.io research-knowledge-base --agent codex --scope user
```

如果希望使用公开匿名安装数的 skills.sh 生态：

```bash
npx skills add roy-tong/iRead --skill iread -g -a codex -y
```

把仓库名和 Skill 名替换为上表中的项目即可。

## 如何判断项目是否真的被 Agent 使用

我把指标分成四层，不用 Star 冒充调用量：

1. **可发现**：目标关键词能否进入 `gh skill search` 前 15 名，项目是否被 skills.sh 收录。
2. **被安装**：skills.sh 的公开匿名安装数；GitHub Release 资产下载只计算直接下载安装包。
3. **被调用**：只有 CLI 或宿主 Agent 明确提供回执时统计。纯 Skill 的触发次数目前不可准确观测。
4. **产生结果**：复用案例、Issue、外部贡献和留存任务。

这些项目不要求 Agent 暗中上传用户输入、研究领域、视频链接、逐字稿或本地路径。详见各仓库的统计口径和隐私边界。

[查看统计口径、改造前基线与复测脚本](metrics/README.md)

## 我关注的问题

`Agent Tools` · `Agent Skills` · `Research Infrastructure` · `Evidence Systems` · `Knowledge Retrieval` · `Embodied AI` · `AI Hardware`

如果你希望 Agent 获得一种目前缺失的研究能力，可以在对应仓库发 Issue，描述任务、输入、预期输出和验收方式。
