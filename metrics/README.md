# Agent discovery metrics

这套记录用于回答三个不同问题，不把它们混成一个“使用量”：

1. **Agent 能否发现项目？** 每个项目定期运行两个任务型查询，分别记录具体 Skill 和统一路由器是否进入 `gh skill search` 前 15 名、skills.sh 前 20 名及当时排名。
2. **有人安装了吗？** 记录 skills.sh 公布的匿名安装数；它只覆盖通过该 CLI 完成且未关闭遥测的安装。
3. **Agent 真正调用了吗？** 纯 Skill 当前没有发布者可访问的统一回执，因此标记为不可观测。CLI 也不应为了统计而暗中上传用户输入。

运行：

```bash
scripts/agent-discovery-report.sh > metrics/$(date -u +%F).md
```

GitHub Traffic 只保留最近 14 天。为了形成长期趋势，应至少每周保存一次快照。脚本会在当前 GitHub 登录有对应仓库权限时记录浏览和克隆；没有权限时保留为 `—`。

仓库内的 `Agent discovery snapshot` 工作流每周一保存一次快照，也支持手动运行。查询覆盖 `research monitoring`、`source discovery`、`user demand research`、`voice of customer`、`bilibili transcript`、`video to text`、`AI product research` 和 `embodied AI research`。工作流会优先使用可选的 `TRAFFIC_TOKEN`；未配置时使用仓库自带令牌，跨仓库 Traffic 无权限的数据会显示为 `—`，不会写成 0。调用次数的实现边界、事件字段与隐私约束见[调用计数方案](CALL-MEASUREMENT.md)。

## 2026-08-12 基线

改造前的真实状态：

| 项目 | `gh skill` 可识别 | 14 天独立浏览 | 14 天独立克隆 | skills.sh 收录 | Release 资产下载 |
| --- | --- | ---: | ---: | --- | ---: |
| iRead | 是 | 1 | 7 | 否 | 0 |
| User Demand Research（当时为 SURE） | 否，目录不符合发现规则 | 0 | 7 | 否 | 0 |
| Bilibili Transcript Pipeline | 否，目录不符合发现规则 | 0 | 7 | 否 | 0 |
| Roy's Research Knowledge Base | 当时没有 Skill | 0 | 37 | 否 | 0 |

解释边界：

- `gh skill install` 通过 GitHub API 读取 Skill 文件，不会产生 Git clone。
- Git clone 可能来自开发、机器人或 Pages 构建，不能当成安装或调用。
- Release 下载只计算直接下载的附件，不包含 `gh skill install` 和源码压缩包。
- GitHub CLI 自身会记录公开 Skill 的安装事件，但 GitHub 暂未向发布者提供这份统计的查询 API。
- skills.sh 的匿名安装数是当前最接近“安装”的公开指标；用户可以通过 `DISABLE_TELEMETRY=1` 或 `DO_NOT_TRACK=1` 退出统计。
- 2026-08-12 已完成四个 Skill 的维护者安装验收；这四次不能作为自然用户增长解读。
- 2026-08-14 仓库与 Skill 的规范名称统一为 `user-demand-research`；旧仓库地址由 GitHub 重定向，迁移前的历史指标仍保留在旧名称下。
- 2026-08-14 为触发 skills.sh 收录并验证真实安装路径，维护者各安装一次 `find-research-tool` 和新版 `user-demand-research`；这两次必须从自然安装增长中排除。
