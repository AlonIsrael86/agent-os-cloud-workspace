# VPS Runtime

Use a VPS only when Codespaces is not enough.

## Good Reasons

- persistent long-running agents
- scheduled remote checks
- SSH-heavy workflows
- custom background services
- stable IP allowlists

## Added Burden

A VPS needs:

- OS updates
- firewall rules
- SSH hardening
- secret storage
- backups
- process supervision
- log rotation
- cost monitoring

## Minimum Baseline

```bash
sudo apt-get update
sudo apt-get install -y git nodejs npm python3 python3-venv gh
git clone https://github.com/AlonIsrael86/agent-os-cloud-workspace.git
cd agent-os-cloud-workspace
bash scripts/bootstrap.sh
```

Provision secrets in a `.env` file owned by the deploy user or via a proper secret manager. Do not commit it.

## Current Provisioning Status

The fallback VPS runtime has been initialized once:

- Repo path: `/opt/agent-os-cloud-workspace`
- `codex-cli 0.135.0` installed globally
- `Claude Code 2.1.159` installed globally
- Static repo verification passes

Still manual:

- `gh auth login`
- `codex login`
- Claude Code login
- external integration secrets/OAuth

Runbook after SSH:

```bash
cd /opt/agent-os-cloud-workspace
git pull --ff-only
npm run verify
npm run doctor
```

## Recommended Later Upgrade

If this becomes permanent infrastructure, add:

- systemd unit for supervised agent helper processes
- Uptime Kuma monitor
- disk monitor
- automatic security updates
- encrypted backups
- fail2ban or equivalent SSH protection
