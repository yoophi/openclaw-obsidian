---
youtube_id: "NikOrMAbg-s"
title: "OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security"
channel: "scrollypedia"
publish_date: "2026-02-20T07:00:45-08:00"
original_url: "https://www.youtube.com/watch?v=NikOrMAbg-s"
thumbnail: "https://i.ytimg.com/vi/NikOrMAbg-s/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gFigTMA8=&rs=AOn4CLANx5w3Eh635pQfow_h9spWtaIn0A"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security

## 영상 정보
- 채널: scrollypedia
- 게시일: 2026-02-20T07:00:45-08:00
- 원본 URL: https://www.youtube.com/watch?v=NikOrMAbg-s
- 썸네일: https://i.ytimg.com/vi/NikOrMAbg-s/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gFigTMA8=&rs=AOn4CLANx5w3Eh635pQfow_h9spWtaIn0A

## 한글 요약
## OpenClaw architecture — quick explainer

OpenClaw is an open-source AI agent that runs locally and connects multiple messaging platforms through a single websocket gateway, then does the “thinking” in a five-stage agent runtime (session resolve, workspace bootstrap, context assembly, LLM invoke, tool execution). The gateway emits six event types (agent, chat, presence, health, heartbeat, cron), supports multi-agent routing so different channels can use different agent personalities, and the runtime uses a hybrid memory search (semantic + keyword) with automatic context spill-to-disk. It’s model-agnostic with provider failover and integrates browser automation (CDP), a separate Canvas UI server (A2UI) for interactive HTML-driven UIs, mobile/desktop companions, and voice wake. *"It runs as a background process on your machine"* and the system ships with 100+ bundled skills and a rapidly growing community hub.

That growth has a major security downside: the ecosystem ballooned (180,000 GitHub stars in under three weeks; Claw Hub grew to ~10,700 skills from 2,857 in late January), but scans found widespread vulnerabilities — a study of ~3,900 skills reported 36.8% with at least one flaw and 13.4% critical, and 91% of malicious skills mixed prompt injection with traditional malware. Skills run with the agent’s privileges — *"Skills inherit the full permissions of the agent they extend"* — and attackers delivered credential-stealers and API-key harvesters, used memory poisoning to alter long-term agent behavior (targeting soul.md and memory.md), and exploited critical sandbox escapes. The takeaway: powerful local agents plus open extension marketplaces enable rich automation, but supply-chain and persistent-memory risks make security-first design essential.
