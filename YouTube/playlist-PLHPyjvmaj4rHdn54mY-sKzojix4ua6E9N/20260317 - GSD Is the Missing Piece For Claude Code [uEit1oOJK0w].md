---
youtube_id: "uEit1oOJK0w"
title: "GSD Is the Missing Piece For Claude Code"
channel: "AI LABS"
publish_date: "2026-03-17T09:13:18-07:00"
original_url: "https://www.youtube.com/watch?v=uEit1oOJK0w"
thumbnail: "https://i.ytimg.com/vi/uEit1oOJK0w/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/ai-labs
  - date/2026-03-17
  - topic/general
---

# GSD Is the Missing Piece For Claude Code

## 영상 정보
- 채널: AI LABS
- 게시일: 2026-03-17T09:13:18-07:00
- 원본 URL: https://www.youtube.com/watch?v=uEit1oOJK0w
![thumbnail](https://i.ytimg.com/vi/uEit1oOJK0w/maxresdefault.jpg)

## 한글 요약
GSD: when to pick it (and why it’s different)

GSD (Get Shit Done) is a framework built for projects where requirements will evolve and you need fast, iterative MVPs rather than heavy up‑front specification; it plans step‑by‑step from a broad scope so later phases aren’t locked in, making it suited for experimental or custom solutions that require repeated exploration. It deliberately sits opposite BMAD (heavy, preloaded research and rigid PRDs) and differs from Superpowers’ TDD approach (test‑first, edge‑case focused): use BMAD when requirements are fixed, use Superpowers when missing edge cases is costly, and use GSD when you want controlled, rapid execution with room to change—or start with GSD and onboard Superpowers later if needed.

GSD’s implementation details explain why it behaves differently: installation creates agent files in a project .claude or aagent folder and uses XML‑structured instructions for better model parsing; *GSD was also built with preventing context rot in mind* by spawning subagents as isolated processes and mapping each subagent to the most appropriate model (lighter models for synthesis, heavier ones only when needed). It keeps planning concise—*It keeps project.md deliberately short and focused so the agents wouldn't deviate from the main aims*—runs parallel research agents, records research.md with confidence scores, runs automated pre‑commit checks, performs adversarial plan verification (planning + verifier agents), breaks work into parallelizable waves, and validates builds with Playwright tests; a single iteration used ~138,000 tokens (well within a 1M context window). The result: strong tooling for large, multi‑feature apps that need iterative discovery and controlled execution, but overkill for very simple projects where a single agent is sufficient.
