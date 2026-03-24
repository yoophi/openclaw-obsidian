---
youtube_id: "Bo4Shk2FCvk"
title: "How OpenClaw Works (and why you should build your own)"
channel: "Agentic Lab"
publish_date: "2026-02-23T18:55:00-08:00"
original_url: "https://www.youtube.com/watch?v=Bo4Shk2FCvk"
thumbnail: "https://i.ytimg.com/vi/Bo4Shk2FCvk/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# How OpenClaw Works (and why you should build your own)

## 영상 정보
- 채널: Agentic Lab
- 게시일: 2026-02-23T18:55:00-08:00
- 원본 URL: https://www.youtube.com/watch?v=Bo4Shk2FCvk
- 썸네일: https://i.ytimg.com/vi/Bo4Shk2FCvk/maxresdefault.jpg

## 한글 요약
## How OpenClaw works — concise summary

*OpenClaw is an AI agent that's taken the world by storm.* At its core OpenClaw wraps a large language model with an exoskeleton of services: a 24/7 gateway for chat channels, JSONL session persistence, a compaction system that summarizes old chat chunks when context exceeds limits, system prompts (soul.md and personality files), RAG-style memory plus a memory.mmd file, and tool schemas that let the model call external actions. The agent runs an "agentic loop" where the LLM emits tool calls, tools execute actions (browser/terminal/camera control via a relay), return results, and the model decides next steps; autonomy is driven by a 30-minute heartbeat file the agent can edit, plus cron jobs and webhooks that wake the agent with context.

OpenClaw’s strength is generality, but that generalism creates heavy, growing context overhead: the presenter shows an initial fixed overhead of about 7,000 tokens that can swell to ~45,000 tokens after routine use, causing context rot and up to ~40% measured performance loss; by contrast a single-purpose "sniper" agent may only need ~1,400 tokens. Tool and memory bloat can push performance decreases into the 50–90% range and add material cost (an example cited is roughly $0.52 extra per message) while causing catastrophic forgetting from truncation and hard limits; the speaker therefore recommends building narrow, purpose-built agents and practicing context hygiene rather than relying on a one-size-fits-all harness. *Agents are comprised of four categories.*
