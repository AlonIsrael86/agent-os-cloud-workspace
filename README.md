# Agent OS Cloud Workspace

Portable cloud workspace for Alon's Codex and Claude Code workflows when the local PC is offline.

This repository is a **cloud environment definition**, not a backup of local files. It contains sanitized templates, bootstrap scripts, and operating rules. Secrets, OAuth tokens, browser cookies, and local workspace files must be provisioned separately through GitHub/Codex Cloud/VPS secret stores.

## Goal

Provide a repo that can serve both:

- Codex Cloud / remote Codex branch work
- Claude Code or Claude-compatible CLI sessions on a cloud dev box

The cloud workspace should connect to the same external systems Alon uses locally, except for local-only files and local authenticated browser state.

## What Belongs Here

- Canonical `CLAUDE.md` plus generated `AGENTS.md` and `GEMINI.md`
- Cloud bootstrap scripts
- Sanitized MCP and Codex config templates
- Connection and secret inventory
- Agent operating rules for cloud sessions
- Doctor and secret-scan scripts to check whether the cloud environment is ready

## What Does Not Belong Here

- API keys, JWTs, OAuth refresh tokens, cookies, SSH private keys, app passwords
- Local `C:\Users\Alon\...` file copies
- Browser profiles or authenticated browser state
- Client data exports, invoices, reports, screenshots, or raw logs
- `.claude` / `.codex` runtime state

## First Setup Flow

1. Clone this repo into the target cloud environment.
2. Install Node.js, Python, GitHub CLI, Codex CLI, and Claude Code CLI as appropriate.
3. Add required secrets to the target secret store.
4. Run `scripts/render-config.mjs` to generate runtime configs from templates.
5. Run `scripts/doctor.sh`.
6. Run one low-risk smoke test before using the environment for real work.

## Verification

Before pushing or using this repo in a cloud runtime, run:

```bash
npm run verify
```

For a runtime readiness check after secrets are provisioned, run:

```bash
npm run doctor
```

## Default Architecture

Default path: **hybrid**.

1. Codex Cloud for async branch tasks and reviewable diffs.
2. GitHub Codespaces for interactive cloud sessions when the local PC is off.
3. VPS/cloud workstation later only if persistent always-on processes are needed.

See `docs/ARCHITECTURE.md`.

## Current Status

Production scaffold plus a first VPS fallback runtime has been initialized from this repo. No secrets have been added, no Codex Cloud task has been submitted from this repo, and the VPS still needs manual GitHub/Codex/Claude authentication before it can act as a real remote agent terminal.

See:

- `docs/OPERATING-MODEL.md`
- `docs/CONNECTIONS.md`
- `docs/SECRETS.md`
- `docs/CODEX-CLOUD.md`
- `docs/RUNTIME-CODESPACES.md`
- `docs/RUNTIME-VPS.md`
- `docs/READINESS-CHECKLIST.md`
- `docs/STATUS.md`
