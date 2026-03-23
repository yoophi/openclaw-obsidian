---
title: "I Replaced OpenClaw with Claude Code (It's Not Even Close)"
source: "https://www.youtube.com/watch?v=ODKMmKCgrvw"
original_url: "https://www.youtube.com/watch?v=ODKMmKCgrvw"
youtube_id: "ODKMmKCgrvw"
playlist: "📙 openclaw"
channel: "Agentic Lab"
duration: "8:55"
publish_date: "2026-03-17T17:37:26-07:00"
playlist_index: 7
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:46:32 +0900"
---

# I Replaced OpenClaw with Claude Code (It's Not Even Close)

## Video Info

- Original URL: https://www.youtube.com/watch?v=ODKMmKCgrvw
- Channel: Agentic Lab
- Title: I Replaced OpenClaw with Claude Code (It's Not Even Close)
- Published: 2026-03-17T17:37:26-07:00
- Duration: 8:55
- Playlist: 📙 openclaw
- Playlist Index: 7

## Description

Automate your work with Claude Code https://skool.com/agentic
#1 Agentic Coding Community on Skool


Stop using OpenClaw as a black box. In this video, I break down the 4 zones that make up any AI agent — and show you
  how to build a programmable, transparent agent using just Claude Code and a few lines of Bash. No abstractions, no
  bloat, full control.

  We build a live email triage agent that wakes up via Telegram, reads your Gmail, and sends you a briefing — all on
  your Claude Max plan.

  ---
  Timestamps:

  0:00 - Why OpenClaw needs a better approach
  0:28 - Turning the black box into a glass box
  0:48 - The 4 zones of an agent
  1:02 - Zone 1: The Trigger
  1:13 - Zone 2: The Context
  1:26 - Zone 3: The Tools
  1:46 - Zone 4: The Output
  1:56 - Introducing claude -p
  2:13 - Email agent demo overview
  2:41 - Walking through the spec file
  3:04 - Zone 1: Telegram + cron job triggers
  4:24 - Zone 2: System prompt & customization
  5:33 - Zone 3: Session persistence with --resume
  6:06 - Zone 4: Tools (Bash, Read, fetch_emails.py)
  7:17 - Implementation details & safety
  7:49 - Live demo: "Summarize my last 10 emails"
  8:25 - Prompting flexibility
  8:46 - Join the community

## Summary

## Summary
The creator argues OpenClaw is a frustrating "black box" and shows how to replace it with a programmable, transparent agent built with Claude/Cloud Code using a single CLI command (claw-p/cloud-p). The core insight is that any agent is just four zones—trigger, context, tools, and output—and that making those explicit turns opaque agents into reproducible, debuggable systems. *"But what if there was a way to turn it into a glass box?"*

The video walks a concrete email-triage demo that implements those zones: triggers (Telegram messages or a daily cron), a system prompt file (email_agent_prompt.md) injected into every turn, tools (bash invoking a fetch_emails.py that connects to Gmail via IMAP), and an output channel (Telegram replies). Practical details covered include required environment variables (Telegram token, allowed user ID, Gmail address, Gmail app password), an isolated workspace directory, and a uniqueness/fault-tolerance clause so messages aren’t processed twice. Session persistence is handled with a flag (d-resme) to keep context across runs or reset it on demand; prompt behavior can be appended or replaced using append-system-prompt versus d--system prompt, and tools can be stripped with d-tools to make raw API-like calls. The presenter emphasizes specs-as-source-of-truth: the single spec/implementation file can fully recreate the agent, making maintenance and iteration straightforward. *"the four zones that turn a simple LLM call into an agent."*
