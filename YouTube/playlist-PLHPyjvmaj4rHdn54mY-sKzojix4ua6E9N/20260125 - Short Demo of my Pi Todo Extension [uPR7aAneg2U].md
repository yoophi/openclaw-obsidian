---
youtube_id: "uPR7aAneg2U"
title: "Short Demo of my Pi Todo Extension"
channel: "Armin Ronacher"
publish_date: "2026-01-25T11:29:28-08:00"
original_url: "https://www.youtube.com/watch?v=uPR7aAneg2U"
thumbnail: "https://i.ytimg.com/vi/uPR7aAneg2U/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AHMCIAC0AWKAgwIABABGDIgWyhyMA8=&rs=AOn4CLA_zWvF8DEb2eclcBqn2Ye978_uDg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/armin-ronacher
  - date/2026-01-25
  - topic/general
---

# Short Demo of my Pi Todo Extension

## 영상 정보
- 채널: Armin Ronacher
- 게시일: 2026-01-25T11:29:28-08:00
- 원본 URL: https://www.youtube.com/watch?v=uPR7aAneg2U
- 썸네일: https://i.ytimg.com/vi/uPR7aAneg2U/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AHMCIAC0AWKAgwIABABGDIgWyhyMA8=&rs=AOn4CLA_zWvF8DEb2eclcBqn2Ye978_uDg

## 한글 요약
## Short demo of a Pi “to-dos” extension

This clip shows a lightweight Pi extension that adds persistent issue-tracking for Pi agents, modeled after Claude’s task tool. The extension does two things: *"it adds a to-do tool to the agent so that the agent can read and write and update to-dos"* and it exposes a /todos UI so you can view and manage records the agent creates. To-dos are stored as files with a JSON header plus body, can be created naturally during agent conversations, and the UI supports viewing, refining, assigning/claiming, closing, and copying paths to the clipboard.

The presenter demonstrates a workflow: drop quick notes as to-dos while working, refine a ticket (the agent scavenges the codebase, asks follow-up questions, and expands the item), then dispatch an agent to work on it; refined tickets contain more context for automated work. The system supports a simple lock so only one agent can claim an item at a time (useful for multi-agent setups), but the author notes it doesn’t always auto-claim items and some manual validation is needed. Overall the tool is a small, integrated plugin—both a UI and an agent-accessible tool—intended as a building block for agentic issue tracking; the presenter’s experience is mixed but sees the feature as necessary for agentic workflows. *"it is both in a user interface and it is also a tool to the agent itself."*
