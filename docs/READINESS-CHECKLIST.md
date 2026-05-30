# Readiness Checklist

## Static Repo Readiness

- [ ] `git status` clean
- [ ] `npm run doctor:static` passes
- [ ] `npm run secret-scan` passes
- [ ] `npm run render` produces generated configs without committing them
- [ ] GitHub Actions `Doctor` passes

## Runtime Readiness

- [ ] GitHub CLI authenticated
- [ ] Codex CLI installed and authenticated
- [ ] Claude Code CLI installed and authenticated, or explicitly unsupported in the runtime
- [ ] Required secrets provisioned
- [ ] `npm run doctor` passes or only reports expected missing optional secrets
- [ ] One read-only external connection smoke-tested

## Safety Readiness

- [ ] No local files copied
- [ ] No cookies/browser profiles copied
- [ ] No generated configs tracked by git
- [ ] No outbound send capability used without explicit Alon approval
- [ ] Meta/Facebook browser automation remains forbidden

