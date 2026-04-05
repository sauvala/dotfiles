---
name: note-add
description: Use when the user wants to create a new note, capture knowledge, or save information to their zettelkasten
---

# Create a Note

Create a new note in the zettelkasten at `~/Documents/notes/`.

## Process

1. Ask the user what the note is about (or use context from the conversation)
2. Generate a denote-compatible filename: `YYYYMMDDTHHMMSS--slug-title__tag1_tag2.md`
   - Timestamp: current time
   - Slug: lowercase, hyphens, no special chars
   - Tags: underscore-separated after `__`
3. Write the note with YAML frontmatter:

```yaml
---
title: <Title>
date: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
tags: [tag1, tag2]
identifier: <YYYYMMDDTHHMMSS>
---
```

4. Write the content based on user's description
5. Run `notes search` and `notes related` to find existing notes that connect to this one
6. Add a `## Related` section at the bottom with markdown links to related notes
7. Add a backlink to this new note in the `## Related` section of each related note (create the section if it doesn't exist). Update the `updated` field in those notes to today's date.
8. Commit all changed files:

```bash
cd ~/Documents/notes && git add -A && git commit -m "note: <title>"
```

## Tag conventions

- Type: daily, meeting, spec, recipe, bookmark, reference
- Project: use project-specific names
- Topic: freeform descriptors

## Linking format

Standard markdown: `[Title](YYYYMMDDTHHMMSS--slug__tags.md)`
