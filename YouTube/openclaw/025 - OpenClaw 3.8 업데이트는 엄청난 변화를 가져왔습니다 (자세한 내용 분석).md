---
title: "OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)"
source: "https://www.youtube.com/watch?v=MoKNM53PLS4"
original_url: "https://www.youtube.com/watch?v=MoKNM53PLS4"
youtube_id: "MoKNM53PLS4"
playlist: "📙 openclaw"
channel: "Jay E | RoboNuggets"
duration: "10:38"
publish_date: "2026-03-09T23:11:30-07:00"
playlist_index: 25
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:58:27 +0900"
---

# OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)

## Video Info

- Original URL: https://www.youtube.com/watch?v=MoKNM53PLS4
- Channel: Jay E | RoboNuggets
- Title: OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)
- Published: 2026-03-09T23:11:30-07:00
- Duration: 10:38
- Playlist: 📙 openclaw
- Playlist Index: 25

## Description

🍳 Join RoboNuggets when you're ready to learn OpenClaw and other Agentic tools: https://www.skool.com/robonuggets/about?ref=c1365a0fede2445292bc2bbd2b9e9359 — see if that's for you + get all our templates, meet 1000+ AI practitioners, get $3M in AI tool discounts, and more 👍🏻


***

Summary 🔻
OpenClaw's biggest update yet - summarized in this full breakdown

Our AI Partner Tools (affiliate revenue go to community perks):
🥚 Free trial of n8n: https://n8n.partnerlinks.io/o3jqtj032c02 
🥚 Free trial of Blotato: https://blotato.com/?ref=robonuggets
🥚 Free trial of Make https://www.make.com/en/register?pc=robonuggets
🥚 Free trial of ElevenLabs: https://try.elevenlabs.io/m5mn2jkv5rzk
🥚 Free credits at Apify:  https://www.apify.com?fpr=sffv1
🥚 Free trial of JSON2Video: https://json2video.com/?afco=robonuggets

--- 
About Me 👋🏼 

Hey thanks for watching! I'm Jay - spent my career in data and brand building, founded the ROBO Group to help forward-looking businesses grow with AI, and now teaching what I know through this channel and the RoboNuggets community. 

If you learned something new and want to see more, support the channel by subscribing: https://www.youtube.com/@RoboNuggets

Follow on other platforms 🔻
➗ Instagram: https://www.instagram.com/robonuggets
➖ Tiktok: https://www.tiktok.com/@robonuggets
✖️ Twitter/X:  https://www.twitter.com/robonuggets
➕ LinkedIn: https://www.linkedin.com/in/j-enri/

For business, reach out at https://robolabs.so

Leave me a comment if you have a specific request! Thanks.
— J

---

#AI #AIAgents #AIAutomation #ClaudeCode #CursorAI #VibeCoding #Anthropic #MCPProtocol #Codex #AntigravityAI #Antigravity #AIAgency #AgencyAutomation #AIDevelopment #AITools #OpenAI #ChatGPT #AIWorkflow #NoCode #LowCode #AIIntegration #PromptEngineering #AIBusiness #AISaaS #AIServices #AgentBuilding #AutomationAgency #AIConsulting #AIForBusiness #ClientAutomation #AIProductivity #TechAgency #AIImplementation #BuildWithAI #AIFreelance #AIDeveloper #AIEngineering #CodingAgents #AutonomousAgents #AIAssistant #AIStartup

## Summary

## OpenClaw 3.7 → 3.8 — what changed and why it matters

This release pair is presented as a major milestone: *this is the biggest update that OpenClaw has had since its inception*. The headline items are: a hinted iOS app with a built‑in voice feature and a basic dashboard; Telegram “topic routing” that gives each topic an isolated session (model, system prompt, skills, memory); and stronger security and backup tooling. Topic routing lets a single Telegram group host multiple isolated threads (content, dev, client, etc.), each with its own default model and skill set so agents don’t get confused by dozens of skills in one workspace.

The update also overhauls how long context windows are handled. OpenClaw’s agents inject an agents.md system prompt on every session and use compaction to summarize a very large context window (the presenter cites an example model with a ~1,000,000 token window). Previously compaction could drop critical instructions; the video shows a real‑world safety incident where a lost directive caused an agent to start deleting inbox items. New controls let you mark sections to survive post‑compaction, customize how many recent turns are preserved, and install plugins that implement alternative compaction strategies (example plugin named “lossless claw” is available as open source). To abort runaway actions you can issue the agent abort command (/stop) and you’ll see *agent was aborted*.

Operational reliability improvements are included: a one‑command full archive backup (openclaw backup create) and a verification step (openclaw backup verify) that save and validate agents, memory, and workspace snapshots so you can roll back unwanted changes. Model and search updates add options like Gemini 3.1 flash light and GPT 5.4, and the built‑in perplexity search gains filters (language, region, time). The release also bundles a suite of security hardening items (API key protections, removal of token snippets from user‑facing labels, VPS security tweaks). The project drew roughly 200 contributors for these releases and the presenter highlights rapid attention growth compared to legacy open projects.
