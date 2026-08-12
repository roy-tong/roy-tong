# Agent 调用计数方案

结论先说：**纯 Skill 的触发次数，目前无法由发布者准确统计。** Skill 是一组被宿主 Agent 读取的本地文件，没有统一的调用回执。安装量、Git clone、页面访问和真正调用是四件不同的事。

## 现在已经能记录什么

| 阶段 | 指标 | 数据源 | 能回答的问题 |
| --- | --- | --- | --- |
| 被发现 | 目标关键词的前 15 名排名 | `gh skill search` | Agent 搜索能力时能否看到项目 |
| 被收录 | Skill 详情页是否存在 | skills.sh | 是否进入公开 Skill 目录 |
| 被安装 | 去重安装总数与周趋势 | skills.sh | 有多少安装通过该 CLI 完成 |
| 被访问 | 14 天浏览、独立访客、来源站点 | GitHub Traffic | 人或网页 Agent 是否进入仓库 |
| 被下载 | Release 附件下载量 | GitHub Releases | CLI 或离线包是否被直接下载 |
| 被调用 | 暂不可观测，或由 CLI/MCP 记录 | 本地事件或明确授权的遥测 | 工具实际执行了几次 |
| 产生结果 | 成功任务、复用案例、Issue、PR | 工具事件与 GitHub | 调用是否产生可用结果 |

仓库中的 `Agent discovery snapshot` 工作流每周保存前五类指标。它不会把 clone 或下载写成调用量。GitHub Skill 搜索和 skills.sh 搜索分开记录：前者目前依赖 GitHub Code Search 索引，后者反映 skills.sh 自己的检索结果。

## 为什么纯 Skill 不能直接计数

宿主 Agent 可能读取 `SKILL.md`，也可能只抽取描述、缓存内容或把多个 Skill 合并进一次任务。发布者既看不到这次选择，也没有可靠的方法区分“已安装但未使用”和“真正执行”。在 Skill 中暗藏网络请求会泄露使用行为，也会降低安全审计与采用意愿，因此不采用。

## 可执行的调用统计设计

只有存在确定的执行入口时记录调用：iRead 和 Bilibili Transcript 用 CLI；以后需要跨环境调用时再提供 MCP。SURE 和知识库仍保持纯 Skill，除非真实需求证明值得增加执行服务。

### 默认：只写本地事件

- 默认写入用户本机的 JSONL 事件文件，不联网。
- 提供 `metrics show` 查看汇总、`metrics export` 主动导出、`metrics clear` 删除记录。
- 一次顶层任务只记一次调用；内部重试单独记为 retry，不抬高任务数。
- 同时记录成功、失败类型和粗粒度耗时，才能区分“被调用”与“被有效使用”。

事件结构见 [`agent-event.schema.json`](agent-event.schema.json)。示例：

```json
{
  "schema_version": "1.0",
  "event_id": "018f4f88-6b60-7ed0-9d6e-a8cb99431a8d",
  "occurred_at": "2026-08-12T08:00:00Z",
  "project": "iread",
  "version": "0.2.0-beta.9",
  "surface": "cli",
  "operation": "report.generate",
  "outcome": "success",
  "duration_bucket": "10s-60s",
  "agent_host": "codex",
  "telemetry_mode": "local"
}
```

### 可选：匿名汇总

只有用户主动开启后，才上传按天聚合的计数。允许的字段限于：项目、版本、CLI/MCP、操作名、成功或失败类别、粗粒度耗时、Agent 宿主和日期。

以下内容永不上传：提示词、研究主题、URL/BV 号、文件路径、逐字稿、文章正文、输出、账号、IP、设备标识和精确时间。实现时应同时支持 `DO_NOT_TRACK=1`，并在 README 中公开数据字典、保留周期和关闭方式。

### MCP 的计数方式

MCP 服务可在 `tools/call` 边界记录每个工具名、结果和耗时，并用 OpenTelemetry 输出 trace 与 counter。远程 MCP 可以形成发布者侧汇总；本地 stdio MCP 仍默认只保留在本机。参数和结果内容默认不进入 trace。

## 推荐实施顺序

1. 先积累四周搜索排名、skills.sh 安装和 GitHub 来源数据，建立自然基线。
2. 给 iRead 与 Bilibili Transcript 增加本地调用事件和 `metrics show/export/clear`。
3. 确认隐私文案与统计后台后，再决定是否提供默认关闭的匿名汇总。
4. 只有出现跨 Agent、跨设备调用需求时，再为合适的能力提供 MCP；不要为了数字给纯方法论强加服务端。

验收看四个数：安装数、顶层调用数、成功任务数、30 天内重复使用的匿名聚合数。前两者不能互相替代。
