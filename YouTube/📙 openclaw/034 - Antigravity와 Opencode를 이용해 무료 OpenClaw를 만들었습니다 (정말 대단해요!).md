---
title: "I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)"
source: "https://www.youtube.com/watch?v=Uuke9w4lAeA"
original_url: "https://www.youtube.com/watch?v=Uuke9w4lAeA"
youtube_id: "Uuke9w4lAeA"
playlist: "📙 openclaw"
channel: "SoftwareGent"
duration: "38:01"
publish_date: "2026-03-03T03:41:36-08:00"
playlist_index: 34
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:06:52 +0900"
---

# I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)

## Video Info

- Original URL: https://www.youtube.com/watch?v=Uuke9w4lAeA
- Channel: SoftwareGent
- Title: I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)
- Published: 2026-03-03T03:41:36-08:00
- Duration: 38:01
- Playlist: 📙 openclaw
- Playlist Index: 34

## Description

👉 Join my Skool Community & Learn How to Build Your Own AI SaaS: https://www.skool.com/ai-saas-builders

🚀My AI Startup - AI File Organizer: https://www.softwaregentofficial.com

📩 Business inquiries:
softwaregentofficial@gmail.com

Links:
🚀 Voice Transcription App: https://ref.wisprflow.ai/Softwaregent
👉Openclaw Repo: https://github.com/openclaw/openclaw
🧲 Antigravity: https://antigravity.dev
💻 Opencode: https://opencode.ai
🦾 OpenClaw: https://openclaw.ai
🐳 Docker: https://www.docker.com/
🟢 Node.js: https://nodejs.org/

Timestamps⌚:
00:00 Intro
00:41 Overview
03:34 Download Apps
06:44 Start Building
13:45 Connect to Telegram
16:31 Install Ollama
20:41 Voice transcription
22:39 Giving it Memory
29:00 Create CronJobs
31:17 Third Party Apps
35:45 Build Interface



I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE) – In this video, I show you how I built a completely free version of OpenClaw using Antigravity together with Opencode to automate the development workflow. We go step by step through planning the architecture, generating the core features, setting up the environment with Node.js, containerizing with Docker, and getting everything running locally. You’ll see how to recreate powerful AI tooling without paying for expensive subscriptions and how to structure the project properly so it’s scalable. This is a practical, real-world build for developers and founders who want to leverage AI to create serious tools without spending money.

🚀 LIKE, SUBSCRIBE & COMMENT if you want to build unstoppable AI products 🤖⚡

## Summary

## I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)

This video demos a full rebuild of an OpenClaw-like chat agent that runs locally for free by combining two coding agents (Antigravity and OpenCode) and local models. The creator explains why cloning OpenClaw is preferable here (security, customizability) and why the combo matters: Antigravity provides agentic features and access to Opus 4.6 for deep code analysis, while OpenCode offers broad model choice and cheap/free execution. *"I managed to build my own open globot that runs completely for free using anti-gravity and open code"* summarizes the goal; the build is driven by a plan generated from the original GitHub repo and executed with a free model to avoid token costs.

The walkthrough covers the exact stack, install steps and orchestration: install Antigravity, OpenCode, Node.js and Docker; clone the official OpenClaw GitHub; use Antigravity + Opus 4.6 to analyze the repo and create a phased plan; save that plan into the project; then run OpenCode with a free model (Minimax M2.5) to generate the agent code. The author installs a local LLM runtime (Ollama/Llama 3 variants) so the bot answers with no API fees — *"we can use this as much as we want and pay $0 in API fees"*. Voice transcription is added with Whisper, and Telegram integration is shown end-to-end (create bot token via BotFather, paste token into the project, test chat). For memory the guide sets up a RAG backend using Supabase via Antigravity’s MCP tooling; messages and vectorized memories are saved there and the Telegram bot can recall prior facts (example: storing age and later answering correctly).

Secondary details and implemented features: the creator modifies the system prompt/personality to produce short, challenging, blunt replies; schedules are implemented as cron-style jobs saved in Supabase with a scheduler and tested by creating a one-minute reminder; MCP integrations are added by installing third-party MCP connectors (demonstrated using a Zapier MCP server to grant Gmail access) so the bot can call external services; and finally Antigravity builds a simple front-end UI mirroring OpenClaw accessible on localhost. The video emphasizes two execution modes: let Antigravity run installs and commands for you or follow the explicit terminal commands to install tools (Ollama, Whisper, Supabase connectors) manually; logs and token/cost counters in OpenCode are shown while it creates files. Overall the walkthrough is a practical, stepwise guide that remains strictly code- and infrastructure-focused and demonstrates how to get a powerful, customizable local OpenClaw clone running with voice, memory, cron jobs, external service access, and a web UI.
