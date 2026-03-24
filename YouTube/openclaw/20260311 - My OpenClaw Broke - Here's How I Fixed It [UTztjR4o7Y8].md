---
youtube_id: "UTztjR4o7Y8"
title: "My OpenClaw Broke - Here's How I Fixed It"
channel: "Sean Matthew"
publish_date: "2026-03-11T10:00:46-07:00"
original_url: "https://www.youtube.com/watch?v=UTztjR4o7Y8"
thumbnail: "https://i.ytimg.com/vi/UTztjR4o7Y8/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# My OpenClaw Broke - Here's How I Fixed It

## 영상 정보
- 채널: Sean Matthew
- 게시일: 2026-03-11T10:00:46-07:00
- 원본 URL: https://www.youtube.com/watch?v=UTztjR4o7Y8
- 썸네일: https://i.ytimg.com/vi/UTztjR4o7Y8/maxresdefault.jpg

## 한글 요약
## My OpenClaw Broke — Here's How I Fixed It
OpenClaw was “forgetting everything” because its compaction routine compresses entire conversation history into a generic summary, treating important facts the same as throwaway chatter. The practical fix is a memory-flush workflow that triggers a silent turn before compaction so the agent writes durable facts to a daily log on disk, plus context pruning (e.g., a 4‑hour window that keeps the last three assistant responses) so repeated compactions don’t lose newly written facts. Improve retrieval by switching from pure semantic search to QMD (hybrid semantic + exact matching) and force the agent—via agents.md—to check daily logs and a concise learnings.md file of one‑line rules whenever it performs a task. *The problem is it treats every single thing in that conversation history equally.*

A separate cost problem was the heartbeat: by default every 30 minutes it sends the full system prompt, memory and tool files as a full agent turn, burning tokens and money. Remedies: set active hours for heartbeats, enable light context so heartbeats only load heartbeat.md, and run heartbeats on a cheaper or local model; do a system‑prompt audit (use an agent like Claude Code to remove redundancy and trim bloated files) so each turn is leaner. Quick recap: enable memory flush, add context pruning, use QMD plus learnings.md for retrieval, fix heartbeat settings, and audit system prompt to restore stable, cheaper OpenClaw behavior. *The heartbeat is really what enables open claw to be more like a real-time agent.*
