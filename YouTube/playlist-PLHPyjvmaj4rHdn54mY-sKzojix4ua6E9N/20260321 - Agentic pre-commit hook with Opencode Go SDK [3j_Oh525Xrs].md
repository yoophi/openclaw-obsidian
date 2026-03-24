---
youtube_id: "3j_Oh525Xrs"
title: "Agentic pre-commit hook with Opencode Go SDK"
channel: "package main"
publish_date: "2026-03-21T06:02:34-07:00"
original_url: "https://www.youtube.com/watch?v=3j_Oh525Xrs"
thumbnail: "https://i.ytimg.com/vi/3j_Oh525Xrs/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/package-main
  - date/2026-03-21
  - topic/general
---

# Agentic pre-commit hook with Opencode Go SDK

## 영상 정보
- 채널: package main
- 게시일: 2026-03-21T06:02:34-07:00
- 원본 URL: https://www.youtube.com/watch?v=3j_Oh525Xrs
- 썸네일: https://i.ytimg.com/vi/3j_Oh525Xrs/maxresdefault.jpg

## 한글 요약
## Summary
This clip demonstrates a practical pre-commit hook that runs a local coding agent (an Open Code server) via the Open Code Go SDK to review staged git changes before a commit. The tool shells out to git to get staged diffs, creates a session on the server, sends a prompt asking the agent to *"review the code, look for typos, unnecessary debug statements, bugs, security issues, and so forth,"* and asks for a strict JSON reply (status + issues array). The program unmarshals that JSON into Go structs and exits non‑zero to block the commit when the agent reports problems; if there are no staged changes it exits zero and lets the commit proceed.

Implementation notes and results: the demo uses os/exec to run git diff for staged changes, builds a single Go executable, places it in .git/hooks/pre-commit and makes it executable, and uses the SDK to create a session, send prompts, combine fragment responses, and delete the session on defer. The expected JSON schema is simple—*“status is pass and issues is an empty array”*—so the hook can decide whether to fail the commit. The author tested it with Opus models and shows it catching debug prints, typos and duplicate files; they also warn LLM outputs are nondeterministic and recommend continuing to use linters/formatters alongside agent checks.
