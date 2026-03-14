# MarkDeck Development History

- Created: 2026-03-14 01:32 (Asia/Seoul)
- Project: MarkDeck
- Repository: https://github.com/yoophi-a/MarkDeck
- Version milestone: v1.0.0 tagged

## Overview

MarkDeck started as a markdown reader for local documents and evolved into a desktop-first markdown reading and review tool.

Current product goals:
1. Read markdown documents conveniently
2. Generate and share feedback conveniently based on markdown documents

---

## Development timeline summary

### 2026-03-12 — Reading foundation and early UX
- `f1af7bc` Initial commit
- `481e15a` docs: expand project README
- `9db5d7c` feat: add mermaid markdown rendering
- `107aea1` feat: improve document browsing and code rendering
- `14d2291` feat: add markdown search
- `3c59475` feat: support local markdown assets
- `87b0406` Add reading flow improvements

Major outcomes:
- markdown browsing / rendering foundation established
- search, Mermaid, local assets, better reading flow added

### 2026-03-12 evening — UI structure and reading polish
- `776e0e5` chore: add shadcn ui foundation
- `2566317` refactor: reorganize code into fsd layers
- `bb0367c` fix: decode document path segments
- `559cd3f` feat: polish fsd ui with shadcn components
- `8881fab` fix: track env example file
- `70ba9fe` feat: add document sidebar tree
- `fa2272e` fix: remove hardcoded content root defaults
- `a65b791` feat: support collapsible document tree
- `fb22b7c` feat: improve active navigation states
- `6841058` feat: highlight search matches
- `c431aa1` feat: expand wikilink aliases and anchors
- `45208f9` feat: add pinned documents
- `6ae5466` feat: enrich document metadata
- `cd9d597` feat: add reader layout preferences
- `7ee6f42` perf: lazy load document tree branches

Major outcomes:
- reading UX matured significantly
- tree navigation, TOC, search highlighting, WikiLink support, pinned docs, metadata, layout preferences added

### 2026-03-12 late night to 2026-03-13 morning — desktop architecture
- `6ce76de` chore: convert repo into pnpm workspace
- `374661d` docs: update repo layout for apps/web
- `8043d81` feat: add electron desktop shell
- `c536ae5` feat: wire desktop app to web dev server
- `ed2a62e` feat: add desktop content root picker
- `1d93b77` docs: draft desktop packaging plan
- `e041c0b` docs: compare long-term desktop architectures
- `91134dc` feat(desktop): validate dev and packaging flow
- `27eda4c` feat(desktop): read content through electron ipc
- `8a1981d` refactor: clarify web and desktop boundaries
- `9a11a8b` fix: align recent cards with app theme tokens
- `b5746b0` feat(desktop): move search to ipc
- `788aa24` feat(desktop): read assets over ipc
- `fb34996` refactor(desktop): prefer ipc for browse docs
- `6acc0a0` refactor(desktop): add renderer data layer
- `57376e6` docs(desktop): document bootstrap path
- `77363a3` feat(desktop): add hash router shell
- `63bdc2d` feat(desktop): add react query ipc state
- `f70afb9` refactor: split desktop renderer entry
- `24e4b91` refactor: decouple desktop settings from web restart
- `42a2def` refactor: normalize desktop ipc contracts
- `f18b48c` refactor: unify desktop persisted state hooks
- `5464f10` feat: improve desktop error fallback ux
- `f565e0f` fix(build): align root build with desktop standalone prep
- `592df70` fix(desktop): require explicit content root selection
- `7bf40ce` refactor(desktop): split renderer shell bootstrap
- `1335fa8` feat(desktop): surface watcher-driven auto refresh
- `f09935c` perf(desktop): expose indexed search cache status
- `78647ef` feat(desktop): add recent workspace quick reopen
- `838d17b` feat(desktop): document keyboard shortcuts in shell
- `e5c43d3` docs(desktop): codify cache ownership and invalidation
- `1474a6d` build(desktop): clean up mac packaging baseline
- `84d1e34` fix(desktop): allow dev boot without content root
- `241da87` fix(desktop): guard app links outside router context
- `6162857` fix(desktop): stabilize hydration and document hooks
- `a2bf45f` fix(desktop): mount renderer shell after hydration

