---
title: "NEW OpenClaw Update is MASSIVE! (Sub-agent Flow)"
source: "https://www.youtube.com/watch?v=sCPjeu7mpOU"
original_url: "https://www.youtube.com/watch?v=sCPjeu7mpOU"
youtube_id: "sCPjeu7mpOU"
playlist: "📙 openclaw"
channel: "BoxminingAI"
duration: "10:57"
publish_date: "2026-02-25T23:32:19-08:00"
playlist_index: 48
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:15:02 +0900"
---

# NEW OpenClaw Update is MASSIVE! (Sub-agent Flow)

## Video Info

- Original URL: https://www.youtube.com/watch?v=sCPjeu7mpOU
- Channel: BoxminingAI
- Title: NEW OpenClaw Update is MASSIVE! (Sub-agent Flow)
- Published: 2026-02-25T23:32:19-08:00
- Duration: 10:57
- Playlist: 📙 openclaw
- Playlist Index: 48

## Description

OpenClaw just dropped version 2026.2.25 and it's a big one. We tested it in real-world use before making this video so you get actual experience, not just patch notes. The two standout features: sub-agent delivery is completely overhauled (no more silent timeouts), and heartbeat DM delivery is finally working properly. We also cover cron job tracking improvements, what still needs work, and how to get the most out of sub-agents right now.

🔥 Check out our Community Website: https://boxminingai.com/
📚 Join our Discord: https://discord.com/invite/boxtrading
👉🏼 Zeabur Server: https://zeabur.com/ (Save $5 use code: boxmining)
👉🏼 Minimax 10% Off: https://platform.minimax.io/subscribe/coding-plan?code=5GYCNOeSVQ&source=link
👉🏼 Kimi AI: https://www.kimi.com/kimiplus/sale?activity_enter_method=h5_share&invitation_code=Y4JW7Y
📖 Read more AI News: https://www.boxmining.com/

Partnership/Collaboration Email: boxminingai@gmail.com

00:00 OpenClaw 2026.2.25 — What's New?
00:45 Sub-Agent Delivery Overhaul Explained
01:45 Why Sub-Agents Are Powerful (Clean Context = Smarter Results)
02:45 Live Demo — Stark Using Sub-Agents to Build a Presentation
04:00 Sub-Agent Timeouts Are Now Visible (No More Disappearing Agents)
05:00 Cron Job Tracking Improvements
05:45 What Still Needs Work (Sub-Agent Names, Large Tasks)
06:45 Heartbeat DM Delivery + Other Updates
07:30 Strong Open Source Community — Why OpenClaw Moves So Fast

## Summary

## OpenClaw 225 — what matters

The release centers on two visible improvements: heartbeat DM delivery and an overhaul of sub-agent delivery, plus routine gateway hardening and security fixes. The presenters tested the build in real workflows (updating a previously made presentation) and emphasize that the update changes how the system reports and manages background work rather than changing the underlying model intelligence. *"One is heartbeat DM delivery."*

Sub-agents are the focal practical change: they can spawn to handle discrete jobs (research, updating slides, art, cleanup) and keep a much cleaner context than your main agent, so they’re useful for targeted tasks. In the demo, the main agent “Stark” spun sub-agents to fetch recent changes, to rebuild and reorder an existing slide deck, and to run specialized subtasks; the new behavior also makes the system more vocal about progress — it now reports when sub-agents time out, when they finish, and whether cron jobs ran or failed. The presenters saw real issues during the test: long tasks could still leave files truncated and some sub-agents timed out or produced incomplete outputs, so the feature is “still not fully fully baked yet.” *"the sub aent feature is still not fully fully baked yet."*

Other notes: intelligence is unchanged because the same base models are used; documentation, Android and provider-related updates landed but were not fully tested by the presenters; there’s a notable new vision/“Moonshot Kimmy” capability for video understanding that they plan to explore later. Practical takeaways: update OpenClaw and immediately test sub-agent flows and cron schedules (watch for time zone/host-time issues), break large jobs into specialized sub-agents (research, writer, art, QA), and consider naming or tracking sub-agents so you can verify which actor actually executed each task. The project appears to have many contributors, which the presenters say is driving fast iteration and more communication-channel visibility (Telegram/Discord).
