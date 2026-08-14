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
  "roy-tong"
  "iRead"
  "user-demand-research"
  "bilibili-transcript-pipeline"
  "roy-tong.github.io"
)

skill_pages=(
  "roy-tong/find-research-tool"
  "iRead/iread"
  "user-demand-research/user-demand-research"
  "bilibili-transcript-pipeline/bilibili-transcript"
  "roy-tong.github.io/research-knowledge-base"
)

queries=(
  "research monitoring"
  "source discovery"
  "user demand research"
  "voice of customer"
  "bilibili transcript"
  "video to text"
  "AI product research"
  "embodied AI research"
)

target_repos=(
  "$OWNER/iRead"
  "$OWNER/iRead"
  "$OWNER/user-demand-research"
  "$OWNER/user-demand-research"
  "$OWNER/bilibili-transcript-pipeline"
  "$OWNER/bilibili-transcript-pipeline"
  "$OWNER/roy-tong.github.io"
  "$OWNER/roy-tong.github.io"
)

target_skill_ids=(
  "$OWNER/iread/iread"
  "$OWNER/iread/iread"
  "$OWNER/user-demand-research/user-demand-research"
  "$OWNER/user-demand-research/user-demand-research"
  "$OWNER/bilibili-transcript-pipeline/bilibili-transcript"
  "$OWNER/bilibili-transcript-pipeline/bilibili-transcript"
  "$OWNER/roy-tong.github.io/research-knowledge-base"
  "$OWNER/roy-tong.github.io/research-knowledge-base"
)

target_skill_names=(
  "iread"
  "iread"
  "user-demand-research"
  "user-demand-research"
  "bilibili-transcript"
  "bilibili-transcript"
  "research-knowledge-base"
  "research-knowledge-base"
)

router_repo="$OWNER/roy-tong"
router_skill="find-research-tool"
router_skill_id="$OWNER/roy-tong/$router_skill"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

echo "# Agent discovery report — ${REPORT_DATE}"
echo
echo "This report separates observable signals from estimates. GitHub Skill search exposure is measured directly for both the target Skill and the portfolio router fallback. GitHub traffic covers only the latest 14 days. skills.sh counts installations made through its CLI. Agent-side skill invocations are not observable unless the host or tool explicitly reports them."
echo
echo "## GitHub Skill search"
echo
echo "| Query | Direct target | Rank | Router fallback | Rank |"
echo "| --- | --- | ---: | --- | ---: |"

for index in "${!queries[@]}"; do
  query="${queries[$index]}"
  target_repo="${target_repos[$index]}"
  target_skill="${target_skill_names[$index]}"
  search_file="$tmp_dir/search-$(printf '%s' "$query" | tr ' /' '--').json"
  search_status="ok"
  if ! "$GH_BIN" skill search "$query" --limit 15 --json repo,skillName >"$search_file" 2>"$search_file.err"; then
    search_status="unavailable"
    printf '[]\n' >"$search_file"
  fi
  if ! jq -e 'type == "array"' "$search_file" >/dev/null 2>&1; then
    search_status="unavailable"
    printf '[]\n' >"$search_file"
  fi
  target_match="$(jq -r --arg repo "$target_repo" --arg skill "$target_skill" '[to_entries[] | select(.value.repo == $repo and .value.skillName == $skill)][0] | if . == null then "" else "\(.key + 1)" end' "$search_file")"
  router_match="$(jq -r --arg repo "$router_repo" --arg skill "$router_skill" '[to_entries[] | select(.value.repo == $repo and .value.skillName == $skill)][0] | if . == null then "" else "\(.key + 1)" end' "$search_file")"
  target_cell="no (\`$target_repo/$target_skill\`)"
  router_cell="no (\`$router_repo/$router_skill\`)"
  target_rank="—"
  router_rank="—"
  if [[ "$search_status" == "unavailable" ]]; then
    target_cell="unavailable (\`$target_repo/$target_skill\`)"
    router_cell="unavailable (\`$router_repo/$router_skill\`)"
  else
    if [[ -n "$target_match" ]]; then
      target_cell="yes (\`$target_repo/$target_skill\`)"
      target_rank="$target_match"
    fi
    if [[ -n "$router_match" ]]; then
      router_cell="yes (\`$router_repo/$router_skill\`)"
      router_rank="$router_match"
    fi
  fi
  printf '| %s | %s | %s | %s | %s |\n' \
    "$query" "$target_cell" "$target_rank" "$router_cell" "$router_rank"
done

echo
echo "## skills.sh search"
echo
echo "| Query | Direct target | Rank | Router fallback | Rank |"
echo "| --- | --- | ---: | --- | ---: |"

