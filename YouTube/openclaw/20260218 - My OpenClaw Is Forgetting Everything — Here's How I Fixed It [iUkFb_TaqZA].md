---
youtube_id: "iUkFb_TaqZA"
title: "My OpenClaw Is Forgetting Everything — Here's How I Fixed It"
channel: "Dave Swift"
publish_date: "2026-02-18T09:19:30-08:00"
original_url: "https://www.youtube.com/watch?v=iUkFb_TaqZA"
thumbnail: "https://i.ytimg.com/vi/iUkFb_TaqZA/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# My OpenClaw Is Forgetting Everything — Here's How I Fixed It

## 영상 정보
- 채널: Dave Swift
- 게시일: 2026-02-18T09:19:30-08:00
- 원본 URL: https://www.youtube.com/watch?v=iUkFb_TaqZA
- 썸네일: https://i.ytimg.com/vi/iUkFb_TaqZA/maxresdefault.jpg

## 한글 요약
## Summary
This video shows how the creator fixed OpenClaw’s unreliable “persistent memory” by connecting the agent to an Obsidian vault so notes become a durable, searchable memory store. The core claim: OpenClaw alone won’t reliably remember long-form notes out of the box, but pointing its memory/indexer at a local Obsidian folder gives you structured, synced, and editable memory that the agent can read, write, and reason over. *"It doesn't work, at least out of the box in that capacity."*

The walkthrough covers the practical steps: install Obsidian and create a vault (a folder of Markdown files), design or import a file structure (the agent itself can expand a template and create folders/files), choose where to store the vault (local drive, synced network drive, or cloud sync/Tailscale for remote access), and then edit OpenClaw’s user config JSON to replace the default memory block with a memory connector pointing to the vault path. Important tips shown: back up the config before editing, don’t include extra brackets or stray commas, restart the agent to trigger indexing, and avoid spaces in the vault name (he had indexing fail until renaming). After indexing, the agent successfully searched notes, created a project note (“astronaut path”), and summarized thinking-patterns from the vault. *"He lives under my stairs in an M1 Mac Mini that's been laying around collecting dust for years at this point."*

Security and convenience notes: if OpenClaw uses cloud LLMs, your vault content may be exposed to that provider; local-only setups reduce that risk. The presenter also points out the agent can fix or edit its own config if you prefer not to change JSON yourself.
