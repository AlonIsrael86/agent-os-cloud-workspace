# GitHub Codespaces Runtime

Use Codespaces as the default interactive cloud workspace.

## Setup

1. Open the GitHub repo.
2. Create a Codespace from `main`.
3. Let `postCreateCommand` run:

```bash
bash scripts/bootstrap.sh && bash scripts/doctor.sh
```

4. Add secrets through GitHub Codespaces secrets or repository/environment secrets.
5. Run:

```bash
npm run render
npm run doctor
```

## Manual Login Requirements

These cannot be completed by the repo alone:

- `gh auth login` or `GITHUB_TOKEN`
- Codex CLI auth
- Claude Code CLI auth
- OAuth-based MCP connectors such as Canva, Meta Ads, Mobbin, NotebookLM, Higgsfield when they require browser login

## Expected Use

- Open Codespaces from phone/tablet/laptop.
- Use the terminal to run `codex`, `claude`, `gh`, and project commands.
- Clone only the project repos needed for the task.
- Pull files from GitHub/Drive/API when needed; do not assume local OneDrive exists.

## Stop Conditions

Stop and ask Alon when:

- a task needs a local-only file
- a secret is missing
- OAuth requires manual login
- a task could send outbound messages
- a task needs Meta/Facebook browser automation

