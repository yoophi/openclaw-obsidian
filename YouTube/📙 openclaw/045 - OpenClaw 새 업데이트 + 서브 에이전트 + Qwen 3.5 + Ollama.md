---
title: "OpenClaw New Update + Subagents + Qwen 3.5 + Ollama"
source: "https://www.youtube.com/watch?v=HPGNhjBRlOg"
original_url: "https://www.youtube.com/watch?v=HPGNhjBRlOg"
youtube_id: "HPGNhjBRlOg"
playlist: "📙 openclaw"
channel: "Julian Goldie SEO"
duration: "34:43"
publish_date: "2026-02-26T14:52:37-08:00"
playlist_index: 45
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:13:34 +0900"
---

# OpenClaw New Update + Subagents + Qwen 3.5 + Ollama

## Video Info

- Original URL: https://www.youtube.com/watch?v=HPGNhjBRlOg
- Channel: Julian Goldie SEO
- Title: OpenClaw New Update + Subagents + Qwen 3.5 + Ollama
- Published: 2026-02-26T14:52:37-08:00
- Duration: 34:43
- Playlist: 📙 openclaw
- Playlist Index: 45

## Description

Want to make money and save time with AI? Join here: https://www.skool.com/ai-profit-lab-7462/about

Get a FREE AI Course + Community + 1,000 AI Agents + video notes + links to the tools 👉 https://www.skool.com/ai-seo-with-julian-goldie-1553/about

OpenClaw's new update fixes DMs and subagents, better sub agents and pairs perfectly with free Ollama running Qwen 3.5:35b for smart AI tasks. This combo handles vision, tools, and multi-step jobs like filling forms or navigating apps right on your computer. Watch to set it up easily and use these powerful, local tools to build better AI agents fast.

## Summary

## OpenClaw update: heartbeat, subagents, Quen 3.5 + Ollama

This video explains a Feb 25 OpenClaw release that restores heartbeat DM delivery, rewrites subagent messaging, and adds multiple security and reliability fixes. The heartbeat DM fix means your assistant will resume sending direct check-ins again; as the presenter puts it, *"Heartbeat DMs are switched on by default."* The subagent system — the helpers that run tasks and report back — was rebuilt so deliveries follow a clear state-machine workflow, *"rebuilt from scratch using what's called a state machine"*, which reduces lost or frozen messages and adds backup routing and cleaner cleanup steps.

The creator walks through how to confirm and apply the update inside OpenClaw: go to config → all settings → updates and enable automatic updates, or trigger the update from the chat UI; sometimes the gateway can stop responding briefly during upgrades and you may need to restart or reinstall the daemon. Release notes include streaming delivery and markdown handling improvements, startup and UI chat-compose tweaks, onboarding and agent-config changes, better Slack thread handling (sessions inherit context correctly, fewer overflow/route errors), and tighter security for Slack, Discord, and Telegram integrations. The presenter emphasizes that OpenClaw has become more powerful but also more brittle with growth, so expect occasional breakage and be ready to debug if a gateway or daemon hangs.

The video then demos running Quen 3.5 locally with Ollama so you can power OpenClaw without paid APIs. Key steps: install Ollama pre-release (required for the new model), run the Ollama terminal command to pull the ~24 GB model, then launch OpenClaw with that local model; the presenter shows the terminal output and the OpenClaw launch sequence. Hardware matters: Quen 3.5 is heavy (even a Mac Studio felt slow); alternatives are Quen 3.5 Flash, cloud-hosted models (token limits apply), or lighter local models like GLM 4.7 Flash, which the presenter prefers for better local speed. The video also answers viewer questions about stability, VPS/CPU requirements, and alternatives for less-technical users, noting OpenClaw’s power comes with more hands-on maintenance.
