---
youtube_id: "9Svv-n11Ysk"
title: "I Replaced OpenClaw With Claude Code in One Day"
channel: "Mark Kashef"
publish_date: "2026-02-24T11:30:01-08:00"
original_url: "https://www.youtube.com/watch?v=9Svv-n11Ysk"
thumbnail: "https://i.ytimg.com/vi/9Svv-n11Ysk/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# I Replaced OpenClaw With Claude Code in One Day

## 영상 정보
- 채널: Mark Kashef
- 게시일: 2026-02-24T11:30:01-08:00
- 원본 URL: https://www.youtube.com/watch?v=9Svv-n11Ysk
- 썸네일: https://i.ytimg.com/vi/9Svv-n11Ysk/maxresdefault.jpg

## 한글 요약
## I Replaced OpenClaw With Claude Code in One Day

The creator demonstrates a local "Claude Code" setup that replaces OpenClaw by running a Claude subprocess on a personal desktop and bridging it to Telegram via Anthropics’ agent SDK, giving remote, multimodal access (video, voice, images) to the same skills already installed locally. He shows a live demo where a short video is uploaded and, after ~30–40 seconds, Claude returns a scene interpretation; the end-to-end message pipeline (Telegram → API → media handler → agent SDK → memory injection → Claude subprocess → response formatting → Telegram) can complete routine queries in seconds. *It's just as good if not better than openclaw out of the box.* 

Key engineering details: memory is layered—session IDs for conversation persistence, SQLite plus vector-based semantic memory and episodic decay for long-term context, and a context-injection step that searches top memories before each response. The agent SDK spawns a local Claude subprocess so tool calls and cron jobs (proactive scheduling) run on your machine; that creates a single unified runtime for desktop and mobile use. Setup is automated by a "mega prompt" wizard that asks preferences (voice engine, memory type, feature toggles) and can clone repos or reconfigure services; the author notes other CLI-capable models could substitute for Claude. *you have one unified system, one unified AI operating system*
