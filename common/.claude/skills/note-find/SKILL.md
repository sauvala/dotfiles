---
name: note-find
description: Use when the user wants to search, find, or look up notes in their zettelkasten
---

# Find Notes

Search the zettelkasten at `~/Documents/notes/`.

## Process

1. Parse the user's query to determine search strategy
2. Use the `notes` CLI to search:
   - By keyword: `notes search "<query>"`
   - By tag: `notes list --tags <tags>`
   - By date: `notes list --since <date> --until <date>`
   - By type: `notes list --type <type>`
   - Combine filters as needed
3. Present results as a concise list with title, date, and tags
4. If the user wants to read a specific note, use `notes get <identifier>`
5. Offer to show related notes via `notes related <identifier>`

## Examples

- "find meeting notes for projectx" -> `notes search "meeting" --tags projectx`
- "what did I write last week" -> `notes list --since 2026-03-29 --until 2026-04-04`
- "anything about auth" -> `notes search "auth"`
- "show my bookmarks" -> `notes list --type bookmark`
