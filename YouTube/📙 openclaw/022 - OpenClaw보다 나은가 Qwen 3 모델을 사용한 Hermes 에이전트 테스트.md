---
title: "Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model"
source: "https://www.youtube.com/watch?v=8tpuky8HpXw"
original_url: "https://www.youtube.com/watch?v=8tpuky8HpXw"
youtube_id: "8tpuky8HpXw"
playlist: "📙 openclaw"
channel: "Onchain AI Garage"
duration: "15:08"
publish_date: "2026-03-11T07:00:14-07:00"
playlist_index: 22
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:56:15 +0900"
---

# Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model

## Video Info

- Original URL: https://www.youtube.com/watch?v=8tpuky8HpXw
- Channel: Onchain AI Garage
- Title: Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model
- Published: 2026-03-11T07:00:14-07:00
- Duration: 15:08
- Playlist: 📙 openclaw
- Playlist Index: 22

## Description

I heard the hype: Hermes Agent was like OpenClaw, but with better memory, enhanced skill-learning, and tougher security. So I decided to try it out myself using Qwen 3.

Watch more Onchain AI Garage: https://www.youtube.com/playlist?list=PLmpUb_PWAkDy2uX2h_3a5Qm0ss88eXKUa

Hermes Agent is a new open-source AI agent by Nous Research with a built-in learning loop, persistent memory, and terminal access. We test it from scratch — install, model setup, tool use, and coding tasks.

We walk through installing Hermes Agent on WSL2, finding a model that actually supports tool calling, and running it through web research, file ops, and code execution tasks.

✅ Open-source, MIT licensed, runs anywhere
✅ Model-agnostic — works with OpenRouter, Nous Portal, or any endpoint
✅ Built-in memory, skill creation, and cron scheduling

Scampi & Tonbi are a human-AI duo building onchain projects in public. Tonbi brings taste, judgment, and domain expertise. Scampi brings tireless research, coding, and shrimp energy. 🦐

🐦 Tonbi: https://x.com/tonbistudio
💻 Tonbi's GitHub: https://github.com/tonbistudio
🌐 Portfolio: https://www.tonbistudio.com (https://www.tonbistudio.com/)
🐦 Scampi: https://x.com/itsthatshrimple

Resources:
🔗 Hermes Agent GitHub: https://github.com/NousResearch/hermes-agent
🔗 Hermes Agent Docs: https://hermes-agent.nousresearch.com/docs/
🔗 OpenRouter: https://openrouter.ai (https://openrouter.ai/)
🔗 Qwen3 on OpenRouter: https://openrouter.ai/qwen/qwen3-235b-a22b


What we built:

• Hermes Agent installed and running on WSL2 Ubuntu
• Qwen3 235B configured via OpenRouter for tool-capable agent sessions
• CLI tests: web research, file ops, terminal commands, code execution

Coming Next:
What are some great use cases for OpenClaw?

Got questions about Hermes Agent or open-source AI agents? Drop them in the comments! If this helped, like and subscribe for more builds! 🦐✨

#HermesAgent #Qwen3 #NousResearch #OpenSourceAI #AIAgent #OpenClaw #LocalAI #WSL2 #AITools #OnchainAIGarage

## Summary

## Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model

This video walks through installing and testing Hermes Agent—the new open-source agent framework—compares its architecture and behavior to OpenClaw, and demonstrates real tasks using the Qwen 3 model via Open Router. The presenter highlights two architectural differences: Hermes runs with a Python/Docker backend and emphasizes autonomous skill creation, summarized by the phrase *"it creates and improves skills autonomously"*. Hermes also uses a different memory approach: *"Hermes agent uses full text search across all past conversations."* These differences are framed as the core selling points versus OpenClaw’s more manual skill management and embedding-based fuzzy recall.

The demo shows installation requirements (Linux/macOS or Windows via WSL2), running the setup wizard, and configuring a model provider and tools. During setup the presenter attempted Hermes 4 but hit a tooling restriction with Open Router, switched to Hermes 3 and then to Qwen 3 (the Alibaba 235B MoE model) to get tool access. The wizard lets you pick messaging backends (Telegram/Discord/etc.), tools (browser, web search, automation, file I/O, home assistant), and runtime options; defaults were used for most settings. In the CLI demo Hermes lists 80+ skills across categories, browses Poly Market and GitHub, creates files, runs code, installs Python dependencies, and executes a script that fetches Tesla’s stock price in real time—showing tool chaining from dependency install to script execution to output capture.

Functionally, Hermes performed well on the tasks shown: it navigated websites with the built-in browser, produced a markdown summary file of Poly Market weather markets, scanned GitHub for trending repos and highlighted AI-related projects (including Hermes itself), and completed the coding task end-to-end (install yfinance, write script, run script, return price). Memory tests included asking about earlier interests and restarting the session; Hermes retrieved prior conversation context, files, and the agent character details even after a full session reset. The presenter notes the project is very new (about two weeks old) and plans further experimentation; the video is presented as an introductory setup and first-look evaluation rather than a deep benchmark.
