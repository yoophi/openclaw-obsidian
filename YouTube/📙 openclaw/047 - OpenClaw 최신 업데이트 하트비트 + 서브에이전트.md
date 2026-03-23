---
title: "New OpenClaw Update: Heartbeat + Subagents"
source: "https://www.youtube.com/watch?v=uKzcoFaaAhc"
original_url: "https://www.youtube.com/watch?v=uKzcoFaaAhc"
youtube_id: "uKzcoFaaAhc"
playlist: "📙 openclaw"
channel: "Julian Goldie SEO"
duration: "10:38"
publish_date: "2026-02-26T05:01:47-08:00"
playlist_index: 47
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:14:35 +0900"
---

# New OpenClaw Update: Heartbeat + Subagents

## Video Info

- Original URL: https://www.youtube.com/watch?v=uKzcoFaaAhc
- Channel: Julian Goldie SEO
- Title: New OpenClaw Update: Heartbeat + Subagents
- Published: 2026-02-26T05:01:47-08:00
- Duration: 10:38
- Playlist: 📙 openclaw
- Playlist Index: 47

## Description

Want to make money and save time with AI? Get AI Coaching, Support & Courses 👉 https://www.skool.com/ai-profit-lab-7462/about

Get a FREE AI Course + 1000 NEW AI Agents + Video Notes  👉 https://www.skool.com/ai-seo-with-julian-goldie-1553/about

Want to know how I make videos like these? Join the AI Profit Boardroom → https://www.skool.com/ai-profit-lab-7462/about

Get a FREE AI SEO Strategy Session: https://go.juliangoldie.com/strategy-session?utm=julian

Get the AI Client Acquisition Engine: https://www.skool.com/the-content-clone-9266/about

OpenClaw Update: Heartbeat DMs & Sub-Agent Fixes (Feb 25)

Discover everything new in the latest OpenClaw update, including the return of heartbeat DMs and a complete overhaul of sub-agent messaging. We walk through a live update demonstration and explain how these security and performance fixes improve your AI assistant's reliability.

00:00 - Intro: OpenClaw Update
01:24 - Exploring the Change Log
02:03 - How to Update OpenClaw
03:32 - Verifying the New Version
04:53 - What is OpenClaw?
05:28 - Heartbeat DM & Sub-Agents
08:30 - AI Automation Community

## Summary

## New OpenClaw update (Feb 25) — what's fixed and why it matters

This release restores heartbeat DM delivery and rebuilds subagent messaging, plus a bundle of security fixes for OpenClaw integrations (Slack, Discord, Telegram and OpenCore). *Heartbeat DM deliveries back on.* *Your assistant can reach you again.* Those two fixes are the headline: the assistant’s periodic “still working” pings now go to your DMs again by default, and the helper subagents that run background tasks no longer silently drop or mis-route results.

Under the hood the subagent delivery flow was rewritten as a state machine: deliveries follow a checklist, use fallback routes on failure, and only mark tasks complete when delivery is confirmed, which addresses lost messages and cleanup problems. The update also addresses platform-specific bugs (for example Telegram reporting false deliveries), Slack thread/session context and routing errors (silent overflow, wrong routing, oversized page blocks), improved startup/chat streaming and markdown handling on Android, and new agent/heartbeat configuration options so you can disable heartbeat DMs per agent or via the config file.

How to get it: enable automatic updates in Settings → All settings → Updates (the creator shows updating to the Feb 25 build and version 2025). Expect occasional instability during live updates — the gateway may pause or stop responding briefly and some users have needed to reinstall or restart the OpenCore daemon if it fails completely. Net effect for users: more reliable, auditable message delivery from subagents, restored heartbeat visibility, and tighter security for messaging integrations, though the creator notes the project has grown more buggy as it’s expanded.
