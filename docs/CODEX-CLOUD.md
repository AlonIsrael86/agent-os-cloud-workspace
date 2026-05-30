# Codex Cloud Usage

Current local CLI shape verified on Codex CLI `0.135.0`:

```bash
codex cloud exec --env <ENV_ID> --branch <BRANCH> "<task prompt>"
codex cloud list
codex cloud status <TASK_ID>
codex cloud diff <TASK_ID>
codex cloud apply <TASK_ID>
```

Always check help in the runtime before finalizing exact flags:

```bash
codex cloud --help
codex cloud exec --help
```

## First Pilot Criteria

- Repo is low-risk.
- Branch is clean.
- Task is reversible and reviewable as a diff.
- No production secrets are needed.
- No outbound messages, billing, CRM destructive actions, or permission changes.
- Apply is forbidden until the diff is reviewed.

## Good First Tasks

- Improve docs.
- Add tests.
- Run a static audit.
- Refactor a non-production helper.
- Update a skill/rule scaffold.

## Bad First Tasks

- Production deploys.
- Client-critical fixes.
- Meta/Facebook browser work.
- Authenticated browser-only tasks.
- Tasks requiring local files from Alon's PC.

