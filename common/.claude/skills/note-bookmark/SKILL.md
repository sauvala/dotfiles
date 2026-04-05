---
name: note-bookmark
description: Use when the user wants to save a URL, bookmark a web page, save a link to a video, article, tweet, reddit post, or GitHub repo
---

# Bookmark a URL

Save an external resource as a note in `~/Documents/notes/`.

## Process

1. Parse the URL and optional "quick" flag from user input
2. Detect source type from URL domain:
   - youtube.com, youtu.be -> video
   - reddit.com -> reddit
   - github.com -> github
   - news.ycombinator.com -> hackernews
   - twitter.com, x.com -> tweet
   - Otherwise -> article
3. Fetch the page content using WebFetch
4. Generate the note:

### Full mode (default)

- Extract the page title
- Write a 2-3 sentence summary
- Extract 3-5 key points
- Choose relevant tags (always include `bookmark` + source_type + topic tags)

### Quick mode (user says "quick")

- Extract just the title
- Write a one-line description
- Tags: `bookmark` + source_type

### Note structure

Filename: `<YYYYMMDDTHHMMSS>--<slug-from-title>__bookmark_<source_type>_<topic_tags>.md`

```markdown
---
title: <Page title>
date: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
tags: [bookmark, <source_type>, <topic_tags>]
identifier: <YYYYMMDDTHHMMSS>
url: <original URL>
source_type: <article|video|reddit|github|hackernews|tweet|podcast>
---

## Summary
<2-3 sentence summary>

## Key Points
- point 1
- point 2
- point 3

## Related
- [Related note](filename.md)
```

5. Auto-link: search for related notes and add links (same process as /note-add)
6. Commit:

```bash
cd ~/Documents/notes && git add -A && git commit -m "bookmark: <title>"
```

## Source-specific tips

- **YouTube:** Try to extract transcript context. Fall back to title + description.
- **Reddit:** Capture the post body and notable top comments.
- **GitHub repos:** Summarize the README and repo purpose.
- **HN:** Capture the linked article, not just the HN comments.
- **Twitter/X:** May fail due to auth walls. If fetch fails, tell the user and ask them to paste the content.
