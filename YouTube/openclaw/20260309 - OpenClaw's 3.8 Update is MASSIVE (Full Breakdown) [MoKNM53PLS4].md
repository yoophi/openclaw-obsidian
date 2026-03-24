---
youtube_id: "MoKNM53PLS4"
title: "OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)"
channel: "Jay E | RoboNuggets"
publish_date: "2026-03-09T23:11:30-07:00"
original_url: "https://www.youtube.com/watch?v=MoKNM53PLS4"
thumbnail: "https://i.ytimg.com/vi/MoKNM53PLS4/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)

## 영상 정보
- 채널: Jay E | RoboNuggets
- 게시일: 2026-03-09T23:11:30-07:00
- 원본 URL: https://www.youtube.com/watch?v=MoKNM53PLS4
- 썸네일: https://i.ytimg.com/vi/MoKNM53PLS4/maxresdefault.jpg

## 한글 요약
## OpenClaw 3.8 — key changes and whether it’s worth a watch

This release (3.7 + 3.8) is framed as the biggest OpenClaw update so far: hints of a native iOS app (voice, QR-based connection, basic dashboard), Telegram topic routing so one group can route distinct topics to different agents/models/prompts/skills, and finer control over which skills and system prompts run per topic. Topic routing isolates context per thread, which reduces confusion when many skills are loaded—*each topic will get its own isolated session, its own isolated memory and workspace*. You can set default models per topic and tailor skills/prompts to fit admin, content, or development workflows.

The update also targets the hard problem of context compaction: you can mark sections to survive post-compaction, install plugins to change how histories are summarized (examples include an open-source “lossless claw”), and choose how many recent turns are preserved. That’s directly relevant after reports of agents losing early safety instructions during compaction and acting on destructive tasks; recommended mitigations in the video include not giving agents direct access to your primary email, using isolated workspaces, and aborting running actions with the backslash command /s stop. Backup and recovery improved too: use *openclaw backup create* and *openclaw backup verify* to archive and validate full agent state. The release adds model options (Gemini 3.1 flashlight, GPT 5.4), more advanced search filters in Perplexity, and multiple security hardening fixes; roughly 200 contributors worked on the update, signaling active community momentum.
