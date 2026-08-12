#!/usr/bin/env bash
set -euo pipefail

GH_BIN="${GH_BIN:-}"
OWNER="${OWNER:-roy-tong}"
REPORT_DATE="$(date -u +%F)"

if [[ -z "$GH_BIN" ]]; then
  if command -v gh >/dev/null 2>&1; then
    GH_BIN="$(command -v gh)"
  elif [[ -x "$HOME/.local/bin/gh" ]]; then
    GH_BIN="$HOME/.local/bin/gh"
  else
    echo "error: GitHub CLI (gh) is required" >&2
    exit 2
  fi
fi

repos=(
  "iRead"
  "sure-user-demand-research"
  "bilibili-transcript-pipeline"
  "roy-tong.github.io"
)

skill_pages=(
  "iRead/iread"
  "sure-user-demand-research/scene-user-demand-research"
  "bilibili-transcript-pipeline/bilibili-transcript"
  "roy-tong.github.io/research-knowledge-base"
)

queries=(
  "research monitoring"
  "user demand"
  "bilibili transcript"
  "knowledge base"
)

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

echo "# Agent discovery report — ${REPORT_DATE}"
echo
echo "This report separates observable signals from estimates. GitHub Skill search exposure is measured directly. GitHub traffic covers only the latest 14 days. skills.sh counts installations made through its CLI. Agent-side skill invocations are not observable unless the host or tool explicitly reports them."
echo
echo "## GitHub Skill search"
echo
echo "| Query | Visible in top 15 | Rank | Skill | Repository |"
echo "| --- | --- | ---: | --- | --- |"

for query in "${queries[@]}"; do
  search_file="$tmp_dir/search-$(printf '%s' "$query" | tr ' /' '--').json"
  "$GH_BIN" skill search "$query" --limit 15 --json repo,skillName >"$search_file" 2>"$search_file.err" || true
  if [[ ! -s "$search_file" ]]; then
    printf '[]\n' >"$search_file"
  fi
  match="$(jq -r --arg owner "$OWNER" '[to_entries[] | select(.value.repo | startswith($owner + "/"))][0] | if . == null then "" else "\(.key + 1)\t\(.value.skillName)\t\(.value.repo)" end' "$search_file")"
  if [[ -n "$match" ]]; then
    rank="${match%%$'\t'*}"
    rest="${match#*$'\t'}"
    skill="${rest%%$'\t'*}"
    repo="${rest#*$'\t'}"
    printf '| %s | yes | %s | `%s` | `%s` |\n' "$query" "$rank" "$skill" "$repo"
  else
    printf '| %s | no | — | — | — |\n' "$query"
  fi
done

echo
echo "## Repository signals (latest 14 days)"
echo
echo "| Repository | Views | Unique viewers | Clones | Unique cloners | Stars | Release downloads |"
echo "| --- | ---: | ---: | ---: | ---: | ---: | ---: |"

for repo in "${repos[@]}"; do
  full_repo="$OWNER/$repo"
  views="$($GH_BIN api "repos/$full_repo/traffic/views" 2>/dev/null || true)"
  clones="$($GH_BIN api "repos/$full_repo/traffic/clones" 2>/dev/null || true)"
  stars="$($GH_BIN api "repos/$full_repo" --jq '.stargazers_count' 2>/dev/null || printf '—')"
  releases="$($GH_BIN api "repos/$full_repo/releases?per_page=100" 2>/dev/null || printf '[]')"
  downloads="$(jq '[.[].assets[].download_count] | add // 0' <<<"$releases")"
  view_count="—"
  unique_viewers="—"
  clone_count="—"
  unique_cloners="—"
  if [[ -n "$views" ]]; then
    view_count="$(jq -r '.count' <<<"$views")"
    unique_viewers="$(jq -r '.uniques' <<<"$views")"
  fi
  if [[ -n "$clones" ]]; then
    clone_count="$(jq -r '.count' <<<"$clones")"
    unique_cloners="$(jq -r '.uniques' <<<"$clones")"
  fi
  printf '| `%s` | %s | %s | %s | %s | %s | %s |\n' \
    "$full_repo" \
    "$view_count" \
    "$unique_viewers" \
    "$clone_count" \
    "$unique_cloners" \
    "$stars" \
    "$downloads"
done

echo
echo "## skills.sh"
echo
echo "| Repository | Indexed | Public install signal |"
echo "| --- | --- | --- |"

for item in "${skill_pages[@]}"; do
  repo="${item%%/*}"
  skill="${item#*/}"
  page_url="https://skills.sh/$OWNER/$repo/$skill"
  page_file="$tmp_dir/skills-$(printf '%s' "$repo-$skill" | tr '/' '-').html"
  status="$(curl -L -sS -o "$page_file" -w '%{http_code}' "$page_url")"
  if [[ "$status" == "200" ]] && grep -q '<span>Installs</span>' "$page_file"; then
    weekly="$(grep -o 'aria-label="Weekly installs: [^"]*' "$page_file" | head -1 | sed 's/^aria-label="//' || true)"
    [[ -n "$weekly" ]] || weekly="Indexed; install history not exposed in page markup"
    printf '| `%s/%s/%s` | yes | %s |\n' "$OWNER" "$repo" "$skill" "$weekly"
  else
    printf '| `%s/%s/%s` | no | Install once through `npx skills add` to submit anonymous index telemetry |\n' "$OWNER" "$repo" "$skill"
  fi
done

echo
echo "## Interpretation limits"
echo
echo "- A search rank is a point-in-time result and can change with indexing, descriptions, names, and repository stars."
echo '- A GitHub clone is not a Skill install. `gh skill install` reads repository files through the GitHub API.'
echo '- Release asset downloads count direct asset downloads only; source archives and `gh skill install` are not included.'
echo '- skills.sh counts installs performed through the skills CLI and allows users to opt out with `DISABLE_TELEMETRY=1` or `DO_NOT_TRACK=1`.'
echo "- Skill invocation counts remain unavailable unless the host Agent exposes them. Do not infer invocations from installs."