for index in "${!queries[@]}"; do
  query="${queries[$index]}"
  target_id="${target_skill_ids[$index]}"
  search_file="$tmp_dir/skills-search-$(printf '%s' "$query" | tr ' /' '--').json"
  search_status="ok"
  if ! curl -sS --connect-timeout 5 --max-time 15 --get 'https://skills.sh/api/search' \
    --data-urlencode "q=$query" \
    --data-urlencode 'limit=20' \
    -o "$search_file"; then
    search_status="unavailable"
    printf '{"skills":[]}\n' >"$search_file"
  fi
  if ! jq -e '.skills | type == "array"' "$search_file" >/dev/null 2>&1; then
    search_status="unavailable"
    printf '{"skills":[]}\n' >"$search_file"
  fi
  normalized_target_id="$(printf '%s' "$target_id" | tr '[:upper:]' '[:lower:]')"
  normalized_router_id="$(printf '%s' "$router_skill_id" | tr '[:upper:]' '[:lower:]')"
  target_match="$(jq -r --arg id "$normalized_target_id" '[.skills | to_entries[] | select((.value.id | ascii_downcase) == $id)][0] | if . == null then "" else "\(.key + 1)" end' "$search_file")"
  router_match="$(jq -r --arg id "$normalized_router_id" '[.skills | to_entries[] | select((.value.id | ascii_downcase) == $id)][0] | if . == null then "" else "\(.key + 1)" end' "$search_file")"
  target_cell="no (\`$target_id\`)"
  router_cell="no (\`$router_skill_id\`)"
  target_rank="—"
  router_rank="—"
  if [[ "$search_status" == "unavailable" ]]; then
    target_cell="unavailable (\`$target_id\`)"
    router_cell="unavailable (\`$router_skill_id\`)"
  else
    if [[ -n "$target_match" ]]; then
      target_cell="yes (\`$target_id\`)"
      target_rank="$target_match"
    fi
    if [[ -n "$router_match" ]]; then
      router_cell="yes (\`$router_skill_id\`)"
      router_rank="$router_match"
    fi
  fi
  printf '| %s | %s | %s | %s | %s |\n' \
    "$query" "$target_cell" "$target_rank" "$router_cell" "$router_rank"
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
echo "## Discovery referrers (latest 14 days)"
echo
echo "GitHub exposes at most the top 10 referrers. API-based Agent access may not create a web referrer."
echo
echo "| Repository | Top referrers by unique visitor |"
echo "| --- | --- |"

for repo in "${repos[@]}"; do
  full_repo="$OWNER/$repo"
  referrers="$($GH_BIN api "repos/$full_repo/traffic/popular/referrers" 2>/dev/null || printf '[]')"
  summary="$(jq -r '[sort_by(-.uniques)[:3][] | "\(.referrer) (\(.uniques) unique)"] | join(", ")' <<<"$referrers" 2>/dev/null || true)"
  [[ -n "$summary" ]] || summary="—"
  summary="${summary//|/\\|}"
  printf '| `%s` | %s |\n' "$full_repo" "$summary"
done

echo
echo "## skills.sh"
echo
echo "| Repository | Indexed | Total installs | Weekly installs (oldest → newest) |"
echo "| --- | --- | ---: | --- |"

for item in "${skill_pages[@]}"; do
  repo="${item%%/*}"
  skill="${item#*/}"
  page_url="https://skills.sh/$OWNER/$repo/$skill"
  page_file="$tmp_dir/skills-$(printf '%s' "$repo-$skill" | tr '/' '-').html"
  status="$(curl -L -sS --connect-timeout 5 --max-time 15 -o "$page_file" -w '%{http_code}' "$page_url" || true)"
  if [[ "$status" == "200" ]] && rg -q '<span>Installs</span>' "$page_file"; then
    search_file="$tmp_dir/skills-exact-$(printf '%s' "$repo-$skill" | tr '/' '-').json"
    total="—"
    if curl -sS --connect-timeout 5 --max-time 15 --get 'https://skills.sh/api/search' \
      --data-urlencode "q=$skill" \
      --data-urlencode 'limit=100' \
      -o "$search_file"; then
      exact_id="$(printf '%s/%s/%s' "$OWNER" "$repo" "$skill" | tr '[:upper:]' '[:lower:]')"
      api_total="$(jq -r --arg id "$exact_id" '[.skills[] | select((.id | ascii_downcase) == $id)][0].installs // empty' "$search_file" 2>/dev/null || true)"
      [[ -z "$api_total" ]] || total="$api_total"
    fi
    weekly="$(rg -o 'aria-label="Weekly installs: [^"]*' "$page_file" | head -1 | sed 's/^aria-label="Weekly installs: //' || true)"
    [[ -n "$weekly" ]] || weekly="—"
    printf '| `%s/%s/%s` | yes | %s | %s |\n' "$OWNER" "$repo" "$skill" "$total" "$weekly"
  else
    printf '| `%s/%s/%s` | no | — | — |\n' "$OWNER" "$repo" "$skill"
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
echo '- Maintainer validation installs are not organic adoption. Keep them annotated outside the public aggregate.'
