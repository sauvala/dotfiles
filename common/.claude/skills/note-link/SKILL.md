---
name: note-link
description: Use when the user wants to update links between notes, re-scan for connections, or fix missing links in their zettelkasten
---

# Re-scan and Update Note Links

Update the `## Related` sections across notes in `~/Documents/notes/`.

## Modes

### Single note: `/note-link <search term>`

1. Find the target note: `notes search "<term>"` or `notes get <id>`
2. Read the target note's content and tags
3. Use `notes related <id>` to find candidates
4. Read candidate notes to verify relevance
5. Update the target note's `## Related` section (replace if exists, create if not)
6. Add backlinks in each related note's `## Related` section
7. Update `updated` field in all modified notes
8. Commit: `cd ~/Documents/notes && git add -A && git commit -m "link: update links for <title>"`

### Full re-scan: `/note-link all`

1. List all notes: `notes list --limit 9999`
2. For each note, find related notes using shared tags and content analysis
3. Rebuild all `## Related` sections
4. Preserve any manually-added links that still point to existing notes
5. Update `updated` field in all modified notes
6. Commit as a single commit: `cd ~/Documents/notes && git add -A && git commit -m "link: full re-scan of all note links"`

## Relevance criteria

1. Same project tag -> strongly related
2. Multiple shared tags -> likely related
3. One shared tag -> possibly related (read content to confirm)
4. Title/content keyword overlap -> possibly related

## Link format

Standard markdown: `[Note Title](YYYYMMDDTHHMMSS--slug__tags.md)`
