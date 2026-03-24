---
youtube_id: "4QH0vHr-vFU"
title: "OpenClaw Memory Deep Dive: QMD vs Core"
channel: "Openclaw Labs"
publish_date: "2026-03-22T15:30:01-07:00"
original_url: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
thumbnail: "https://i.ytimg.com/vi/4QH0vHr-vFU/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# OpenClaw Memory Deep Dive: QMD vs Core

## 영상 정보
- 채널: Openclaw Labs
- 게시일: 2026-03-22T15:30:01-07:00
- 원본 URL: https://www.youtube.com/watch?v=4QH0vHr-vFU
- 썸네일: https://i.ytimg.com/vi/4QH0vHr-vFU/maxresdefault.jpg

## 한글 요약
## OpenClaw memory: core vs QMD — quick take
OpenClaw stores memory as plain Markdown files (a curated long-term memory file plus a dated memory folder) and the retrieval layer is separate from the files themselves. *"Memory and memory retrieval are two completely different things."* The default Memory Core is a built-in indexer that scans those files, ranks results, watches for file changes, and exposes two actions: a semantic memory search (find relevant notes) and memory.get (open a specific note or section). For most users this gives a fast, reliable retrieval layer with minimal setup.

QMD is not a different storage system — it replaces the search engine only, using a multi-step pipeline (keyword matches + semantic similarity + re-ranking) to surface stronger matches for larger or search-sensitive memories. Enabling QMD requires setting memory.backend to QMD in OpenClaw.json, installing the QMD tool on the same host as your gateway, and ensuring SQLite support; you also need a working embedding provider because semantic search depends on embeddings (OpenClaw checks local model → OpenAI → Gemini → Voyage → Mistral). *"Your memory is by default not a database or a plugin."* If you want a separate, cross-platform memory layer with APIs/graph features, consider a standalone memory platform instead; otherwise stick with Memory Core until search quality or scale motivates QMD.
