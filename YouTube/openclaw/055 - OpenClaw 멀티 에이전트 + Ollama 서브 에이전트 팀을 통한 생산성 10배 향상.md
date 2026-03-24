---
youtube_id: "kRoEl9P6-ig"
title: "PicoClaw + Ollama + GLM-4.7-Flash: Ultra-Efficient Local OpenClaw Fork"
channel: "Devs Kingdom"
publish_date: "2026-02-18T17:31:53-08:00"
original_url: "https://www.youtube.com/watch?v=kRoEl9P6-ig"
thumbnail: "https://i.ytimg.com/vi/kRoEl9P6-ig/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# PicoClaw + Ollama + GLM-4.7-Flash: Ultra-Efficient Local OpenClaw Fork

## 영상 정보
- 채널: Devs Kingdom
- 게시일: 2026-02-18T17:31:53-08:00
- 원본 URL: https://www.youtube.com/watch?v=kRoEl9P6-ig
- 썸네일: https://i.ytimg.com/vi/kRoEl9P6-ig/maxresdefault.jpg

## 한글 요약
## PicoClaw: tiny OpenClaw fork with Ollama + GLM-4.7-Flash

This clip demonstrates PicoClaw, a minimalist OpenClaw fork written in Go that aims for extreme efficiency: *"it is written in go."* The presenter shows it can run on very low-end hardware—*"it basically can run on a $10 hardware and 10 megabytes RAM"*—and walks through the setup in a notebook/IDE environment, covering installation of Go, the Ollama/llama runtime with GLM-4.7-flash, and cloning PicoClaw’s repo. Configuration notes: set the provider to "openai" with model "GLM-4.7-flash", point the API base to "/1", and supply the API key either under the provider or in the session to use the compatible endpoint.

Hands-on testing is shown using both interactive and agent modes (session-based). The demo runs simple prompts to verify the model, lists built-in skills (GitHub, skill creator, samurai, tool, weather), and uses the skill creator to generate a native skill and to edit files inside a confined workspace (file writes are restricted to the workspace folder for security). Examples include adding an example.md and creating a "remote" skill scaffold for motion-video creation, with the new skill appearing as a folder containing the expected skill.md and files. Overall the video is a concise how-to for installing PicoClaw, wiring it to GLM-4.7-flash, and exercising its basic agent/skill workflow.
