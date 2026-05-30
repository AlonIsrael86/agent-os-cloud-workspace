# Secrets Plan

Do not commit secrets to this repo.

Use one of:

- GitHub Actions repository secrets
- GitHub Codespaces secrets
- Codex Cloud environment secrets
- VPS `.env` owned by the deploy user with restrictive permissions
- 1Password/Doppler/Vault later if this becomes production infrastructure

## Required for Useful First Pilot

- `GITHUB_TOKEN`
- Codex auth in the target environment
- One read-only external service secret, preferably n8n Alon or Context7

## Required for Full Cloud Parity

See `.env.example`.

High-risk secrets that need careful handling:

- n8n API keys and MCP bearer tokens
- Google OAuth refresh tokens
- Meta Ads OAuth
- Vercel token
- SSH keys
- WhatsApp sender credentials
- any client CRM credentials

## Provisioning Targets

| Runtime | Where secrets go | Notes |
|---|---|---|
| Codex Cloud | Codex Cloud environment secret UI/settings | Use per-environment least privilege |
| GitHub Codespaces | GitHub Codespaces user/repo secrets | Best first interactive runtime |
| GitHub Actions | Repository or environment secrets | Only for CI checks that need external services |
| VPS | `.env` or secret manager readable only by deploy user | Use file permissions and backups carefully |

## Manual Auth Checklist

Some connectors need browser/OAuth login in the target runtime:

- Codex CLI account
- Claude Code account
- Canva
- Meta Ads official MCP/API
- Mobbin
- NotebookLM
- Higgsfield
- Google OAuth refresh tokens if not provisioned as files

## Rotation Rule

If any real token is ever accidentally committed, rotate it immediately and remove it from git history before the repo is shared.
