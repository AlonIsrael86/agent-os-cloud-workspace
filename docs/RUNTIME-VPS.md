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

## Recommended Later Upgrade

If this becomes permanent infrastructure, add:

- systemd unit for supervised agent helper processes
- Uptime Kuma monitor
- disk monitor
- automatic security updates
- encrypted backups
- fail2ban or equivalent SSH protection

