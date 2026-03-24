---
youtube_id: "5WIb0RZ_dqY"
title: "OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team"
channel: "Devs Kingdom"
publish_date: "2026-02-24T18:51:13-08:00"
original_url: "https://www.youtube.com/watch?v=5WIb0RZ_dqY"
thumbnail: "https://i.ytimg.com/vi/5WIb0RZ_dqY/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team

## 영상 정보
- 채널: Devs Kingdom
- 게시일: 2026-02-24T18:51:13-08:00
- 원본 URL: https://www.youtube.com/watch?v=5WIb0RZ_dqY
- 썸네일: https://i.ytimg.com/vi/5WIb0RZ_dqY/maxresdefault.jpg

## 한글 요약
## OpenClaw subagents: what they are and how to use them

A subagent is a background agent spawned from an existing agent within the same session; agents are equal by definition but become parent/child depending on the call order. Each subagent run carries a session ID composed of the caller’s agent ID and the subagent UUID, and when a subagent finishes it returns its response to the requester’s chat channel. *"it is a background agent that runs spawned from an existing agent run"* *"when finished announce their result back to the requesttor chat channel"*

Setup and operation: register agents in your workspace and place the default (lead/orchestrator) agent at the top of the agents list. In the agent’s config include a sub_agent list (only those listed can be spawned from that agent) and set sub agent max spawn depth in openclaw.json (depth 1 = one-level subagent, depth 2 = subagent-of-subagent). Customize each agent via its soul and playbook markdown files plus workspace folders (agents, bootstrap, identity, tools, workflow automation). To test, use the OpenClaw TUI (openclaw tui), invoke slash commands, and run "sub agent spawn <agent_id>" to create a writer/researcher/etc. as a subagent; the spawned agent runs in the same session and returns its output to the calling agent’s channel.
