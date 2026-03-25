---
youtube_id: "EJyuu6zlQCg"
title: "5 Claude Code skills I use every single day"
channel: "Matt Pocock"
publish_date: "2026-03-16T09:01:49-07:00"
original_url: "https://www.youtube.com/watch?v=EJyuu6zlQCg"
thumbnail: "https://i.ytimg.com/vi/EJyuu6zlQCg/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/matt-pocock
  - date/2026-03-16
  - topic/tools
---

# 5 Claude Code skills I use every single day

## 영상 정보
- 채널: Matt Pocock
- 게시일: 2026-03-16T09:01:49-07:00
- 원본 URL: https://www.youtube.com/watch?v=EJyuu6zlQCg
![thumbnail](https://i.ytimg.com/vi/EJyuu6zlQCg/maxresdefault.jpg)

## 한글 요약
5 Claude Code skills I use every single day

This clip argues that the fastest way to raise code quality when using stateless LLM agents is to encode strict, repeatable processes as compact “skills.” The creator shares a repo of short, purpose-built skills that steer Claude Code through design, specification, decomposition and implementation so agents produce reliable results rather than premature, shallow plans. Key evidence: invoking the grilling skill produced 10–16 targeted questions (sometimes 30–50 in complex sessions) and the PRD → issues flow generated concrete GitHub issues that linked back to a parent PRD and unblocked subsequent commits. *Interview me relentlessly about every aspect of this plan until we reach a shared understanding.*

The video walks through five main skills and how they interact: Grill Me forces the LLM to walk down a design tree and explore the codebase before planning; Write a PRD templates the destination with problem statement and user stories; PRD to Issues breaks a PRD into vertical slices, establishes blocking relationships, and creates GitHub issues so parallel agents or humans can work independently (example: a four-slice breakdown with an engine, tests, editor toggle, etc.). TDD enforces a red‑green‑refactor loop, “write one test at a time” and prioritize interface changes for testability; an Improve Codebase Architecture skill has agents surface confusions, propose multiple interface designs via parallel subagents, recommend a hybrid, and create a refactor RFC. The takeaway: small, precise prompts that capture engineering process plus tests and clear interfaces make agent output far more dependable. *write one test at a time and it writes the test first.*
