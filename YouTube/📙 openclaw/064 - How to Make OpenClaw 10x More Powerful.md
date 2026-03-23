---
title: "How to Make OpenClaw 10x More Powerful"
source: "https://www.youtube.com/watch?v=0soFIReWb1w"
original_url: "https://www.youtube.com/watch?v=0soFIReWb1w"
youtube_id: "0soFIReWb1w"
playlist: "📙 openclaw"
channel: "Larue"
duration: "6:04"
publish_date: "2026-02-23T09:15:01-08:00"
playlist_index: 64
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:21:55 +0900"
---

# How to Make OpenClaw 10x More Powerful

## Video Info

- Original URL: https://www.youtube.com/watch?v=0soFIReWb1w
- Channel: Larue
- Title: How to Make OpenClaw 10x More Powerful
- Published: 2026-02-23T09:15:01-08:00
- Duration: 6:04
- Playlist: 📙 openclaw
- Playlist Index: 64

## Description

OpenClaw is the most powerful AI tool ever created, but most people are using it like ChatGPT. In this video I'm showing you 5 techniques to make OpenClaw 10x more powerful and turn it into a fully autonomous AI employee.

How I Make OpenClaw 90% Cheaper (Feels Illegal): https://youtu.be/5BmB-KymwCI

Social:
Twitter: https://twitter.com/larue_ai
Telegram: https://t.me/LarueAI

📧 For Partnerships: laruedotai@gmail.com

┈┈┈┈┈┈┈┈┈┈✄┈┈┈┈┈┈┈┈┈┈
Timestamps:
00:00 – intro
00:20 – sub-agents
01:54 – skills
03:08 – proactive agent
04:13 – memory
05:05 – self-improving

Music:
https://youtu.be/zJ8xF1rSUZQ?si=ZizDZRlvwkMLkCou
https://youtu.be/N6zrPDQ1XVA?si=nCxO__EVBrT4YhAl
https://youtu.be/jKU7gfanbrg?si=vos66Xyqz__ev5zk
https://youtu.be/jIbhQOZ7H7k?si=03tuRbp2xfHe6cac
https://youtu.be/-3EE_ZCpMzk?si=CBgkgvRMNnffFrxM
https://youtu.be/bNrnq4IW1yg?si=kfd2fBxn4LWGXaJg

Prompts:

⚠️ IMPORTANT:
These prompts were created and tested using GPT-5.3-Codex. If you're using a less capable model, it may not produce the same results and could even break your setup.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Create a new persistent agent named Samantha (samantha) and make her my dedicated coding assistant. Set openai-codex/gpt-5.3-codex as her primary model, and use Samantha for all coding-related tasks. Leave my main agent (you) unchanged, and tell me when Samantha is ready.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
I want to set up a morning brief. Every morning at 8:00 AM, send me a report that includes:

1. Latest news about AI, startups and tech
2. Content ideas I can create today
3. Tasks I need to complete today pulled from my to-do list
4. Recommendations for tasks you can complete for me today

For the content ideas, write full draft scripts or outlines, not just titles.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Every day, I want you to work on your own to iterate and improve. Surprise me daily [insert time] with a new task/project you completed to improve my pre-existing workflows.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Enable memory flush before compaction and session memory search in my OpenClaw config. Set compaction.memoryFlush.enabled to true and set memorySearch.experimental.sessionMemory to true with sources including both memory and sessions. Apply the config changes.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
I want you to become a self-improving assistant for me. From now on, learn only from explicit corrections and clear preferences I give you (for example: “No, do it this way”, “I prefer X”, “Always do Y”). Don’t guess preferences from silence. Create a simple memory system in local files with 3 layers:

1. Hot memory for important confirmed rules (always loaded)
2. Context memory for project/domain-specific rules
3. Archive for old inactive patterns

Each time I correct you:

- log it with timestamp and context,
- track repetition,
- and if the same correction appears 3 times, ask me whether to make it a permanent rule (global, domain, or project).

Every week, run a maintenance review:

- remove duplicates,
- keep confirmed rules concise,
- move stale items to archive,
- and send me a short “what changed” digest.

When you apply a learned rule, tell me where it came from (file + line). Never store sensitive data (passwords, tokens, financial or health data, private info about other people). If I say “forget X,” delete it everywhere and confirm. If I say “forget everything,” wipe this memory system and start fresh. Ask before making high-impact workflow changes.

#openclaw #clawdbot #ai

## Summary

## How to Make OpenClaw 10x More Powerful

This clip distills five practical techniques to turn OpenClaw from a ChatGPT-like chat into an autonomous, productive assistant: (1) split work into specialized sub-agents, (2) install skills from the community marketplace, (3) enable proactive/autonomous workflows, (4) fix memory loss caused by context compaction, and (5) create a self-improving loop so the agent learns from corrections. The recommendations are actionable and focused on configuration and small prompts you can paste into your OpenClaw gateway or Telegram client to bootstrap each feature quickly. *"OpenClaw is the most powerful AI tool ever created, but... you might not feel that way."* *"The problem is, after each compaction your agent forgets about lots of things."*

Key how-tos and examples: create a main agent (the presenter’s “Mono”) for reasoning and delegate execution to sub-agents (example: a coding specialist named Samantha) that have their own model, context window and memory; the demo prompt shows creating Samantha and assigning a coding model so Mono delegates code tasks to her. Install ClawHub (the agent “app store”) to add community skills like “Last 30 Days” (searches Reddit, X, YouTube and the web for recent trends) or GitHub-integrations; you can paste skill links to your agent and ask it to install them. To make OpenClaw proactive, set scheduled briefs (example: a morning brief at 8:00 AM listing AI news, content ideas, and task suggestions) or give a daily-improvement prompt that asks the agent to surprise you each morning with a new task or improvement.

Memory and safety details: OpenClaw compacts old chat history into summaries to save context and tokens, which causes permanent forgetting unless you save critical items before compression; the presenter supplies a prompt that extracts and writes key facts to a memory file pre-compaction. Community skills are powerful but potentially unsafe—anyone can publish skills—so prefer asking your agent to build a capability or have it install a trusted skill rather than downloading unknown code. For continuous learning, use a Self-Improving Agent skill or a single prompt that creates folders for hot memory, correction logs and patterns so the agent records corrections and avoids repeating mistakes; the presenter offers both the skill route and a prompt-only alternative to achieve much of the same effect.

Bottom line: the video is practical and configuration-heavy—use sub-agents for separation of concerns, ClawHub to extend capabilities, scheduled autonomous prompts for proactive work, a pre-compaction memory dump to prevent forgetting, and a self-improvement pipeline so the agent adapts to your preferences over time. The presenter also points to a technical Reddit post for deeper memory fixes if you want to go further.
