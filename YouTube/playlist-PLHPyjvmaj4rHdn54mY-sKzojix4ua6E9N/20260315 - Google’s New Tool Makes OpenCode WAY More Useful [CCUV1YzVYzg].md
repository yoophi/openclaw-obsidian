---
youtube_id: "CCUV1YzVYzg"
title: "Google’s New Tool Makes OpenCode WAY More Useful"
channel: "Brandon Melville"
publish_date: "2026-03-15T12:06:45-07:00"
original_url: "https://www.youtube.com/watch?v=CCUV1YzVYzg"
thumbnail: "https://i.ytimg.com/vi/CCUV1YzVYzg/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/brandon-melville
  - date/2026-03-15
  - topic/tools
---

# Google’s New Tool Makes OpenCode WAY More Useful

## 영상 정보
- 채널: Brandon Melville
- 게시일: 2026-03-15T12:06:45-07:00
- 원본 URL: https://www.youtube.com/watch?v=CCUV1YzVYzg
![thumbnail](https://i.ytimg.com/vi/CCUV1YzVYzg/maxresdefault.jpg)

## 한글 요약
Google’s new Workspace CLI + Open Code — quick take

A new command-line tool gives agents a single, structured interface across Gmail, Drive, Docs, Slides, and Calendar, and pairing it with Open Code makes those Workspace surfaces directly usable by an AI agent. The video demos the practical value (calendar events, inbox summaries with draft replies, and auto-generated Slide decks) and shows the repo traction: about 19.5k GitHub stars, 867 forks, and a lively Hacker News discussion. The creator highlights that *this repo ships with 100 plus agent skills* and that the CLI returns structured JSON the agent can act on, which is why it feels more reliable and token-efficient than ad-hoc script hacks.

You also get a step-by-step setup walkthrough and concrete security advice: create a separate Google account and a dedicated Cloud project, configure the OAuth consent screen and a web client ID (add the local redirect URI if you hit a redirect-uri mismatch), install the Google Cloud SDK, enable the APIs you need, and install the CLI/skills (the demo uses commands like `gws generate skills` and shows restarting Open Code so skills refresh). Examples show it adding a calendar event (with timezone and an event link), summarizing unread mail and drafting replies, and building an 8-slide presentation (the demo had ~68,000 tokens of context and produced speaker notes and styling iterations). Important caveats: it’s not an officially supported Google product and it’s still evolving, so restrict OAuth scopes and keep the agent tied to a non-sensitive test account. *put a meeting on my Google calendar for today at 8:00 p.m. regarding sales.*
