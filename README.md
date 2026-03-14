# openclaw-obsidian

## git-sync

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
