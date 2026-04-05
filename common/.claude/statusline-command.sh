#!/bin/bash
input=$(cat)

# ---------------------------------------------------------------------------
# Catppuccin Mocha palette (24-bit ANSI true-color)
# ---------------------------------------------------------------------------
T()  { printf '\033[38;2;%s;%s;%sm' "$1" "$2" "$3"; }  # foreground
RST='\033[0m'

# Named colors
C_TEXT=$(T 205 214 244)       # cdd6f4  text
C_SUB=$(T 166 173 200)        # a6adc8  subtext0
C_SURFACE=$(T 88 91 112)      # 585b70  surface2
C_LAVENDER=$(T 180 190 254)   # b4befe  lavender
C_MAUVE=$(T 203 166 247)      # cba6f7  mauve
C_SAPPHIRE=$(T 116 199 236)   # 74c7ec  sapphire
C_TEAL=$(T 148 226 213)       # 94e2d5  teal
C_GREEN=$(T 166 227 161)      # a6e3a1  green
C_YELLOW=$(T 249 226 175)     # f9e2af  yellow
C_PEACH=$(T 250 179 135)      # fab387  peach
C_RED=$(T 243 139 168)        # f38ba8  red

# ---------------------------------------------------------------------------
# Helper: color for a percentage value (used for both context and rate limits)
# ---------------------------------------------------------------------------
pct_color() {
  local pct="$1"
  if   [ "$pct" -ge 90 ]; then printf '%b' "$C_RED"
  elif [ "$pct" -ge 80 ]; then printf '%b' "$C_PEACH"
  elif [ "$pct" -ge 50 ]; then printf '%b' "$C_YELLOW"
  else                         printf '%b' "$C_GREEN"
  fi
}

# ---------------------------------------------------------------------------
# Helper: render a mini progress bar of given width
# ---------------------------------------------------------------------------
make_bar() {
  local pct="$1" width="${2:-10}"
  local filled=$(( pct * width / 100 ))
  local empty=$(( width - filled ))
  local bar=""
  local col; col=$(pct_color "$pct")
  [ "$filled" -gt 0 ] && { printf -v f "%${filled}s"; bar="${col}${f// /▓}${RST}"; }
  [ "$empty"  -gt 0 ] && { printf -v e "%${empty}s";  bar="${bar}${C_SURFACE}${e// /░}${RST}"; }
  printf '%b' "$bar"
}

# ---------------------------------------------------------------------------
# Session / model
# ---------------------------------------------------------------------------
model_full=$(echo "$input" | jq -r '.model.display_name // .model.id // "unknown"')
model="${model_full#Claude }"
model="${model%% *}"

session_name=$(echo "$input" | jq -r '.session_name // empty')
agent_name=$(echo "$input"   | jq -r '.agent.name   // empty')
output_style=$(echo "$input" | jq -r '.output_style.name // empty')

# ---------------------------------------------------------------------------
# Working directory
# ---------------------------------------------------------------------------
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
folder=$(basename "$cwd")
folder_display="${C_TEAL}${folder}${RST}"

