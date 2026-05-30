# Operating Model

This repo supports two modes.

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

## 2. Always-On Cloud Dev Box

Use a VPS, Codespace, or cloud workstation when Alon's PC is off.

The environment should have:

- GitHub CLI authenticated
- Codex CLI authenticated
- Claude Code CLI authenticated, if available in the chosen runtime
- generated MCP config from `templates/mcp.cloud.json.tpl`
- repo checkouts for projects that are safe to work on remotely
- secrets provisioned via the platform secret store

## Local-Only Boundary

The cloud box does not automatically have:

- OneDrive files
- screenshots
- local client folders
- browser cookies
- Windows-only scripts
- SSH keys

For those, Alon must upload the file, sync a repo, or explicitly provision the credential.

