---
youtube_id: "ad_OU6jZXbI"
title: "Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)"
channel: "Vibe with AI"
publish_date: "2026-02-27T04:04:10-08:00"
original_url: "https://www.youtube.com/watch?v=ad_OU6jZXbI"
thumbnail: "https://i.ytimg.com/vi/ad_OU6jZXbI/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)

## 영상 정보
- 채널: Vibe with AI
- 게시일: 2026-02-27T04:04:10-08:00
- 원본 URL: https://www.youtube.com/watch?v=ad_OU6jZXbI
- 썸네일: https://i.ytimg.com/vi/ad_OU6jZXbI/maxresdefault.jpg

## 한글 요약
## What the video shows
The creator turns a Mac Mini into a 24/7 AI “chief of staff” named Henry, powered by Claude Opus 4.6, reachable via Telegram and a web UI. The stack: OpenClaw installed natively as the orchestration gateway, Docker to sandbox each agent’s execution, and Tailscale for encrypted remote access; the Mac runs under a fresh, separate user account with screen sharing enabled so the owner can administer it headless. *"Henry is here. Chief of staff, friendly online, and ready to roll."*

The walkthrough covers the practical install steps and security reasoning: enable VNC screen sharing and note the Mini’s IP, connect from your main Mac via Finder, install Xcode/Git and Homebrew, install Docker Desktop, then run the OpenClaw oneliner and supply the Opus API key; create a Telegram bot through BotFather and paste its token into OpenClaw so messages route to the agent. The presenter stresses isolation—each agent runs in its own container with only the keys it needs so prompt injection or a rogue agent is confined—and previews the next episode where Henry will gain a team (research, coding, security) and automated briefs.
