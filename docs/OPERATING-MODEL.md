# Operating Model

This repo supports three runtime roles. The default architecture is hybrid: Codex Cloud + Codespaces first, VPS later only when persistent infrastructure is justified.

## 1. Codex Cloud Branch Worker

Use for low-risk branch work:

- audits
- documentation updates
- skill and rule refactors
- test writing
- non-production cleanup

Safe flow:

```text
clean branch -> codex cloud exec --env <ENV_ID> --branch <BRANCH> "<task>" -> codex cloud diff -> review -> apply only after approval -> local or cloud tests -> commit
```

Do not use first for production/client-critical changes.

## 2. GitHub Codespaces Interactive Workspace

Use for browser-accessible terminal sessions while Alon's PC is off.

The Codespace should have:

- GitHub CLI authenticated
- Codex CLI installed and authenticated
- Claude Code CLI installed and authenticated when available
- generated MCP config from `templates/mcp.cloud.json.tpl`
- repo checkouts for projects that are safe to work on remotely
- secrets provisioned via GitHub secret stores

See `docs/RUNTIME-CODESPACES.md`.

## 3. VPS / Cloud Workstation

Use only when Codespaces is not enough.

Good reasons:

- persistent agents
- scheduled checks
- SSH-heavy work
- stable IP allowlists

See `docs/RUNTIME-VPS.md`.

## Local-Only Boundary

The cloud box does not automatically have:

- OneDrive files
- screenshots
- local client folders
- browser cookies
- Windows-only scripts
- SSH keys

For those, Alon must upload the file, sync a repo, or explicitly provision the credential.
