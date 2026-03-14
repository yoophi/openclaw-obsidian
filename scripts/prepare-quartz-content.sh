#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONTENT_DIR="$ROOT_DIR/content"

mkdir -p "$CONTENT_DIR"
rsync -a --delete \
  --exclude '.git/' \
  --exclude '.github/' \
  --exclude 'node_modules/' \
  --exclude 'public/' \
  --exclude '.quartz-cache/' \
  --exclude 'content/' \
  --exclude '.gitignore' \
  --exclude '.git-sync.launchd.out.log' \
  --exclude '.git-sync.launchd.err.log' \
  --exclude 'package.json' \
  --exclude 'package-lock.json' \
  --exclude 'tsconfig.json' \
  --exclude 'globals.d.ts' \
  --exclude 'index.d.ts' \
  --exclude 'quartz.config.ts' \
  --exclude 'quartz.layout.ts' \
  --exclude 'quartz/' \
  --exclude 'scripts/' \
  --exclude 'README.md' \
  --exclude 'git-sync' \
  "$ROOT_DIR/" "$CONTENT_DIR/"

if [[ ! -f "$CONTENT_DIR/index.md" && -f "$CONTENT_DIR/Welcome.md" ]]; then
  cp "$CONTENT_DIR/Welcome.md" "$CONTENT_DIR/index.md"
fi

echo "Prepared Quartz content in $CONTENT_DIR"
