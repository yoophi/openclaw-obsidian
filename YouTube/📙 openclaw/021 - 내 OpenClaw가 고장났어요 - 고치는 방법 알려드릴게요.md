---
title: "My OpenClaw Broke - Here's How I Fixed It"
source: "https://www.youtube.com/watch?v=UTztjR4o7Y8"
original_url: "https://www.youtube.com/watch?v=UTztjR4o7Y8"
youtube_id: "UTztjR4o7Y8"
playlist: "📙 openclaw"
channel: "Sean Matthew"
duration: "11:23"
publish_date: "2026-03-11T10:00:46-07:00"
playlist_index: 21
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:55:47 +0900"
---

# My OpenClaw Broke - Here's How I Fixed It

## Video Info

- Original URL: https://www.youtube.com/watch?v=UTztjR4o7Y8
- Channel: Sean Matthew
- Title: My OpenClaw Broke - Here's How I Fixed It
- Published: 2026-03-11T10:00:46-07:00
- Duration: 11:23
- Playlist: 📙 openclaw
- Playlist Index: 21

## Description

A few weeks ago, my OpenClaw agent kept failing.  It was forgetting everything after long conversations. Skills broke, cron jobs stopped running correctly, and I kept getting error messages in Telegram about running out of context. I thought it was the model, but it turns out it was how OpenClaw handles memory and context behind the scenes. Here's exactly what was broken and how I fixed it.

🛠️ RELEVANT DOCS & PROMPTS:
All relevant docs, instructions, and prompts from this video can be found here: https://x.com/_sean_matthew/status/2031800232569102610

📋 TIMESTAMPS:
00:00 Intro
00:33 Why Memory Breaks
01:39 Fix 1: Memory Flush
04:21 Fix 2: Search & Retrieval
06:25 Fix 3: The Heartbeat Cost Trap
08:48 Fix 4: System Prompt Audit
10:45 Recap
11:09 Outro

💾 MENTIONED IN THIS VIDEO:
→ Article on OpenClaw memory debugging (credit: code_rams on X): https://x.com/i/article/2025615759771123712
→ QMD by Tobi Lutke: https://github.com/tobi/qmd

For more OpenClaw content:
→ 3 Tools That Make OpenClaw Actually Useful: https://youtu.be/QvfqAMUJTT4
→ I Gave OpenClaw Its Own Computer: https://youtu.be/QCf8BCT-Kzo

## Summary

## My OpenClaw Broke — How I Fixed It

*It kept forgetting everything and I kept getting error messages about the context window completely filling up.*  
*So, the real lesson here is it doesn't really matter what model you're running.*

The creator describes a persistent failure in their OpenClaw agent (called Jarvis): long conversations caused the context window to fill, skills and cron jobs stopped, and token use spiked. The root cause turned out not to be the underlying LLM but OpenClaw’s background memory and context handling; fixing that involved four targeted changes that reduce information loss and token costs while improving retrieval.

First, the compaction problem: OpenClaw compresses older conversation history into a single summary and treats every item equally, so critical facts get diluted. The fix is a memory flush — trigger a silent turn before compaction that tells the agent to write durable facts to a daily disk log (memory.md) so important details survive compaction. For very long sessions, enable context pruning (example: a 4-hour threshold that keeps the last three assistant responses) so compaction runs won’t lose repeated important moments across multiple compactions. Second, search and retrieval: the default semantic-only search returns semantically similar but irrelevant hits; switching to QMD (a hybrid of semantic and exact matching) improves relevance. Beyond search tech, the agent must be instructed to perform searches: add directives in agents.md to check daily logs and a concise learnings.md before answering. learnings.md is a distilled, rule-based file of one- or two-line corrections produced from mistakes in memory.md so the agent applies explicit rules rather than relying on noisy recall.

Third, the heartbeat cost trap: the default heartbeat runs a full agent turn (system prompt + files + memory) every ~30 minutes, which consumes massive tokens. Mitigations: restrict heartbeat active hours so it doesn’t run around the clock, enable light context so heartbeat only loads heartbeat.md instead of the entire system prompt, and run the heartbeat on a cheaper or local model to lower API costs. Fourth, audit the system prompt: bloated system and skill files dump large context each turn. The author used an agent (Claude Code) to audit and prune redundant or duplicated content across system files, dramatically shrinking the prompt and eliminating the recurring "context fill" errors.

Recap: enable memory flush to persist critical facts before compaction, adopt QMD and force search checks with agents.md and learnings.md, tone down heartbeat behavior and model choice, and perform a system prompt audit to remove bloat. The practical outcome was a much smoother agent that costs far less to run; the creator also shares the Claude Code prompt used to audit files in the video's show notes for anyone who wants to replicate the fixes.
