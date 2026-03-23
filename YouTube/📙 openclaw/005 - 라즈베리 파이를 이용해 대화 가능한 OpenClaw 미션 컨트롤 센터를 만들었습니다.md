---
title: "I Built an OpenClaw Mission Control You Can Talk To (Raspberry Pi)"
source: "https://www.youtube.com/watch?v=OI-rYcaM9LQ"
original_url: "https://www.youtube.com/watch?v=OI-rYcaM9LQ"
youtube_id: "OI-rYcaM9LQ"
playlist: "📙 openclaw"
channel: "Mayukh Builds"
duration: "13:32"
publish_date: "2026-03-18T11:53:29-07:00"
playlist_index: 5
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:45:39 +0900"
---

# I Built an OpenClaw Mission Control You Can Talk To (Raspberry Pi)

## Video Info

- Original URL: https://www.youtube.com/watch?v=OI-rYcaM9LQ
- Channel: Mayukh Builds
- Title: I Built an OpenClaw Mission Control You Can Talk To (Raspberry Pi)
- Published: 2026-03-18T11:53:29-07:00
- Duration: 13:32
- Playlist: 📙 openclaw
- Playlist Index: 5

## Description

I built an AI command center on a Raspberry Pi 5 with a 7" touchscreen that you can actually talk to. It has three AI agents — Jansky (the boss), Orbit (the coder), and Nova (the researcher) — each with their own voice, living in a pixel art office. There's an animated crab mascot with 7 emotions, real-time system monitoring, and a visual command terminal. All powered by OpenClaw.

Detailed video on setting up Openclaw with Raspberry Pi 5:
https://youtu.be/KjxYpRkPT48

Things you will need:

1. Raspberry Pi 5 8GB: https://amzn.to/4bkHe1b
2. 32 GB microSD card: https://amzn.to/3OZTdse
3. 25W power adapter: https://amzn.to/47pAr3P
4. 7 inch touch display: https://amzn.to/4rMU8uD
5. USB microphone for Pi: https://amzn.to/40b4Fnm
6. USB speaker for Pi: https://amzn.to/4rMUSjp

🔗 Links & Resources:
- My command center code: https://github.com/mayukh4/openclaw-command-center
- OpenClaw: https://openclaw.ai/



⏱️ Timestamps:
0:00  Intro
1:18  OpenClaw mission control
2:39  The hardware 
3:51  Installing OpenClaw
6:30  Setting up the mission control 
7:53  Mission control overview + demo 
10:27 Openclaw+Home Assistant
11:47 Outro

🏷️ Tags:
openclaw raspberry pi, openclaw command center, raspberry pi ai terminal, ai desk companion, openclaw voice, pixel art ai agents, raspberry pi touchscreen, openclaw cyberdeck, ai tamagotchi, local ai agent, diy alexa replacement, raspberry pi project 2026, openclaw tutorial, ai command center, raspberry pi 5 project

#OpenClaw #RaspberryPi #AICommandCenter

## Summary

## OpenClaw mission control on a Raspberry Pi — quick take

This video shows how the creator built a local, voice-controlled “mission control” running OpenClaw on a Raspberry Pi 5 with a 7" touchscreen; it presents three cooperating AI agents in a pixel-art office, a mascot that reflects system emotion, and real-time visual feedback for everything the agents do. The main selling points are that it runs on inexpensive hardware, supports two-way natural voice (speech-to-text and speech synthesis), and visually animates agent activity instead of dumping raw logs. *"This OpenCloud agent running on my Raspberry Pi just checked my email, told me what's important, and I did it all through natural voice."*

Hardware and install essentials are straightforward: a Raspberry Pi 5 (8 GB recommended but lower models work), optional NVMe SSD (or SD card), a 7" LCD touchscreen, a USB microphone, and a USB speaker. Software steps shown: SSH into the Pi, install OpenClaw from its GitHub repo in hackable mode, run the onboard setup, paste model/API keys, and configure a Telegram bot for remote pairing. The creator then adds a web-based command-center front end that connects to OpenClaw via a websocket bridge; the UI has three zones (mascot, pixel-art office with three agents, and an activity log) and lets you tap an agent to talk to that agent directly. Agent roles are explicit: Jansky is the orchestrator/boss (runs the top-level model), Orbit handles code and command-line tasks, and Nova handles research and web lookups; each agent has a distinct voice and personality. *"I'm Jansky, the AI assistant running this openclaw setup on a Raspberry Pi 5."*

Demonstrations include checking email via voice, delegating tasks between agents, and controlling Home Assistant devices (e.g., turning LED strips on) through natural speech; the video shows the agents physically walking to desks and reporting results back verbally. The whole stack is presented as free and open source: the command-center code is published on GitHub and the setup uses multiple API providers (speech-to-text, orchestrator models, and optional web-scraping APIs) that you add during onboarding. The creator also mentions cost-saving prompt/config tips to reduce monthly usage and frames the project as extensible (websocket skill, custom agent personalities, Home Assistant integration). If you want a compact, tangible demo of a local, talkable multi-agent dashboard that you can run on desktop hardware, this clip shows the end-to-end build, live demos, and the exact install flow.
