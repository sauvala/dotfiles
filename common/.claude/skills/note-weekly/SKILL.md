---
name: note-weekly
description: Use when the user wants a weekly summary, wants to review their week, or needs a standup summary
---

# Weekly Summary

Generate a weekly summary from daily logs in `~/Documents/notes/`.

## Process

1. Determine the target week:
   - No argument -> current week (Monday-Sunday)
   - A date -> the week containing that date
2. Find all daily notes for that week: `notes list --tags daily --since <monday> --until <sunday>`
3. Read each daily note with `notes get <id>`
4. Aggregate:
   - What was worked on (deduplicate across days)
   - All PRs: authored, reviewed, commented (deduplicate)
   - Meetings attended
   - Notes created during the week
   - Observations and themes

### Weekly note structure

Filename: `<YYYYMMDD>T090000--week-<N>-summary__weekly.md`
(where YYYYMMDD is the Monday of that week, N is ISO week number)

```markdown
---
title: Week <N> Summary (<Mon date> - <Sun date>)
date: <Monday YYYY-MM-DD>
updated: <YYYY-MM-DD>
tags: [weekly]
identifier: <YYYYMMDD>T090000
---

## Summary
<2-3 sentence overview of the week>

## What I worked on
- Theme/project 1: description
- Theme/project 2: description

## PRs
- **Authored:** list
- **Reviewed:** list
- **Commented:** list

## Meetings
- list with links to meeting notes

## Key decisions / observations
- notable items from daily observations

## Daily logs
- [Monday](daily-note-link.md)
- [Tuesday](daily-note-link.md)
- ...
```

5. Commit: `cd ~/Documents/notes && git add -A && git commit -m "weekly: week <N> summary"`
