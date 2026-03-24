---
youtube_id: "WQ6xcjB-tqU"
title: "OpenCode Agents in 16 Minutes & my best tips"
channel: "Brandon Melville"
publish_date: "2026-03-06T18:10:23-08:00"
original_url: "https://www.youtube.com/watch?v=WQ6xcjB-tqU"
thumbnail: "https://i.ytimg.com/vi/WQ6xcjB-tqU/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/brandon-melville
  - date/2026-03-06
  - topic/general
---

# OpenCode Agents in 16 Minutes & my best tips

## 영상 정보
- 채널: Brandon Melville
- 게시일: 2026-03-06T18:10:23-08:00
- 원본 URL: https://www.youtube.com/watch?v=WQ6xcjB-tqU
- 썸네일: https://i.ytimg.com/vi/WQ6xcjB-tqU/maxresdefault.jpg

## 한글 요약
## OpenCode agents in 16 minutes — core takeaways
The video’s core claim is that custom OpenCode agents let you treat the environment like infrastructure instead of a chat interface, improving consistency, speed, and safety by packaging workflows, tools, constraints, and instructions into reusable units. Primary agents drive interaction while sub agents handle narrow, read-or-write-limited tasks; *"Agents let you package a workflow, tools, constraints, instructions so you can run it again."* Agents are defined as plain files: *"An open code agent is really just a markdown file with a YAML front matter."* That front matter controls model, tools, permissions, temperature and mode, which lets teams standardize behavior across repos.

Concrete demos show how this works in practice: a reviewer sub-agent with write disabled analyzed a Python file, produced categorized findings (high/medium/low), and auto-created a code-review document with line-level evidence and a recommended fix; switching modes can make the same agent primary so you can invoke it directly. The presenter explains agent primitives (agents = configured assistants, skills = reusable playbooks, commands = shortcuts), shows JSON and Markdown agent definitions, and demonstrates the BMAD framework that installs prebuilt agent personas (project manager, developer, UX, quick-flow solo dev) to scaffold tasks like building a Pygame snake or a static React/Vite site. The takeaway: design one-job-per-agent, combine agents + skills + commands, and iterate prompts to continuously raise baseline quality across projects.
