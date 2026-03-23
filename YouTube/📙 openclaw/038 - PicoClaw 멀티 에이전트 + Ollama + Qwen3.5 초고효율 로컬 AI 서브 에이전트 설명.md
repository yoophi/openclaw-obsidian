---
title: "PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained"
source: "https://www.youtube.com/watch?v=9CNEpIUZAmY"
original_url: "https://www.youtube.com/watch?v=9CNEpIUZAmY"
youtube_id: "9CNEpIUZAmY"
playlist: "📙 openclaw"
channel: "Devs Kingdom"
duration: "11:03"
publish_date: "2026-02-28T08:51:09-08:00"
playlist_index: 38
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:09:21 +0900"
---

# PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained

## Video Info

- Original URL: https://www.youtube.com/watch?v=9CNEpIUZAmY
- Channel: Devs Kingdom
- Title: PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained
- Published: 2026-02-28T08:51:09-08:00
- Duration: 11:03
- Playlist: 📙 openclaw
- Playlist Index: 38

## Description

consulting: https://openclaw.productdeploy.com
This video explained how PicoClaw SubAgents work and showed configuration examples that is not documented on the github yet

links:
https://github.com/sipeed/picoclaw/tree/main
https://github.com/sipeed/picoclaw/tree/main/pkg/tools

OpenClaw Tutorials
https://youtu.be/1n3tcHo1mNs
https://youtu.be/5WIb0RZ_dqY
https://youtu.be/T-1ZMw2p2Yc
https://youtu.be/Nanj16qKSVc
https://youtu.be/Znc46FAIB5w
https://youtu.be/kRoEl9P6-ig
https://youtu.be/gKX4SwpWXi4
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

## PicoClaw SubAgents: setup, experiment, and current limitations

This tutorial walks through configuring and testing PicoClaw’s new SubAgents. The presenter shows prerequisites (Go, a local LLM runtime like Ollama/llama and a 3.5×27B-style model), cloning the PicoClaw repo and running make install, then editing config.json. Important config items: set "restrict_to_workspace" (default true) to false for testing, point provider to an OpenAI-compatible endpoint, set the model name, and define a subagent list where one entry must have "default": true (the lead agent). Example roles used in the demo are a lead “researcher”, a “fast” quick assistant, and a “summarizer”. The demo invokes the CLI (agent message) with a prompt asking the researcher to spawn a fast-profile subagent that searches DuckDuckGo for Seattle’s current temperature in Celsius and returns a one-sentence summary.

The experiment shows the spawn flow works but result retrieval does not. Logs report the async tool completed and the system notes that *the sub agent has been created and is running in the background*; the run looks correct and the researcher’s workspace files are examined, yet there’s no separate process or built-in tool that returns the subagent’s output back into the conversation. The lead agent ends up offering to perform the task itself after the spawn because it “successfully spawn a sub aent using the fast profile” but cannot fetch that subagent’s result. Practically, spawning multiple independent agents from a top-level controller works, but chaining/nesting agents (agent A calling agent B that in turn calls agent C) doesn’t return results as expected. The presenter points to the new subagent implementation under package.tools and to sample test configs (recently added) as places to review; the feature is functional but limited and may be expanded in future updates.
