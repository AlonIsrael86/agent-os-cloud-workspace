# Current Status

Last verified: 2026-05-31 01:54 IST.

## Chosen Architecture

Default: **hybrid**.

- Codex Cloud for async branch work.
- GitHub Codespaces for interactive terminal sessions while Alon's PC is off.
- VPS/cloud workstation later only if persistent always-on processes are required.

## Verified Locally

- `npm run verify` passes.
- Secret scan passes.
- Generated config render works and writes to `generated/`, which is gitignored.
- Static doctor passes with `0 fail, 0 warn`.
- Full runtime doctor exits successfully with `0 fail, 4 warn`; the warnings are expected until cloud runtime secrets and Codespaces scope are provisioned.
- Codex CLI exists locally: `codex-cli 0.135.0`.
- Claude Code CLI exists locally: `2.1.158`.
- GitHub repo exists and GitHub Actions doctor previously passed.
- `codex cloud list` works and currently returns no tasks.

## Blocked / Manual

- GitHub Codespaces API currently needs extra GitHub CLI scope:

```bash
gh auth refresh -h github.com -s codespace
```

- Codex CLI and Claude Code CLI must be authenticated inside the actual cloud runtime.
- Secrets must be provisioned in Codex Cloud, Codespaces, or VPS secret stores before external integrations can be live.
- OAuth connectors need manual runtime login when tokens are not provisioned.
- Local-only files, browser profiles, and cookies are intentionally unavailable.

## Safe Next Action

After GitHub CLI has the `codespace` scope, create a Codespace from this repo and run:

```bash
npm run verify
npm run doctor
```
