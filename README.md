# openclaw-obsidian

Obsidian vault + Quartz publishing setup for GitHub Pages.

## What was added

- Quartz 4 runtime and config files in the repository root
- `scripts/prepare-quartz-content.sh` to mirror vault notes/assets into Quartz `content/`
- GitHub Actions workflow at `.github/workflows/deploy.yml` for Pages build/deploy
- npm scripts for local build, preview, cleanup, and validation

The existing vault content stays in place. Quartz builds from a generated `content/` directory so repo/tooling files are not published.

## Local usage

### Install

```bash
npm ci
```

### Build the site once

```bash
npm run build
```

### Preview locally

```bash
npm run preview
```

Then open <http://localhost:8080>.

`preview` keeps the generated `content/` folder around while the dev server is running. If you want to clean generated files afterwards:

```bash
npm run clean
```

### Validate setup

```bash
npm run check
```

## Publish flow

Publishing is triggered by pushing to `main`.

Workflow:
- GitHub Actions workflow: `Deploy Quartz site to GitHub Pages`
- Build command used in CI: `npm run build`
- Output directory: `public/`

This repo already has a local `git-sync` script that commits/pulls/pushes regularly. Once GitHub Pages is enabled for **GitHub Actions**, any push to `main` should rebuild and deploy the site.

## Required GitHub setting

If GitHub Pages is not already configured, do this once in the repo UI:

1. Open **Settings → Pages**
2. Under **Build and deployment → Source**, choose **GitHub Actions**

After that, future pushes to `main` should deploy automatically.

Expected default Pages URL:
- <https://yoophi.github.io/openclaw-obsidian/>

Repository URLs:
- Repo: <https://github.com/yoophi/openclaw-obsidian>
- Actions: <https://github.com/yoophi/openclaw-obsidian/actions>
- Pages settings: <https://github.com/yoophi/openclaw-obsidian/settings/pages>

## Existing git-sync automation

This vault uses a local `git-sync` script to automatically commit/pull/push changes.

Script path:
- `/Users/yoophi/zk/openclaw-obsidian/git-sync`

Current behavior:
- `git add -A`
- commit only when there are staged changes
- `git pull --rebase --autostash`
- `git push`

## launchctl auto-run

This vault is configured to use a LaunchAgent so the sync script runs automatically every 10 minutes.

LaunchAgent file:
- `/Users/yoophi/Library/LaunchAgents/com.yoophi.openclaw-obsidian-git-sync.plist`

### Load / enable

```bash
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.yoophi.openclaw-obsidian-git-sync.plist
launchctl enable gui/$(id -u)/com.yoophi.openclaw-obsidian-git-sync
```

### Restart after editing the plist

```bash
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.yoophi.openclaw-obsidian-git-sync.plist
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.yoophi.openclaw-obsidian-git-sync.plist
launchctl enable gui/$(id -u)/com.yoophi.openclaw-obsidian-git-sync
```

### Run once immediately

```bash
launchctl kickstart -k gui/$(id -u)/com.yoophi.openclaw-obsidian-git-sync
```

### Check status

```bash
launchctl print gui/$(id -u)/com.yoophi.openclaw-obsidian-git-sync
```

### Disable / unload

```bash
launchctl disable gui/$(id -u)/com.yoophi.openclaw-obsidian-git-sync
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.yoophi.openclaw-obsidian-git-sync.plist
```

## Logs

- stdout: `/Users/yoophi/zk/openclaw-obsidian/.git-sync.launchd.out.log`
- stderr: `/Users/yoophi/zk/openclaw-obsidian/.git-sync.launchd.err.log`
