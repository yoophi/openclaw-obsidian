---
title: "My OpenClaw Is Forgetting Everything — Here's How I Fixed It"
source: "https://www.youtube.com/watch?v=iUkFb_TaqZA"
original_url: "https://www.youtube.com/watch?v=iUkFb_TaqZA"
youtube_id: "iUkFb_TaqZA"
playlist: "📙 openclaw"
channel: "Dave Swift"
duration: "19:09"
publish_date: "2026-02-18T09:19:30-08:00"
playlist_index: 73
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:25:25 +0900"
---

# My OpenClaw Is Forgetting Everything — Here's How I Fixed It

## Video Info

- Original URL: https://www.youtube.com/watch?v=iUkFb_TaqZA
- Channel: Dave Swift
- Title: My OpenClaw Is Forgetting Everything — Here's How I Fixed It
- Published: 2026-02-18T09:19:30-08:00
- Duration: 19:09
- Playlist: 📙 openclaw
- Playlist Index: 73

## Description

Sponsor 👉 Try the AI Chatbot for FREE here: https://daveswift.link/elfsight

Use coupon DAVESWIFT for a 30% discount on Elfsight widgets!

OpenClaw's built-in memory system doesn't deliver on its promise of persistent, forever memory. In this tutorial, I show you how to integrate Obsidian with your OpenClaw agent to create a real, working memory system that actually persists across conversations.

📝 Show Notes: https://daveswift.com/openclaw-obsidian-memory/
⭐ Join Premium: https://daveswift.com/join/


🔗 Resources:
📖 X Article: https://x.com/arscontexta/status/2013045749580259680
📥 Obsidian (Free): https://obsidian.md/
🔒 Tailscale: https://tailscale.com/

Chapters:
00:00 Introduction
00:37 OpenClaw's Memory Problem
02:31 The Obsidian Inspiration
03:01 Setting Up Obsidian
03:27 Creating Your First Vault
04:38 Designing the File Structure
07:46 Syncing Across Devices
10:05 Security Considerations
12:13 Configuring OpenClaw
14:42 Setting the Vault Path
15:25 Indexing the Vault
16:32 Troubleshooting and Testing
18:06 Understanding Your Thinking

Follow me:
Facebook: https://facebook.com/groups/daveswift
Twitter: https://twitter.com/davidswift
YouTube: https://youtube.com/@dave-swift
Web: https://daveswift.com

Website Management: https://clientamp.com

Some links in this description are affiliate links. If you purchase through these links, I may earn a small commission at no extra cost to you. I only recommend products I genuinely use and believe in.

#OpenClaw #Obsidian #AIMemory #AIAgent #PersonalAI #Tutorial

## Summary

## My OpenClaw Is Forgetting Everything — Here's How I Fixed It

Dave shows how he turned a flaky OpenClaw agent into a reliable, searchable personal memory by connecting it to an Obsidian vault. He runs OpenClaw’s agent “Lloyd” on an M1 Mac Mini and discovers that the out‑of‑the‑box promise of persistence doesn’t hold: *"It's a promise of persistent forever memory kind of is a lie."* The video’s core solution is to let the agent index a local Obsidian folder so long‑form notes and personal context become first‑class inputs for future conversations.

He walks through the practical steps: install Obsidian and create a vault (a folder of Markdown files), decide whether to store it locally or use Obsidian’s sync, and build a file structure that models your thinking and personal data. Rather than hand‑author everything, he has Lloyd read a recommended template article, ask clarifying questions, and create the folders and sample notes automatically; he also highlights the tip to tell an agent to ask clarifying questions so it won’t invent missing details. For remote access he mentions using a network drive or a VPN‑style tool (Tailscale) so the vault is reachable from multiple devices.

The technical integration requires pasting a memory block into OpenClaw’s JSON config that points at the vault path, removing the default memory block, saving with proper JSON syntax (watch commas and brackets), and restarting the agent so the QMD indexer can scan the vault. He runs into one practical snag—spaces in the vault name prevented indexing—so he renames it and confirms indexing. After indexing, searches and commands work: the agent finds related notes, creates new project notes, and files them in the right place; for example, *"It created a new note in my projects folder."* He also warns about security tradeoffs: if your agent uses cloud LLMs, the shared notes may be exposed to external providers, so consider what you store or whether to run models locally. Other useful tips: keep small Markdown files for fast sync, back up the agent/config before editing, and you can have the agent fix JSON syntax or perform the edits itself.
