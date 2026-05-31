# Current Status

Last verified: 2026-05-31 23:21 IST.

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

## VPS Runtime

A VPS fallback runtime has been initialized from this repo.

Verified on the VPS:

- Repo cloned to `/opt/agent-os-cloud-workspace`.
- `git`, `node`, `npm`, and `gh` are installed.
- `codex-cli 0.135.0` is installed.
- `Claude Code 2.1.159` is installed.
- `npm run verify` passes with `0 fail, 0 warn`.
- Generated configs exist under `/opt/agent-os-cloud-workspace/generated/`.
- `git status` is clean against `origin/main`.

Dynamic VPS doctor result:

```text
Doctor result: 0 fail, 6 warn
```

Expected VPS warnings until manual auth/secrets are provisioned:

- missing `N8N_ALON_API_KEY`
- missing `N8N_LM_PROD_API_KEY`
- missing `GITHUB_TOKEN`
- `gh auth` is not ready on the VPS
- Codespaces API unavailable without GitHub auth/scope
- `codex cloud list` fails until Codex is authenticated on the VPS

## Blocked / Manual

- GitHub Codespaces API currently needs extra GitHub CLI scope:

```bash
gh auth refresh -h github.com -s codespace
```

- Codex CLI and Claude Code CLI must be authenticated inside the actual cloud runtime.
- Secrets must be provisioned in Codex Cloud, Codespaces, or VPS secret stores before external integrations can be live.
- OAuth connectors need manual runtime login when tokens are not provisioned.
- Local-only files, browser profiles, and cookies are intentionally unavailable.
- The VPS runtime is installed but not yet authenticated to GitHub, Codex, Claude Code, or external integrations.

## Safe Next Action

After GitHub CLI has the `codespace` scope, create a Codespace from this repo and run:

```bash
npm run verify
npm run doctor
```

For the already-initialized VPS runtime, SSH into the server, then run:

```bash
cd /opt/agent-os-cloud-workspace
npm run verify
npm run doctor
```

Then complete manual auth:

```bash
gh auth login
codex login
claude
```
