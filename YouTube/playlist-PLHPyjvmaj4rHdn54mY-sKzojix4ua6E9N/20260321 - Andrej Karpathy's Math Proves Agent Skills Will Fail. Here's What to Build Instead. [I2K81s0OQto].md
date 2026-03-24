---
youtube_id: "I2K81s0OQto"
title: "Andrej Karpathy's Math Proves Agent Skills Will Fail. Here's What to Build Instead."
channel: "The AI Automators"
publish_date: "2026-03-21T04:30:10-07:00"
original_url: "https://www.youtube.com/watch?v=I2K81s0OQto"
thumbnail: "https://i.ytimg.com/vi/I2K81s0OQto/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/the-ai-automators
  - date/2026-03-21
  - topic/tools
---

# Andrej Karpathy's Math Proves Agent Skills Will Fail. Here's What to Build Instead.

## 영상 정보
- 채널: The AI Automators
- 게시일: 2026-03-21T04:30:10-07:00
- 원본 URL: https://www.youtube.com/watch?v=I2K81s0OQto
- 썸네일: https://i.ytimg.com/vi/I2K81s0OQto/maxresdefault.jpg

## 한글 요약
## Andrej Karpathy's Math Proves Agent Skills Will Fail. Here's What to Build Instead.

The video argues that “agent skills” — essentially prompt-packed procedures — won't reach the reliability businesses need for complex, multi-stage workflows because failures compound. Using the “march of nines” example: a 10-step workflow with 90% per-step success yields over six failures per day; 99% per step drops that to one failure per day and 99.9% to one every 10 days. An evaluation of 84 popular skills showed improved pass rates but still far from production-grade dependability, so prompting alone can’t deliver deterministic reliability.

The recommended fix is harness engineering: wrap models in deterministic rails that gate, validate, and manage state. Examples and components shown include scaffolded testing (Stripe’s minions validating PRs against tests), virtual file systems and workspaces, delegating parallel sub-agents for context isolation, model-mixing (cheaper models for narrow sub-tasks), long- and short-term memory, planning (fixed vs dynamic), validation loops, and programmatic output templates to guarantee format and consistency. The demo contrasts a 7,000-token main agent interaction with a 323,000-token total thread driven by many sub-agents, illustrating scale and cost trade-offs. Two concise takeaways: *“agent skills are essentially just prompts”* and *“harnesses are essentially just the software layer that wraps around an AI model”*.
