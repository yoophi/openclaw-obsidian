---
title: "I Built a Safer OpenClaw Alternative Using Claude Code"
source: "https://www.youtube.com/watch?v=XmweZ4fLkcI"
original_url: "https://www.youtube.com/watch?v=XmweZ4fLkcI"
youtube_id: "XmweZ4fLkcI"
playlist: "📙 openclaw"
channel: "Cole Medin"
duration: "15:14"
publish_date: "2026-02-11T17:00:43-08:00"
playlist_index: 79
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:30:01 +0900"
---

# I Built a Safer OpenClaw Alternative Using Claude Code

## Video Info

- Original URL: https://www.youtube.com/watch?v=XmweZ4fLkcI
- Channel: Cole Medin
- Title: I Built a Safer OpenClaw Alternative Using Claude Code
- Published: 2026-02-11T17:00:43-08:00
- Duration: 15:14
- Playlist: 📙 openclaw
- Playlist Index: 79

## Description

OpenClaw is the fastest-growing open-source AI project in recent memory - 185,000 GitHub stars already! A legitimately impressive personal AI assistant that can manage your life and you can talk to it anywhere. But it has serious security issues - the docs literally say "there is no perfectly secure setup."

So I took the core genius ideas from OpenClaw - the memory system, the proactive heartbeat, the multi-platform adapters, the extensibility through skills - and I built my own version using just Claude Code. It took me two days. 

The result is simpler, more secure, and tailored exactly to what I need. I'll introduce you to how I did this now and more content on this coming soon!

~~~~~~~~~~~~~~~~~~~~~~~~~~

- The Dynamous Agentic Coding Course is now FULLY released - learn how to build reliable and repeatable systems for AI coding: 
https://dynamous.ai/agentic-coding-course

- The Excalidraw diagram I cover in this video:
https://drive.google.com/file/d/1s97vx40pWb2kSH-rfdbzoqIESbX9lKg5/view

- Second Brain Skills Collection (open source):
https://github.com/coleam00/second-brain-skills

- OpenClaw Repository:
https://github.com/openclaw/openclaw

~~~~~~~~~~~~~~~~~~~~~~~~~~

Sources for the OpenClaw security issues:

- CVE-2026-25253 - One-click RCE via WebSocket origin bypass (CVSS 8.8, discovered by Mav Levin at depthfirst):
https://thehackernews.com/2026/02/openclaw-bug-enables-one-click-remote.html

- depthfirst original writeup of the RCE chain:
https://depthfirst.com/post/1-click-rce-to-steal-your-moltbot-data-and-keys

- CVE-2026-25157 - OS command injection in macOS SSH handling:
https://www.securityweek.com/vulnerability-allows-hackers-to-hijack-openclaw-ai-assistant/

- 230-414+ malicious skills published to ClawHub registry (76 confirmed malware payloads, 91% used hybrid attacks):
https://www.bleepingcomputer.com/news/security/malicious-moltbot-skills-used-to-push-password-stealing-malware/

- 42,665 publicly exposed OpenClaw instances (Censys scan: 21,000+):
https://www.darkreading.com/application-security/openclaw-ai-runs-wild-business-environments

- Cisco AI Defense: "Absolute nightmare" + Skill Scanner released:
https://blogs.cisco.com/ai/personal-ai-agents-like-openclaw-are-a-security-nightmare

- Researcher hijacked OpenClaw in 1 hour 40 minutes:
https://thenewstack.io/openclaw-moltbot-security-concerns/

~~~~~~~~~~~~~~~~~~~~~~~~~~

0:00 OpenClaw - The Magical AI Assistant
2:10 The Major Security Risks
5:16 4 Core Components of OpenClaw
8:21 Replicating the Memory System
10:31 The Heartbeat & Proactive Tasks
11:22 Channel Adapters & Interfaces
12:17 Building Secure Custom Skills
13:38 Step-by-Step Build Process (Simple, High Level)

~~~~~~~~~~~~~~~~~~~~~~~~~~

Join me as I push the limits of what is possible with AI. I'll be uploading videos weekly - at least every Wednesday at 7:00 PM CDT!

## Summary

## TL;DR
The creator built a personal, safer alternative to OpenClaw by reimplementing the parts that make it feel “magical” while removing risky defaults and keeping full control. He argues OpenClaw is groundbreaking but currently dangerous because of architectural vulnerabilities and a public skills marketplace that contains many malicious packages. *"It is the personal AI assistant right now and people are loving it because it feels like the first agent that truly gets you."*

He focuses on replicating four core components: a markdown-driven memory system (soul.md, user.md, memory.md, agents.md) plus a lightweight SQLite-backed RAG, a scheduled heartbeat that runs autonomously, channel adapters for chat platforms, and a skills mechanism for adding capabilities. The security problems he highlights: a one-click remote code execution path that can leak tokens and plain-text credentials, and a skills hub where many published packages exfiltrate keys; these motivate building a self-hosted, auditable stack. For his own build he used Claude Code / the Claude agent SDK as the coding agent, Obsidian to sync markdown memory files locally, SQLite for local retrieval, Postgres for remote deployment, a 30-minute scheduled heartbeat that checks email/calendar/tasks and can draft or perform actions, and a narrow set of adapters (Slack + terminal) instead of dozens of public integrations.

Practical build approach he demonstrates: clone the OpenClaw repo (MIT), point a coding agent at the repository to explain each subsystem, then reimplement those subsystems in your own tech stack and iterate. He emphasizes keeping skills private (no public registry) and only adding adapters you actually use, which reduces attack surface and makes the assistant easier to audit. The result is a highly personalized assistant that “can act on our behalf, anticipate our needs, and it knows us better every single day,” built in a few thousand lines of Python and markdown and designed to be auditable, extendable, and less risky than running an unmodified OpenClaw instance.
