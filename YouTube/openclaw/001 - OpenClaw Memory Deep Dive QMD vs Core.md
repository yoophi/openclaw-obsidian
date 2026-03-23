---
title: "OpenClaw Memory Deep Dive: QMD vs Core"
source: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
youtube_id: "4QH0vHr-vFU"
playlist: "모두 재생"
channel: "Openclaw Labs"
duration: "7:35"
playlist_index: 1
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:41:21 +0900"
---

    # OpenClaw Memory Deep Dive: QMD vs Core

    - Playlist: 모두 재생
    - Index: 1
    - Channel: Openclaw Labs
    - Duration: 7:35
    - URL: https://www.youtube.com/watch?v=4QH0vHr-vFU

    ## Summary

    ## OpenClaw memory: what actually lives where and when to use QMD vs Memory Core

*Most people think OpenClaw has one memory system. It doesn't.* The video’s core point: your agent’s memories are plain markdown files (a long-term memory markdown plus a dated memory folder) and retrieval is a separate layer that decides how the agent finds those notes. *Open cloud memory is plain markdown files sitting in your agent workspace and that's it.* That means changing retrieval doesn’t move or rewrite your notes—only how the system searches them.

Memory Core is the built-in default retrieval layer: it indexes your markdown notes, watches files for updates, ranks results, and exposes two primitives the agent uses—memory.search (semantic discovery by meaning) and memory.get (open a specific file or section). It’s designed to stay fast as memory grows and works out of the box for most users because it handles indexing and incremental refresh automatically.

QMD is an experimental, local-first retrieval backend that replaces the search engine while leaving the markdown source files untouched. It combines multiple approaches (keyword matches, semantic similarity, and re-ranking) to surface stronger matches, but it’s off by default and requires manual setup: enable it by setting memory.backend to QMD in OpenClaw.json or via your agent, install the QMD tool on the same machine as the OpenClaw gateway (ensure the QMD command is available), and confirm SQLite support. A crucial dependency for semantic search is an embedding provider; OpenClaw will try providers in this order: a local embedding model, OpenAI, Gemini, Voyage, then Mistral—if none are available semantic memory search will be disabled (the agent can still open explicit memory files, but loses semantic recall). Note that some chat models (for example, Anthropic) are not used as embedding providers by default, so you may need to add a separate embedding provider.

QMD vs Mem: QMD is strictly a better search engine for the same native markdown memory inside OpenClaw. Mem is a fuller, external memory platform that stores, queries, and serves memories across systems (APIs, SDKs, metadata filters, graph-style memory). Recommendation from the video: stick with Memory Core as the solid default; enable QMD when your memory set or search quality justifies the extra setup; consider Mem only if you need an independent, cross-application memory layer.
