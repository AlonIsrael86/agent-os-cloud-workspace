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

echo "Bootstrap complete. Run: npm run render && npm run doctor"

