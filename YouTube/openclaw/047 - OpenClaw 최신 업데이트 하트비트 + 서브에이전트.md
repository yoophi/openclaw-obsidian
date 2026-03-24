---
youtube_id: "uKzcoFaaAhc"
title: "New OpenClaw Update: Heartbeat + Subagents"
channel: "Julian Goldie SEO"
publish_date: "2026-02-26T05:01:47-08:00"
original_url: "https://www.youtube.com/watch?v=uKzcoFaaAhc"
thumbnail: "https://i.ytimg.com/vi/uKzcoFaaAhc/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# New OpenClaw Update: Heartbeat + Subagents

## 영상 정보
- 채널: Julian Goldie SEO
- 게시일: 2026-02-26T05:01:47-08:00
- 원본 URL: https://www.youtube.com/watch?v=uKzcoFaaAhc
- 썸네일: https://i.ytimg.com/vi/uKzcoFaaAhc/maxresdefault.jpg

## 한글 요약
## New OpenClaw update: Heartbeat + Subagents

This update (25th February) restores heartbeat DMs so your assistant actually pings you again and overhauls how helper subagents deliver results, plus a set of security and reliability fixes. *Heartbeat DM deliveries back on.* The core user-facing change: heartbeat checks are on by default again (you can still toggle via the agent config), so you won’t be left “shouting into an empty room.”  

The subagent delivery pipeline was rebuilt as a state machine that retries and uses backup routes and only marks tasks complete when delivery is confirmed, fixing lost or falsely “delivered” messages (Telegram was singled out for a delivery-report bug). Slack thread handling and context inheritance were corrected to stop silent overflows and wrong routing, and there are improvements to startup performance, streaming/markdown handling, agent config, and DM delivery. To get the update you can enable automatic updates under Config → All Settings → Updates or trigger a manual upgrade; the presenter notes the gateway may pause briefly during upgrades and, in some cases, a reinstall resolves persistent failures. *The whole delivery process was rebuilt from scratch using what's called a state machine.*
