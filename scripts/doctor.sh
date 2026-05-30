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
check_file templates/mcp.cloud.json.tpl
check_file templates/codex.config.toml.tpl
check_file docs/CONNECTIONS.md
check_file docs/SECRETS.md

check_cmd git
check_cmd node
check_cmd npm
check_cmd gh
check_cmd codex
check_cmd claude

if [[ "$STATIC_ONLY" == "0" ]]; then
  check_secret_name N8N_ALON_API_KEY
  check_secret_name N8N_LM_PROD_API_KEY
  check_secret_name GITHUB_TOKEN
fi

if compgen -G "*.key" >/dev/null || compgen -G "*.pem" >/dev/null; then
  echo "FAIL key material found in repo root"
  fail=$((fail + 1))
fi

echo "Doctor result: $fail fail, $warn warn"
if [[ "$fail" -gt 0 ]]; then
  exit 1
fi

