---
youtube_id: "XmweZ4fLkcI"
title: "I Built a Safer OpenClaw Alternative Using Claude Code"
channel: "Cole Medin"
publish_date: "2026-02-11T17:00:43-08:00"
original_url: "https://www.youtube.com/watch?v=XmweZ4fLkcI"
thumbnail: "https://i.ytimg.com/vi/XmweZ4fLkcI/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# I Built a Safer OpenClaw Alternative Using Claude Code

## 영상 정보
- 채널: Cole Medin
- 게시일: 2026-02-11T17:00:43-08:00
- 원본 URL: https://www.youtube.com/watch?v=XmweZ4fLkcI
- 썸네일: https://i.ytimg.com/vi/XmweZ4fLkcI/maxresdefault.jpg

## 한글 요약
OpenClaw is presented as a breakthrough personal AI assistant, but the creator warns it’s also dangerously exposed: the repo blew up to 185,000 stars while researchers found a *"one-click remote code execution vulnerability"* and hundreds of malicious packages in its public skills marketplace. Key problems are architectural (credentials stored in plain text, easy token exfiltration) and the large, opaque codebase that gives agents too much power; a researcher reportedly hijacked an instance in under two hours. The video’s core claim is that you can keep the useful ideas while avoiding those risks by building a smaller, controlled replica yourself.

The author rebuilt OpenClaw’s four magic components—markdown-driven memory, a scheduled “heartbeat” proactive worker, channel adapters, and a skills system—using a coding agent (Claude Code), markdown files (soul.md, memory.mmd, agents.mmd), SQLite/SQLite-based RAG plus Postgres for deployment, Obsidian for local sync, and a 30-minute heartbeat job. Adapters were kept minimal (Slack + terminal), and skills live locally rather than pulled from a public registry, reducing exposure; the replica took a couple of days and a few thousand lines of Python to implement. The result aims to preserve the agent’s strengths—*“it is able to remember our decisions, preferences, and context.”*—while restoring control over security and customization.
