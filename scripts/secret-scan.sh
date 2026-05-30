#!/usr/bin/env bash
set -euo pipefail

echo "== Secret scan =="

patterns=(
  'eyJ[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}'
  'gho_[A-Za-z0-9_]{20,}'
  'github_pat_[A-Za-z0-9_]{20,}'
  'ctx7sk-[A-Za-z0-9-]{20,}'
  'pmx_[A-Za-z0-9]{20,}'
  'AIza[0-9A-Za-z_-]{20,}'
  'sk-[A-Za-z0-9]{20,}'
  'BEGIN (RSA |OPENSSH |EC |DSA )?PRIVATE KEY'
)

fail=0

scan_files() {
  find . \
    -path ./.git -prune -o \
    -path ./generated -prune -o \
    -path ./node_modules -prune -o \
    -path ./.venv -prune -o \
    -type f \
    ! -path ./docs/SECRETS.md \
    -print
}

for pattern in "${patterns[@]}"; do
  if scan_files | xargs grep -n -E "$pattern" >/tmp/agent-os-secret-scan-match.txt 2>/dev/null; then
    cat /tmp/agent-os-secret-scan-match.txt
    fail=1
  fi
done

rm -f /tmp/agent-os-secret-scan-match.txt

tracked_forbidden=$(git ls-files | grep -E '(^|/)(generated|secrets|tokens|cookies|profiles|\.claude|\.codex)/|(\.env|\.log|\.key|\.pem|\.p12|\.sqlite|\.db|\.png|\.jpe?g|\.pdf|\.docx|\.xlsx|\.json\.secret)$' || true)
if [[ -n "$tracked_forbidden" ]]; then
  echo "Forbidden tracked local/runtime artifacts found:"
  echo "$tracked_forbidden"
  fail=1
fi

unignored_forbidden=$(find . \
  -path ./.git -prune -o \
  -path ./generated -prune -o \
  -path ./node_modules -prune -o \
  -path ./.venv -prune -o \
  \( -name "*.key" -o -name "*.pem" -o -name "*.p12" -o -name "*.sqlite" -o -name "*.db" -o -name "*.json.secret" \) \
  -print)
if [[ -n "$unignored_forbidden" ]]; then
  echo "Forbidden unignored local/runtime files found:"
  echo "$unignored_forbidden"
  fail=1
fi

if [[ "$fail" -ne 0 ]]; then
  echo "Secret scan failed."
  exit 1
fi

echo "Secret scan passed."