# ---------------------------------------------------------------------------
# Git info
# ---------------------------------------------------------------------------
git_info=""
if git -C "$cwd" rev-parse --is-inside-work-tree --no-optional-locks >/dev/null 2>&1; then
  BRANCH=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)

  # Detached HEAD
  BRANCH_COLOR="$C_SAPPHIRE"
  if [ -z "$BRANCH" ]; then
    BRANCH=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    BRANCH="detached:${BRANCH}"
    BRANCH_COLOR="$C_RED"
  fi

  STAGED=$(git    -C "$cwd" --no-optional-locks diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  MODIFIED=$(git  -C "$cwd" --no-optional-locks diff --numstat          2>/dev/null | wc -l | tr -d ' ')
  UNTRACKED=$(git -C "$cwd" --no-optional-locks ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
  STASH=$(git     -C "$cwd" --no-optional-locks stash list              2>/dev/null | wc -l | tr -d ' ')

  # Unpushed commits (only when there's a tracking branch)
  UNPUSHED=0
  if git -C "$cwd" --no-optional-locks rev-parse @{u} >/dev/null 2>&1; then
    UNPUSHED=$(git -C "$cwd" --no-optional-locks rev-list @{u}..HEAD --count 2>/dev/null || echo 0)
  fi

  GIT_COUNTS=""
  [ "$STAGED"    -gt 0 ] && GIT_COUNTS="${GIT_COUNTS} ${C_GREEN}+${STAGED}${RST}"
  [ "$MODIFIED"  -gt 0 ] && GIT_COUNTS="${GIT_COUNTS} ${C_YELLOW}~${MODIFIED}${RST}"
  [ "$UNTRACKED" -gt 0 ] && GIT_COUNTS="${GIT_COUNTS} ${C_SUB}?${UNTRACKED}${RST}"
  [ "$STASH"     -gt 0 ] && GIT_COUNTS="${GIT_COUNTS} ${C_MAUVE}*${STASH}${RST}"
  [ "$UNPUSHED"  -gt 0 ] && GIT_COUNTS="${GIT_COUNTS} ${C_LAVENDER}↑${UNPUSHED}${RST}"

  git_info=" ${C_SURFACE}|${RST} ${BRANCH_COLOR}${BRANCH}${RST}${GIT_COUNTS}"

  # Clickable repo link
  REMOTE=$(git -C "$cwd" --no-optional-locks remote get-url origin 2>/dev/null \
    | sed 's|git@github.com:|https://github.com/|' \
    | sed 's|\.git$||')
  if [ -n "$REMOTE" ]; then
    REPO_NAME=$(basename "$REMOTE")
    folder_display="${C_TEAL}\e]8;;${REMOTE}\a${REPO_NAME}\e]8;;\a${RST}"
  fi
fi

# Worktree branch indicator
worktree_branch=$(echo "$input" | jq -r '.worktree.branch // empty')
if [ -n "$worktree_branch" ]; then
  git_info="${git_info} ${C_PEACH}[worktree:${worktree_branch}]${RST}"
fi

# ---------------------------------------------------------------------------
# Line 1 assembly
# ---------------------------------------------------------------------------
# [Model] folder | branch +staged ~modified ?untracked *stash ↑unpushed
line1="${C_LAVENDER}[${C_MAUVE}${model}${C_LAVENDER}]${RST} ${folder_display}${git_info}"

# Session name (when set)
[ -n "$session_name" ] && line1="${line1}  ${C_SUB}(${session_name})${RST}"

# Agent name
[ -n "$agent_name" ] && line1="${line1}  ${C_PEACH}agent:${agent_name}${RST}"

# Output style (skip "default")
if [ -n "$output_style" ] && [ "$output_style" != "default" ]; then
  line1="${line1}  ${C_SUB}style:${output_style}${RST}"
fi

# Current time
TIME=$(date +%H:%M)
line1="${line1}  ${C_SUB}${TIME}${RST}"

# ---------------------------------------------------------------------------
# Line 2: context bar + rate limit bars
# ---------------------------------------------------------------------------
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
  PCT=$(printf '%.0f' "$used")
  BAR=$(make_bar "$PCT" 10)
  ctx_col=$(pct_color "$PCT")
  # Warn visually when above 75%
  warn=""
  [ "$PCT" -ge 75 ] && warn=" ${C_RED}!${RST}"
  ctx_bar="💬 [${BAR}] ${ctx_col}${PCT}%${RST}${warn}"
else
  ctx_bar="💬 [${C_SURFACE}░░░░░░░░░░${RST}] ${C_SUB}--%${RST}"
fi

# Both 5h and 7d rate limit bars
rate_bar=""
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage  // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage  // empty')

if [ -n "$five_pct" ]; then
  RPCT=$(printf '%.0f' "$five_pct")
  RBAR=$(make_bar "$RPCT" 6)
  rcol=$(pct_color "$RPCT")
  rate_bar="${rate_bar}  ⚡[${RBAR}]${rcol}${RPCT}%${RST}"
fi
if [ -n "$week_pct" ]; then
  WPCT=$(printf '%.0f' "$week_pct")
  WBAR=$(make_bar "$WPCT" 6)
  wcol=$(pct_color "$WPCT")
  rate_bar="${rate_bar}  📅[${WBAR}]${wcol}${WPCT}%${RST}"
fi

line2="${ctx_bar}${rate_bar}"

printf '%b' "${line1}\n${line2}\n"
