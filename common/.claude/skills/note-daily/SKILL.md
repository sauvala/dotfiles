---
name: note-daily
description: Use when the user wants to create or update their daily work log, review what they did today or on another day
---

# Daily Work Log

Create or update a daily work log in `~/Documents/notes/`.

## Process

1. Determine the target date:
   - No argument -> today
   - "yesterday" -> yesterday's date
   - A specific date -> that date
2. Check if a daily note already exists: `notes list --tags daily --since <date> --until <date>`
3. If it exists, read it with `notes get <identifier>`

### Auto-populate from GitHub

Query the user's GitHub activity for the target date. Config is in `~/Documents/notes/CLAUDE.md`.

```bash
# PRs authored
gh search prs --author=sauvala --created=<date> --json number,title,repository

# PRs reviewed
gh search prs --reviewed-by=sauvala --updated=<date> --json number,title,repository

# PRs commented on
gh search prs --commenter=sauvala --updated=<date> --json number,title,repository
```

Filter results to configured orgs/repos from CLAUDE.md.

### Auto-populate from git

For each configured local repo path, run:

```bash
git -C <repo-path> log --author=sauvala --after="<date> 00:00" --before="<date+1> 00:00" --oneline
```

### Find notes created that day

```bash
notes list --since <date> --until <date>
```

### Build the daily note

Filename: `<YYYYMMDD>T170000--<YYYY-MM-DD>__daily.md`

```markdown
---
title: <YYYY-MM-DD>
date: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
tags: [daily]
identifier: <YYYYMMDD>T170000
---

## What I worked on
- (inferred from commits and PRs, user can add more)

## PRs
- **Authored:** owner/repo#N -- title
- **Reviewed:** owner/repo#N -- title
- **Commented:** owner/repo#N -- title

## Meetings
- (link to meeting notes created today, or user-provided)

## Notes created today
- [Title](filename.md)

## Observations
- (user-provided)
```

### Updating existing daily notes

When the note already exists:
1. Re-run GitHub/git queries
2. Compare with existing content
3. Add any new items not already present
4. Show the user what was added
5. Update the `updated` frontmatter field
6. Ask if the user wants to add or change anything

### Commit

```bash
cd ~/Documents/notes && git add -A && git commit -m "daily: <YYYY-MM-DD>"
```
