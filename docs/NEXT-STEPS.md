# Next Steps

1. Create the GitHub repo.
2. Decide target runtime:
   - Codex Cloud only
   - GitHub Codespaces
   - VPS / cloud workstation
3. Provision secrets in the chosen runtime.
4. Run `npm run render`.
5. Run `npm run doctor`.
6. Smoke-test one read-only external connection.
7. Only then use the cloud workspace for real branch work.

## Recommended First Runtime

Start with the hybrid path:

1. Codex Cloud for branch-worker tasks.
2. GitHub Codespaces for live terminal/chat-style work while the PC is off.
3. VPS later only if persistent always-on agents are required.

## Blockers Before Full Parity

- Codex CLI auth in the cloud runtime.
- Claude Code CLI auth in the cloud runtime.
- Secrets provisioning.
- OAuth connectors that require browser login.
- Cloud-compatible replacements for local Windows wrapper scripts.
