---
title: "OpenClaw Memory Deep Dive: QMD vs Core"
source: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
original_url: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
youtube_id: "4QH0vHr-vFU"
playlist: "📙 openclaw"
channel: "Openclaw Labs"
duration: "7:35"
publish_date: "2026-03-22T15:30:01-07:00"
playlist_index: 1
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:43:33 +0900"
---

# OpenClaw Memory Deep Dive: QMD vs Core

## Video Info

- Original URL: https://www.youtube.com/watch?v=4QH0vHr-vFU
- Channel: Openclaw Labs
- Title: OpenClaw Memory Deep Dive: QMD vs Core
- Published: 2026-03-22T15:30:01-07:00
- Duration: 7:35
- Playlist: 📙 openclaw
- Playlist Index: 1

## Description

🧠 Want the full memory guide + community support?
Join the Skool community here → https://www.skool.com/openclawlabs

Most people think Openclaw memory is a database — it's not. It's Markdown files. And once you understand that, everything changes.
In this video, I break down exactly how Openclaw memory works under the hood: what it actually stores, the difference between memory-core (the default) and QMD (the advanced local-first search engine), and the #1 setup mistake that silently kills your agent's ability to remember anything — your embedding provider.

If your agent keeps forgetting context, losing leads, or giving you stale answers, this video is why.

What you'll learn:
✅ The real structure of Openclaw memory (MEMORY.md + daily notes)
✅ Memory-core vs QMD — which one you actually need
✅ How to enable QMD step-by-step
✅ QMD vs Mem0 — when to use each
✅ Why Anthropic users MUST configure a separate embedding provider
✅ How to verify your memory system is actually working

Chapters:
0:00 - Why most people have Openclaw memory wrong
0:25 - What Openclaw memory actually is (Markdown files)
1:05 - Memory-core: the default retrieval system
2:25 - QMD: advanced local-first search
3:25 - How to set up QMD step-by-step
4:40 - QMD vs Mem0: which one to choose
5:45 - Embedding providers (the hidden requirement)
6:55 - How to verify your setup

#Openclaw #AIAgents #AIAutomation #OpenclawMemory #AIWorkflow

## Summary

## OpenClaw memory: what actually lives where and when to use QMD vs Memory Core

*Most people think OpenClaw has one memory system. It doesn't.* The video’s core point: your agent’s memories are plain markdown files (a long-term memory markdown plus a dated memory folder) and retrieval is a separate layer that decides how the agent finds those notes. *Open cloud memory is plain markdown files sitting in your agent workspace and that's it.* That means changing retrieval doesn’t move or rewrite your notes—only how the system searches them.

Memory Core is the built-in default retrieval layer: it indexes your markdown notes, watches files for updates, ranks results, and exposes two primitives the agent uses—memory.search (semantic discovery by meaning) and memory.get (open a specific file or section). It’s designed to stay fast as memory grows and works out of the box for most users because it handles indexing and incremental refresh automatically.

QMD is an experimental, local-first retrieval backend that replaces the search engine while leaving the markdown source files untouched. It combines multiple approaches (keyword matches, semantic similarity, and re-ranking) to surface stronger matches, but it’s off by default and requires manual setup: enable it by setting memory.backend to QMD in OpenClaw.json or via your agent, install the QMD tool on the same machine as the OpenClaw gateway (ensure the QMD command is available), and confirm SQLite support. A crucial dependency for semantic search is an embedding provider; OpenClaw will try providers in this order: a local embedding model, OpenAI, Gemini, Voyage, then Mistral—if none are available semantic memory search will be disabled (the agent can still open explicit memory files, but loses semantic recall). Note that some chat models (for example, Anthropic) are not used as embedding providers by default, so you may need to add a separate embedding provider.

QMD vs Mem: QMD is strictly a better search engine for the same native markdown memory inside OpenClaw. Mem is a fuller, external memory platform that stores, queries, and serves memories across systems (APIs, SDKs, metadata filters, graph-style memory). Recommendation from the video: stick with Memory Core as the solid default; enable QMD when your memory set or search quality justifies the extra setup; consider Mem only if you need an independent, cross-application memory layer.
