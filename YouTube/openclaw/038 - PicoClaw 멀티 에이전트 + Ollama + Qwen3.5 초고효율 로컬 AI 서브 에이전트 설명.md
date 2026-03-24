---
youtube_id: "9CNEpIUZAmY"
title: "PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained"
channel: "Devs Kingdom"
publish_date: "2026-02-28T08:51:09-08:00"
original_url: "https://www.youtube.com/watch?v=9CNEpIUZAmY"
thumbnail: "https://i.ytimg.com/vi/9CNEpIUZAmY/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained

## 영상 정보
- 채널: Devs Kingdom
- 게시일: 2026-02-28T08:51:09-08:00
- 원본 URL: https://www.youtube.com/watch?v=9CNEpIUZAmY
- 썸네일: https://i.ytimg.com/vi/9CNEpIUZAmY/maxresdefault.jpg

## 한글 요약
## PicoClaw subagents: setup, test, and current limits

This tutorial shows how to enable PicoClaw’s new subagent feature, how to configure models and profiles, and how to test spawning subagents locally (example uses an OpenAI-compatible endpoint, Ollama and Qwen3.5/27B). Key config changes are: set restrict_to_workspace (default true) to false for testing, declare a subagent list with one agent marked *default = true* (the lead agent), and configure the model entries (model name, api_base, api_key). Installation steps covered: install Go, install Ollama/compatible model, clone PicoClaw repo and run make install, then run the agent CLI to send messages and view logs.

The demo spawns a research agent that should spawn a fast subagent to fetch Seattle weather; logs show the spawn succeeded but the parent can’t retrieve the child’s result: *successfully spawn a sub aent using the fast profile* and *but it cannot really find anything for that specific sub aent task.* Observations: the system creates an async/background subagent and runs workspace-level shell checks (ls, etc.), but there’s no separate visible process or built-in tool to wait for/collect the subagent’s output, so the lead agent falls back to performing the task itself. Practical notes: top-level orchestration (A calls B, A calls C) works for sequential agents, but nested chains where a subagent spawns another subagent do not reliably return results yet. The subagent implementation and sample test configs live in package.tools (recently added), so reviewers can inspect the new code and example configs in the repo.
