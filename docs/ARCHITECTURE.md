# Architecture Decision

## Decision

Use a **hybrid cloud Agent OS**:

1. **Codex Cloud** for async branch work and reviewable diffs.
2. **GitHub Codespaces** as the default interactive cloud workspace for Codex/Claude Code style sessions when Alon's PC is off.
3. **VPS/cloud workstation** only as Phase 2 if Alon needs a persistent daemon, long-running automations, or non-GitHub workloads.

## Why This Is The Default

Alon needs two different cloud behaviors:

- A remote worker that can edit branches safely.
- A cloud shell he can open from anywhere and talk to agents while the local PC is off.

Codex Cloud is best for the first. Codespaces is the lowest-friction default for the second because it is repo-native, disposable, secret-store backed, and easier to rebuild than a hand-maintained server. VPS is more powerful but adds patching, secrets hygiene, backups, firewalling, and process supervision.

## Tradeoffs

| Runtime | Best for | Weakness | Default role |
|---|---|---|---|
| Codex Cloud | Async code tasks, branch diffs, audits, docs, tests | Not a full always-on chat workstation; cannot use local files/cookies | Primary branch worker |
| GitHub Codespaces | Browser-accessible cloud shell, repo work, Codex/Claude CLI sessions | Sleeps/stops; needs per-service secrets and CLI login | Primary interactive workspace |
| VPS/cloud workstation | Persistent agents, scheduled jobs, custom daemons, SSH-heavy work | Highest ops/security burden; must maintain secrets, updates, firewall | Phase 2 only |

## Security Boundary

The cloud workspace must never copy local runtime state:

- no local files
- no cookies/browser profiles
- no OAuth token files
- no private keys
- no committed generated configs

External integrations are restored by provisioning secrets in the target runtime and rendering configs from templates.

## Done Definition

The repo is production-grade when:

- a clean clone can run `npm run doctor:static`
- `npm run render` produces `generated/mcp.json` and `generated/codex.config.toml`
- secret scan passes
- GitHub Actions passes
- the integration inventory lists every local external connection and its cloud status
- blockers are explicit and actionable

