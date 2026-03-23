---
title: "OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team"
source: "https://www.youtube.com/watch?v=5WIb0RZ_dqY"
original_url: "https://www.youtube.com/watch?v=5WIb0RZ_dqY"
youtube_id: "5WIb0RZ_dqY"
playlist: "📙 openclaw"
channel: "Devs Kingdom"
duration: "11:39"
publish_date: "2026-02-24T18:51:13-08:00"
playlist_index: 55
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:18:25 +0900"
---

# OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team

## Video Info

- Original URL: https://www.youtube.com/watch?v=5WIb0RZ_dqY
- Channel: Devs Kingdom
- Title: OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team
- Published: 2026-02-24T18:51:13-08:00
- Duration: 11:39
- Playlist: 📙 openclaw
- Playlist Index: 55

## Description

consulting: https://openclaw.productdeploy.com
this video demonstrated what is openclaw subagents and how to setup and operate openclaw multi agents team with OpenClaw CLI and Ollama Qwen3
 
Sub-agents are background agent runs spawned from an existing agent run but in their own session and when finished, announce their result back to the requester session

session key examples:
agent:(sub_agentId) :subagent: (session_uuid) 
agent:(agentId) : (session) 

https://docs.openclaw.ai/tools/subagents
https://docs.openclaw.ai/concepts/multi-agent

OpenClaw Tutorials
https://youtu.be/1n3tcHo1mNs
https://youtu.be/T-1ZMw2p2Yc
https://youtu.be/Nanj16qKSVc
https://youtu.be/Znc46FAIB5w
https://youtu.be/kRoEl9P6-ig
https://youtu.be/gKX4SwpWXi4
https://youtu.be/9CNEpIUZAmY
https://youtu.be/PMkgPhcXYjQ

Unlock premium AI powerhouses like GPT, Gemini, Nano Banana Pro, and more — with just one affordable, one-time payment (no endless subscriptions!) 
Book a free discovery call now 👉 https://cal.com/productdeploy

Kaggle notebooks:
Notebook is only created for demonstration and serve as a guidance for those who were interested using similar methods to build projects.  It is NOT a free giveaway for a few reasons. 1. it works while the video is recorded, However it does not guarantee to work at a later date as tech communities make code changes all the time. Please follow the tutorial and create your own version of it if needed. 2. If you have any questions or need help, please join the discord server community to discuss or subscribe to the channel. 3. if you need further professional assistance, please feel to book a consulting call. Thanks for understanding

Discuss:
https://discord.gg/EXjaZnudHu

Discovery Call: 
https://cal.com/productdeploy

Follow me on x.com:
https://x.com/jacobcdev


[Helpful links]:

[Must Watch]:
How to Setup OIlama On Kaggle
https://youtu.be/W6nMkzVcELQ

How to setup Ollama with multi GPUs on Kaggle 
https://youtu.be/In8jMEXRDwA

How to Use Free GPU on Kaggle:  
https://www.youtube.com/watch?v=djbjDOBkz1k

How to Setup Visual Studio Code Web on Kaggle
https://youtu.be/tGKz3zLwnd0

Transform Kaggle Notebook to Virtual Machine with Good GPU, CPU and RAM
https://www.youtube.com/watch?v=n-USPtP9H3I

How to Setup VLLM On Kaggle Notebook
https://www.youtube.com/watch?v=Quwf1TBycgM

How to Setup OpenWebUI On Kaggle Notebook
https://youtu.be/0jAhK3hlIbM

How to Setup the Best Open Source Manus AI Agent (Kortix Suna) Locally
https://youtu.be/q9xeHfdTcdQ?si=4q4zZ8sGqc39GlMq

How to Setup ComfyUI on Kaggle Free GPU
https://youtu.be/orhLPlVRUMc?si=MH9BcAijVPf-FYFJ

How to Setup Gradio Tunnel on Kaggle
https://youtu.be/vmPYKWRV4xo?t=206

[You might also like]:

PlayList
https://www.youtube.com/playlist?list=PLn32cjH9B2Bqub_kg74d-U4EfiexZ6ILi
https://www.youtube.com/playlist?list=PLn32cjH9B2BoiOj_qYE1o-WFzyLdLb3Hr
https://www.youtube.com/playlist?list=PLn32cjH9B2Bqc9iRDrq2uDGBZmxljsAvT
https://www.youtube.com/playlist?list=PLn32cjH9B2BoU8393rCUbqbKLFb4Oc4Op
https://www.youtube.com/playlist?list=PLn32cjH9B2Bp_rSIQRt8V37XISvZ_WjEq
https://www.youtube.com/playlist?list=PLn32cjH9B2Bqp27lvFGzCBKyZaJg9mljY
https://www.youtube.com/playlist?list=PLn32cjH9B2BpbOu1M1C8zyNPel2eYrdLB


Music from #Uppbeat (free for Creators!):
https://uppbeat.io/t/21-on-the-block/...
License code: MKM7BDGHR8BXIH2S

Music from #Uppbeat (free for Creators!):
https://uppbeat.io/t/theo-gerard/the-good-life
License code: ATVBJRKCLBUUMZYA

Music from #Uppbeat (free for Creators!):
https://uppbeat.io/t/rahul-popawala/vacay-vibes
License code: KMBSTRNDE4NR5A9I

## Summary

## OpenClaw subagent overview

This tutorial explains what a sub agent is and how to set up and run multi-agent teams in OpenClaw. A sub agent is described as *it is a background agent that runs spawned from an existing agent run*; agents are equal by definition but become parent/subordinate depending on how they're launched within a session. When a sub agent runs, it gets its own UUID while the caller agent's ID remains the agent ID; results are returned to the caller's session when the sub agent finishes.

## Configuration and files to edit

Key setup steps live in the OpenClaw workspace and the OpenCore JSON: order the agents list so the default (lead/orchestrator) agent is first, and list allowed sub agents in that agent's configuration so they can be spawned from its session. Configure the sub agent max spawn depth to control nesting (depth 1 = one-level sub agent, depth 2 = nested sub agents). Customize each agent with the soul markdown (agent identity/description) and the agents markdown (playbook and rules), and place optional workflow automation prompts or tools in the workspace folders described in the demo.

## How to test and operate (TUI commands and example)

The simplest test is the OpenClaw TUI (terminal UI). Use slash commands to inspect agents, switch active agents, and spawn sub agents (commands shown include agent list, agent picker/switch, and the subagent spawn command). The demo spawns a writer sub agent from an orchestrator session, receives the written article in the same session, and shows the returned output. As the presenter notes, *when finished announce their result back to the requesttor chat channel.* The video walks through the exact command flow and where to find the session IDs and returned content in the TUI.