Major outcomes:
- desktop app became a serious part of the product
- architecture shifted toward Electron main -> IPC -> renderer
- desktop routing, async state, content root flow, packaging baseline, single-instance behavior, CLI navigation support all improved

### 2026-03-13 daytime — reading UX and annotation/review features
- `92d8f08` feat: add document preview maximize mode
- `0fa0562` style: make main shell width responsive
- `1ca0357` fix: stabilize toc active heading sync
- `3b55ed1` feat: remember last view state
- `fd1dc2e` feat: add annotation data model draft
- `4e8bf59` feat: draft memo sidecar format
- `56cc0e7` feat: add selection annotation ui
- `1649d88` feat: add paragraph delete annotations
- `88d9011` feat: draft annotation feedback panel
- `ade3ca3` feat: add resizable document side panels
- `8a43f79` feat: add desktop keyboard shortcuts and help
- `5aa8ea0` fix: preserve preview selection for annotations
- `8a2b1b3` fix: keep document panel gap consistent
- `b4355f4` style: make resize handles more visible
- `7e54ceb` feat: add feedback panel toggle button
- `88434d6` feat: split toc and feedback panel toggles
- `5195752` fix: position selection toolbar above when needed
- `3b39182` fix: let document tree use full viewport height
- `1da3794` fix: render annotations more reliably
- `c075ce7` fix: align annotation markup with rendered text
- `9010321` fix: improve annotation quote matching with context
- `c612697` fix: keep selection stable and align annotation toolbar
- `d6c238f` feat: allow heading deletion annotations
- `eb4cc9c` fix: keep desktop document page hooks stable
- `6f1535c` fix: reduce comment input rerenders
- `982e188` fix: keep selection visible while toolbar is open
- `cce54b9` docs: add roadmap and planning documents
- `2f98799` feat(web): preview block comments in annotations
- `074fdbc` feat(web): add strikethrough text annotations
- `5421d66` feat(web): add block annotation quick actions
- `fa7ce70` style: refine annotation toolbar ux
- `2ceb93b` fix: stabilize annotation block toolbar
- `c5ea2d5` docs: add translation direction to roadmap

Major outcomes:
- annotation and feedback workflow became a real product layer
- selection-based highlight/comment/strike annotations added
- block-level quick actions and comment previews added
- feedback panel and `.memo` format draft introduced
- multiple rounds of UX stabilization and selection-preservation fixes completed

### 2026-03-13 evening — desktop execution fixes and docs refresh
- `95338ec` fix(desktop): enforce single app instance
- `0999a82` Fix desktop CLI launch navigation
- `da4f741` docs: refresh README for current product status

Major outcomes:
- packaged desktop app duplication bug fixed
- CLI launch support for directories / markdown files completed
- README updated to match actual product status

---

## Key turning points

### 1. Reader MVP -> usable document browser
The project quickly moved beyond a simple markdown viewer into a practical local document browser with search, TOC, images, Mermaid, sidebar tree, and Wikilinks.

### 2. Monorepo + desktop transition
A major transition happened when MarkDeck became a pnpm workspace and gained a dedicated Electron desktop shell.

### 3. Architecture shift toward desktop-first
The architecture direction evolved from “Electron wrapping a web app” into a more explicit:
- Electron main
- IPC contracts
- renderer UI

### 4. Annotation as the second product line
MarkDeck’s second goal was defined as:
> generating and sharing feedback conveniently based on markdown documents

That pushed the product beyond reading into review tooling:
- highlight
- comment
- deletion mark
- strike
- feedback side panel
- memo sidecar format draft

---

## Current state snapshot

### Stable enough today
- markdown reading workflow is largely complete
- desktop app is packaged and launchable
- single-instance desktop behavior exists
- CLI launch for directory / markdown file exists
- annotation draft workflow exists

### Still likely next steps
- real `.memo` file save/load
- annotation anchor drift recovery
- richer feedback export / sharing
- annotation metadata (author / time / thread)
- translation actions and review-assist features

---

## Notes
- The product was tagged `v1.0.0` after the team judged the “convenient markdown reading” goal was mostly achieved.
- Desktop architecture continues to move toward a clean main -> IPC -> renderer model.
- Annotation support is currently draft-oriented and preview-friendly, with persistence still evolving.
