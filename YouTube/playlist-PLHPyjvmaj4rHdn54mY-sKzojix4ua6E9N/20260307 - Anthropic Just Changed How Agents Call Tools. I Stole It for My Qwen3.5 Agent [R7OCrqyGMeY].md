---
youtube_id: "R7OCrqyGMeY"
title: "Anthropic Just Changed How Agents Call Tools. I Stole It for My Qwen3.5 Agent"
channel: "The AI Automators"
publish_date: "2026-03-07T03:32:59-08:00"
original_url: "https://www.youtube.com/watch?v=R7OCrqyGMeY"
thumbnail: "https://i.ytimg.com/vi/R7OCrqyGMeY/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/the-ai-automators
  - date/2026-03-07
  - topic/tools
---

# Anthropic Just Changed How Agents Call Tools. I Stole It for My Qwen3.5 Agent

## 영상 정보
- 채널: The AI Automators
- 게시일: 2026-03-07T03:32:59-08:00
- 원본 URL: https://www.youtube.com/watch?v=R7OCrqyGMeY
- 썸네일: https://i.ytimg.com/vi/R7OCrqyGMeY/maxresdefault.jpg

## 한글 요약
Anthropic Just Changed How Agents Call Tools — practical test with Qwen 3.5

This video breaks down two Anthropic-inspired patterns that reduce context bloat and make tool-heavy agents practical: the tool search (deferred loading of tool schemas) and programmatic tool calling (generating and executing scripts in a sandbox). In the demo, deferring MCPs cut the initial context from about 60 tools to 12 and dropped session tokens from ~13,000 to ~6,300; Anthropic reported “an 85% reduction in token usage,” but the creator shows the savings depend heavily on the task and dataset. *"the tool search tool allows the agent to search the tool registry to discover and load tools by name or keyword."*

Programmatic tool calling pushes data work out of the LLM by having the model generate code that runs in an isolated sandbox; that sandbox executes loops and many internal API calls via a secure “tool bridge,” so the model doesn’t bloat context with intermediate results or ever sees secrets. In tests the traditional multi-call approach burned tens of thousands of tokens (examples: 76,000 tokens and 56 tool calls, missing one result), while programmatic/sandboxed runs were far more efficient and reliable: one run used ~58,000 tokens across several iterations, another 45,000 tokens with only four tool calls on Qwen 3.5 and produced the correct output. *"it was 45,000 tokens to get to an accurate response, which is pretty cool."*

The author emphasizes practical trade-offs: programmatic calls are iterative (the model may generate-and-fix code) and need schemas/examples to avoid errors; Anthropic’s “tool use” examples are useful—they raised accuracy on complex parameters from ~72% to ~90% in testing. Implementation notes include converting MCP schemas into language-native stubs (Python/TypeScript) for better generation, running sandboxes via container tooling, and using a bridge pattern so sandboxes have no direct internet or credential access.
