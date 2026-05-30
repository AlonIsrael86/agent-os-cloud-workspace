#!/usr/bin/env bash
set -euo pipefail

echo "== Agent OS cloud bootstrap =="

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required."
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required."
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git is required."
  exit 1
fi

mkdir -p generated

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex CLI not found. Install/authenticate it in this runtime before real use."
fi

if ! command -v claude >/dev/null 2>&1; then
  echo "Claude Code CLI not found. Install/authenticate it in this runtime before Claude-style sessions."
fi

echo "Bootstrap complete. Run: npm run render && npm run doctor"
