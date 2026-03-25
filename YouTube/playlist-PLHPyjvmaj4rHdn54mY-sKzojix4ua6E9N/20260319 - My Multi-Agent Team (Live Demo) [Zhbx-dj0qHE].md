---
youtube_id: "Zhbx-dj0qHE"
title: "My Multi-Agent Team (Live Demo)"
channel: "Owain Lewis"
publish_date: "2026-03-19T04:02:50-07:00"
original_url: "https://www.youtube.com/watch?v=Zhbx-dj0qHE"
thumbnail: "https://i.ytimg.com/vi/Zhbx-dj0qHE/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/owain-lewis
  - date/2026-03-19
  - topic/subagents
---

# My Multi-Agent Team (Live Demo)

## 영상 정보
- 채널: Owain Lewis
- 게시일: 2026-03-19T04:02:50-07:00
- 원본 URL: https://www.youtube.com/watch?v=Zhbx-dj0qHE
![My Multi-Agent Team (Live Demo)](https://i.ytimg.com/vi/Zhbx-dj0qHE/maxresdefault.jpg)

## 한글 요약
Polling-based multi‑agent worker — quick take

*In this video, I'm going to be showing you how you can build a team of autonomous AI agents that do work for you in the background.* The creator demos a simple, task‑manager‑driven architecture where a background worker polls a task queue, claims a ticket, creates a git worktree, delegates the implementation to a code‑capable model, runs tests and post‑checks, and opens a pull request for human review. The demo shows one worker completing a small bug fix end‑to‑end and then multiple workers handling separate tickets concurrently, with the worker polling every 60 seconds and reporting output back on the ticket.

The core architectural choices are the important takeaways: deterministic pre/post hooks guard the nondeterministic agent step (checkout, tests, linting, automated code review), and a pull‑based loop avoids exposing HTTP endpoints on your machines, limiting attack surface at the cost of slightly higher latency. This pattern is task‑manager and agent‑harness agnostic, scales from a laptop to many remote workers, and depends on automated checks to keep fully delegated work reliable — *we stay out of the loop entirely.*
