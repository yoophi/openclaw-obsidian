---
youtube_id: "CbQGeaa8XrQ"
title: "Vibe Coder Tries Neovim"
channel: "Bog"
publish_date: "2025-03-27T11:21:10-07:00"
original_url: "https://www.youtube.com/watch?v=CbQGeaa8XrQ"
thumbnail: "https://i.ytimg.com/vi/CbQGeaa8XrQ/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/bog
  - date/2025-03-27
  - topic/general
---

# Vibe Coder Tries Neovim

## 영상 정보
- 채널: Bog
- 게시일: 2025-03-27T11:21:10-07:00
- 원본 URL: https://www.youtube.com/watch?v=CbQGeaa8XrQ
- 썸네일: https://i.ytimg.com/vi/CbQGeaa8XrQ/maxresdefault.jpg

## 한글 요약
## Vibe Coder Tries Neovim
The creator installs and explores Neovim (vs Vim), then tries the LazyVim starter to turn Neovim into an IDE-like environment. He runs into a chain of real-world setup problems—wrong install methods, missing LuaRocks and nerd fonts, terminal/color issues (solved by using Kitty), tree-sitter/build tools, and plugin-manager confusion—while learning keybindings, buffers, the built‑in file explorer and Telescope. *Neovim is a fancier version of Vim* sums up the starting point; the video repeatedly shows how small environment gaps cascade into many errors when you swap configs.

Most of the runtime work centers on getting autocompletion and LSP working for Python while building a Manim animation: finding and editing LazyVim’s plugin specs under ~/.config/nvim/lua/plugins, using lazy sync, enabling LazyVim “extras” (nvim-cmp and related coding extras), installing Mason-managed language servers, and finally installing Node/npm so Mason can fetch the needed LSP tools (the transcript shows a “pyite/pyrite” LSP being installed). After several reinstalls and toggling extras, autocompletion appears and offers the same attribute completions the creator expected (e.g., Manim’s text properties), proving the stack works once every dependency is present. The takeaway: LazyVim can provide a VS Code‑like experience inside a terminal, but achieving that requires careful installation of fonts, native tools, Node/npm and correct lazy plugin specs—*I just know a few basic commands and also how to enable autocomp completion.*
