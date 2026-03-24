---
youtube_id: "Uuke9w4lAeA"
title: "I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)"
channel: "SoftwareGent"
publish_date: "2026-03-03T03:41:36-08:00"
original_url: "https://www.youtube.com/watch?v=Uuke9w4lAeA"
thumbnail: "https://i.ytimg.com/vi/Uuke9w4lAeA/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)

## 영상 정보
- 채널: SoftwareGent
- 게시일: 2026-03-03T03:41:36-08:00
- 원본 URL: https://www.youtube.com/watch?v=Uuke9w4lAeA
- 썸네일: https://i.ytimg.com/vi/Uuke9w4lAeA/maxresdefault.jpg

## 한글 요약
## Summary
The video shows how the creator rebuilt an OpenClaw-style chatbot that runs locally for free by combining two coding agents: Antigravity (for agentic features, testing, and access to Opus 4.6) and OpenCode (for broad model selection and efficient code execution). The build process: install Antigravity, OpenCode, Node.js and Docker; clone the OpenClaw repo; use Antigravity + Opus 4.6 to generate a phased implementation plan; then run OpenCode with the free Minimax M2.5 model to generate the app code (the run reported ~24,000 context tokens used and $0 cost). The video demonstrates handing the plan back to Antigravity/OpenCode so the agents create files, install dependencies, and run the project end-to-end. *"I'm functionally within normal parameters"*

Key features implemented and tested: Telegram integration (bot token), a locally hosted LLM via Olama (so no external API fees), Whisper for voice transcription, and a Supabase RAG memory backend that stores messages and facts so the bot can recall user details. The creator shows the bot remembering “I am 23 years old” and later answering *"you are 23 years young"*. They also add cron-job scheduling (reminders), MCP integrations by routing third‑party services through Zapier/N8n, a customizable system prompt/personality (short, blunt replies), and a simple web front end served on localhost. The result is a fully functional, extensible OpenClaw clone that can run locally at zero API cost while retaining agent-driven automation and third‑party connectivity.
