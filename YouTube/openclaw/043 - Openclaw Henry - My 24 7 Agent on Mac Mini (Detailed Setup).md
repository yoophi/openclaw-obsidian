---
title: "Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)"
source: "https://www.youtube.com/watch?v=ad_OU6jZXbI"
original_url: "https://www.youtube.com/watch?v=ad_OU6jZXbI"
youtube_id: "ad_OU6jZXbI"
playlist: "📙 openclaw"
channel: "Vibe with AI"
duration: "16:47"
publish_date: "2026-02-27T04:04:10-08:00"
playlist_index: 43
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:12:13 +0900"
---

# Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)

## Video Info

- Original URL: https://www.youtube.com/watch?v=ad_OU6jZXbI
- Channel: Vibe with AI
- Title: Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)
- Published: 2026-02-27T04:04:10-08:00
- Duration: 16:47
- Playlist: 📙 openclaw
- Playlist Index: 43

## Description

Today marks the beginning of something completely new: building a dedicated AI agent server that runs 24/7. Meet Henry, my AI chief of staff powered by Claude Opus 4.6, living on a Mac Mini and accessible anywhere through Telegram.

In this episode, you'll learn how to set up your own AI agent infrastructure with proper security from day one. We're using Tailscale for encrypted connections, Docker for sandboxed execution, and OpenClaw as the orchestration layer.

📚 CHAPTERS:
00:00 Introduction to Henry
02:18 Mac Mini Unboxing
02:51 Mac Mini Setup & Screen Sharing
06:38 Installing Tailscale for Remote Access
09:02 Setting Up Development Tools
10:02 Docker Installation for Security
11:04 OpenClaw Setup & Configuration
12:21 Telegram Bot Creation
14:18 First Conversation with Henry
15:42 What's Next - Building the Agent Team

This is just the foundation. Next episode, we're giving Henry a research agent, coding agent, and building a complete AI team with specialized roles and permissions.

🎯RESOURCES:
- OpenClaw: https://openclaw.ai
- Tailscale: https://tailscale.com
- Docker Desktop: https://docker.com

🚀 FREE 30-MIN AI CONSULTATION
Book a free call to discuss AI implementation for your business:
→ https://vibewith-ai.com

🛠️ MY APPS:
https://www.vibe-thumbnails.com
Code: VIBE100

## Summary

## My 24/7 AI chief of staff: setup and first run

This video documents a step‑by‑step build of a dedicated, always‑on home server that runs an AI “chief of staff” named Henry and answers via a messaging app. The presenter prioritizes security and reliability: the machine is set up as a fresh, isolated user account with screen sharing for initial configuration; a private tunneling service is installed so the owner can reach the device from anywhere; a container runtime is installed so every agent task runs sandboxed; and a native gateway/orchestrator is installed to manage agent identities, permissions and execution. The host wires the orchestrator to a hosted large language model (LLM) API and to a small chatbot instance so Henry can reply in chat immediately — he tests this live and gets a friendly initial reply from the agent. *Henry is here, chief of staff, friendly online, and ready to roll.* *Right now Henry can think in chat but the infrastructure we built today is designed to scale.*

The concrete setup steps shown and why they matter: create a new user account on the server (do not attach personal cloud accounts), enable screen sharing (System Settings → General → Sharing → enable screen sharing and toggle VNC viewer control with a password), find the machine IP from Wi‑Fi details, then connect from your main machine via Finder → Go → Connect to Server → vnc://<IP>. Install the private tunnel client and authenticate it so the server remains reachable off‑network. In Terminal, install developer command‑line tools and Git, then install the container runtime and a package manager to support the orchestrator. Run the orchestrator’s one‑liner installer, provide the LLM API key, and create/link the chatbot token so messages reach Henry. After onboarding, Henry starts with no memories or identity and asks for an intro; the presenter plans to feed a profile and then add specialty sub‑agents (research, coding, security) that each run in isolated containers and carry only the keys/permissions they need. The episode closes with a recap: a dedicated, encrypted, firewalled server account reachable remotely, containerized execution for safety, and an orchestrator that auto‑starts and coordinates the LLM‑backed chief of staff; future episodes add agent roles and task automation.
