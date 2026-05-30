# Agent Instructions

This repo defines Alon's cloud Agent OS workspace for Codex and Claude Code.

## Core Rules

- Respond to Alon in English.
- Treat this environment as remote and potentially persistent.
- Do not commit secrets, tokens, cookies, keys, browser profiles, or local file copies.
- Use API/CLI/MCP first. Use browser automation only when the target task truly requires UI inspection.
- Never send outbound email, WhatsApp, SMS, Telegram, Slack, forms, or other external messages without Alon's immediate explicit send instruction.
- Never automate Meta/Facebook login, Ads Manager, Business Suite, Lead Center, billing, verification, account, or security pages in a debug/authenticated browser.
- Do not assume local Windows paths exist. Cloud paths must be discovered from the runtime.
- If a task needs local-only files from Alon's PC, report the blocker and ask Alon to upload or sync the exact files.

## Cloud Boundary

The cloud environment may connect to external services using approved secrets. It must not depend on:

- `C:\Users\Alon\...`
- local browser cookies
- local OneDrive files
- local `.claude` or `.codex` runtime state
- local SSH keys unless explicitly provisioned as cloud secrets

## Verification Standard

Before reporting a cloud workspace as ready:

1. Run `scripts/doctor.sh`.
2. Confirm Codex CLI works.
3. Confirm GitHub auth works.
4. Confirm generated MCP config exists.
5. Smoke-test at least one read-only external connection.
6. List any missing secrets or unsupported local-only workflows.

