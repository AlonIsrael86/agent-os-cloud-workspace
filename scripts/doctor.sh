#!/usr/bin/env bash
set -euo pipefail

STATIC_ONLY=0
if [[ "${1:-}" == "--static" ]]; then
  STATIC_ONLY=1
fi

echo "== Agent OS cloud doctor =="

fail=0
warn=0

check_file() {
  local path="$1"
  if [[ -f "$path" ]]; then
    echo "PASS file $path"
  else
    echo "FAIL missing file $path"
    fail=$((fail + 1))
  fi
}

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "PASS command $cmd"
  else
    echo "WARN missing command $cmd"
    warn=$((warn + 1))
  fi
}

check_secret_name() {
  local name="$1"
  if [[ -n "${!name:-}" ]]; then
    echo "PASS env $name"
  else
    echo "WARN missing env $name"
    warn=$((warn + 1))
  fi
}

check_file README.md
check_file AGENTS.md
check_file GEMINI.md
check_file CLAUDE.md
check_file docs/ARCHITECTURE.md
check_file templates/mcp.cloud.json.tpl
check_file templates/codex.config.toml.tpl
check_file config/integrations.json
check_file docs/CONNECTIONS.md
check_file docs/SECRETS.md
check_file docs/READINESS-CHECKLIST.md
check_file docs/STATUS.md

check_cmd git
check_cmd node
check_cmd npm
check_cmd gh
check_cmd codex
check_cmd claude

node -e "JSON.parse(require('fs').readFileSync('config/integrations.json','utf8')); JSON.parse(require('fs').readFileSync('templates/mcp.cloud.json.tpl','utf8').replace(/\\$\\{[A-Z0-9_]+\\}/g,''));" || {
  echo "FAIL invalid JSON template/inventory"
  fail=$((fail + 1))
}

if [[ -d generated ]]; then
  if git ls-files --error-unmatch generated/mcp.json >/dev/null 2>&1 || git ls-files --error-unmatch generated/codex.config.toml >/dev/null 2>&1; then
    echo "FAIL generated runtime config is tracked"
    fail=$((fail + 1))
  fi
fi

if git status --short -- generated | grep -q .; then
  echo "FAIL generated runtime config has uncommitted git-visible changes"
  fail=$((fail + 1))
fi

if [[ "$STATIC_ONLY" == "0" ]]; then
  check_secret_name N8N_ALON_API_KEY
  check_secret_name N8N_LM_PROD_API_KEY
  check_secret_name GITHUB_TOKEN

  if gh auth status >/dev/null 2>&1; then
    echo "PASS gh auth"
  else
    echo "WARN gh auth is not ready"
    warn=$((warn + 1))
  fi

  if gh codespace list --limit 1 >/dev/null 2>&1; then
    echo "PASS gh codespace scope"
  else
    echo "WARN gh codespace API unavailable; run: gh auth refresh -h github.com -s codespace"
    warn=$((warn + 1))
  fi

  if codex cloud list >/dev/null 2>&1; then
    echo "PASS codex cloud list"
  else
    echo "WARN codex cloud list failed"
    warn=$((warn + 1))
  fi
fi

if find . -path ./.git -prune -o \( -name "*.key" -o -name "*.pem" -o -name "*.p12" \) -print | grep -q .; then
  echo "FAIL key material found in repo"
  fail=$((fail + 1))
fi

echo "Doctor result: $fail fail, $warn warn"
if [[ "$fail" -gt 0 ]]; then
  exit 1
fi
