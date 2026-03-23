---
title: "🚨 Do NOT use Claude in OpenClaw"
source: "https://www.youtube.com/watch?v=7DNlQgl2Kk0"
original_url: "https://www.youtube.com/watch?v=7DNlQgl2Kk0"
youtube_id: "7DNlQgl2Kk0"
playlist: "📙 openclaw"
channel: "The Next New Thing"
duration: "8:07"
publish_date: "2026-02-18T15:54:55-08:00"
playlist_index: 72
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 18:25:09 +0900"
---

# 🚨 Do NOT use Claude in OpenClaw

## Video Info

- Original URL: https://www.youtube.com/watch?v=7DNlQgl2Kk0
- Channel: The Next New Thing
- Title: 🚨 Do NOT use Claude in OpenClaw
- Published: 2026-02-18T15:54:55-08:00
- Duration: 8:07
- Playlist: 📙 openclaw
- Playlist Index: 72

## Description

We used these 2 commands:
First:
openclaw onboard --auth-choice openai-codex

Second:
openclaw models set openai-codex/gpt-5.3-codex

openclaw models status --plain


Presented by Zapier
https://zapier.com/

Anthropic made it official: you can’t use a Claude subscription to power OpenClaw anymore.

So what’s the cheapest, compliant way to run top-tier models inside OpenClaw today?

In this episode of The Next New Thing, Andrew Warner brings back Caleb Hodges, founder of God Mode, to show exactly how to switch OpenClaw from per-API billing to your ChatGPT (OpenAI) subscription — step by step.

This update follows two previous videos:

One showing how advanced users build OpenClaw swarms
https://youtu.be/_ISs5FavbJ4

Another showing how to use a Claude subscription to avoid API fees
https://youtu.be/I7KFOhjmM1M

Now that Anthropic has clarified its terms, that workaround is off the table. But according to OpenClaw’s founder, OpenAI subscriptions are allowed — and Caleb walks through the exact terminal command and authentication flow to make the switch.

If you’re running OpenClaw for agents, workflows, or personal AI infrastructure, this episode could save you significant API costs and prevent configuration headaches.


Episode Highlights / Timestamps
00:00 Anthropic clarifies subscription policy
00:18 The API cost problem for OpenClaw users
00:36 Why OpenAI subscriptions are now the best option
01:12 Confirmation from OpenClaw’s founder
01:30 Bringing Caleb Hodges back
01:57 Switching from Claude to ChatGPT
02:33 The one-line auth command
03:18 Authenticating with Codex
04:12 Verifying OpenAI access inside OpenClaw
05:06 Why to use VS Code instead of in-app edits
05:51 Setting OpenAI as the default model
06:54 When subscription beats API billing
07:03 What God Mode installs for entrepreneurs


If you’re building AI systems instead of just chatting with AI, this is required viewing.

👉 Join us: https://thenextnewthing.ai/

## Summary

## Do NOT use Claude in OpenClaw

The video reports a policy change: *"As of today, February 18th, it is official that Anthropic does not allow us to use our clawed subscriptions with OpenClaw."* The host says that makes OpenAI the best-priced route for top-of-the-line models in OpenClaw and relays that the OpenClaw founder reported Sam Altman indicated using an OpenAI subscription is allowed. Caleb Hodes then demonstrates the full switch process live.

Caleb’s step-by-step demo: log into your ChatGPT/OpenAI account on the machine that runs OpenClaw; open a terminal (or use VS Code externally); run the OpenClaw onboarding/auth command to choose OpenAI auth and follow the browser sign-in prompt. The transcript and page notes show the commands used: `openclaw onboard --auth-choice openai-codex` and to change models `openclaw models set openai-codex/gpt-5.3-codex` (then verify status with `openclaw models status --plain`). After signing in, return to the terminal, confirm the tool reports the OpenAI subscription is connected, and check OpenClaw to ensure the default model switched. Caleb emphasizes making config edits from outside the OpenClaw runtime (terminal or VS Code) to avoid self-modification lockouts.

Other details and context: the host originally explored using subscriptions to avoid per-request API fees and readers raised terms-of-service concerns, prompting this update. Caleb’s company, God Mode, is mentioned as a service that builds personal AI workflows on OpenClaw and offers interface/UX choices for managing many sessions. The clip is a concise, practical walkthrough of the exact commands, login flow, and a safety tip (edit configs outside the running OpenClaw); it’s useful if you run OpenClaw and need to move to an OpenAI subscription. *"You are now using your OpenAI subscription. It is connected and stable."*
