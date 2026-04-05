#!/bin/bash
input=$(cat)

GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

# Model — extract just the family name (Opus, Sonnet, Haiku)
model_full=$(echo "$input" | jq -r '.model.display_name // .model.id // "unknown"')
model="${model_full#Claude }"
model="${model%% *}"

# Working directory
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
folder=$(basename "$cwd")
folder_display="📁 ${folder}"

# Git branch and status
git_info=""
if git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  BRANCH=$(git -C "$cwd" branch --show-current 2>/dev/null)
  STAGED=$(git -C "$cwd" diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  MODIFIED=$(git -C "$cwd" diff --numstat 2>/dev/null | wc -l | tr -d ' ')

  GIT_STATUS=""
  [ "$STAGED" -gt 0 ]   && GIT_STATUS="${GREEN}+${STAGED}${RESET}"
  [ "$MODIFIED" -gt 0 ] && GIT_STATUS="${GIT_STATUS}${YELLOW}~${MODIFIED}${RESET}"

  if [ -n "$GIT_STATUS" ]; then
    git_info=" | 🌿 ${BRANCH} ${GIT_STATUS}"
  else
    git_info=" | 🌿 ${BRANCH}"
  fi

  # Convert SSH remote URL to HTTPS for a clickable OSC 8 hyperlink on the dirname
  REMOTE=$(git -C "$cwd" remote get-url origin 2>/dev/null \
    | sed 's|git@github.com:|https://github.com/|' \
    | sed 's|\.git$||')
  if [ -n "$REMOTE" ]; then
    REPO_NAME=$(basename "$REMOTE")
    folder_display="📁 \e]8;;${REMOTE}\a${REPO_NAME}\e]8;;\a"
  fi
fi

# Line 1: model, folder (clickable if GitHub), git branch + counts
line1="[${model}] ${folder_display}${git_info}"

# Line 2: context progress bar
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
  PCT=$(printf '%.0f' "$used")
  BAR_WIDTH=10
  FILLED=$((PCT * BAR_WIDTH / 100))
  EMPTY=$((BAR_WIDTH - FILLED))
  BAR=""
  [ "$FILLED" -gt 0 ] && printf -v FILL "%${FILLED}s" && BAR="${FILL// /▓}"
  [ "$EMPTY" -gt 0 ]  && printf -v PAD  "%${EMPTY}s"  && BAR="${BAR}${PAD// /░}"
  ctx_bar="💬 [${BAR}] ${PCT}%"
else
  ctx_bar="💬 [░░░░░░░░░░] --%"
fi

# Rate limit progress bar (5-hour preferred, fall back to 7-day)
rate_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
rate_label="5h"
if [ -z "$rate_pct" ]; then
  rate_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
  rate_label="7d"
fi
if [ -n "$rate_pct" ]; then
  RPCT=$(printf '%.0f' "$rate_pct")
  BAR_WIDTH=10
  RFILLED=$((RPCT * BAR_WIDTH / 100))
  REMPTY=$((BAR_WIDTH - RFILLED))
  RBAR=""
  [ "$RFILLED" -gt 0 ] && printf -v RFILL "%${RFILLED}s" && RBAR="${RFILL// /▓}"
  [ "$REMPTY" -gt 0 ]  && printf -v RPAD  "%${REMPTY}s"  && RBAR="${RBAR}${RPAD// /░}"
  rate_bar="  ⚡ [${RBAR}] ${RPCT}% ${rate_label}"
else
  rate_bar=""
fi

line2="${ctx_bar}${rate_bar}"

printf '%b' "${line1}\n${line2}"
