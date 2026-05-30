# Connection Inventory

This file lists external systems the cloud workspace should be able to connect to after secrets are provisioned. The structured source of truth is `config/integrations.json`.

## Agent Runtimes

| System | Cloud path | Notes |
|---|---|---|
| Codex CLI | install/auth in cloud | Required for Codex Cloud and local remote Codex sessions |
| Claude Code CLI | install/auth in cloud | Required for Claude-style cloud sessions |
| GitHub CLI | OAuth or `GITHUB_TOKEN` | Required for repo work |

## MCP and APIs

| System | Runtime route | Secret source |
|---|---|---|
| n8n Alon | `n8n-mcp` stdio / HTTP MCP | `N8N_ALON_API_KEY`, optional bearer |
| n8n LastMinute prod | `n8n-mcp-lastminute-prod` | `N8N_LM_PROD_API_KEY`, optional bearer |
| n8n Yeda | `n8n-mcp-yeda` | `N8N_YEDA_API_KEY`, optional bearer |
| Google Workspace / GSC / GA / Ads / GTM | OAuth files or cloud OAuth flow | Google OAuth secrets and refresh tokens |
| Make EU1/EU2 | MCP server | `MAKE_EU1_API_KEY`, `MAKE_EU2_API_KEY` |
| Context7 | HTTP MCP | `CONTEXT7_API_KEY` |
| Canva | hosted OAuth MCP | OAuth in runtime |
| Meta Ads | official hosted MCP/API only | OAuth in runtime |
| Parse.bot | HTTP MCP | `PARSE_BOT_API_KEY` |
| 21st.dev Magic | npm MCP | `TWENTY_FIRST_API_KEY` |
| Higgsfield | hosted MCP | OAuth/API auth if required |
| NotebookLM | npm MCP | Browser/OAuth auth if required |
| LottieFiles Creator | cloud-compatible bridge required | Local Creator bridge is not portable as-is |
| Elementor MCP | cloud-compatible server wrappers required | Local PowerShell wrappers are not portable as-is |
| Microsoft Clarity | MCP server | `CLARITY_ORIN_API_TOKEN` |
| Mobbin | hosted MCP | OAuth plus paid-plan gate |
| Vercel | CLI/API | `VERCEL_TOKEN` |
| LinkAutomator | API | `LINKAUTOMATOR_API_KEY` |
| TargetBob | API | `TARGETBOB_API_KEYS_JSON` |
| Microsoft Clarity | MCP/API | `CLARITY_ORIN_API_TOKEN` |
| Figma | hosted plugin/MCP | OAuth in runtime |
| Linear | hosted plugin/MCP | OAuth in runtime |
| Documents / Spreadsheets / Presentations | Codex plugins | Cloud runtime plugin availability and auth |

## Not Portable Without Extra Work

- Chrome debug browser on local port `9222`
- local `C:\Users\Alon\...` helper scripts
- OneDrive desktop text drafts
- local MemPalace Python package and memory drawers unless synced to the cloud
- local browser profiles and cookies
- local Codex Browser/Computer Use native pipe paths
- local Codex `node_repl` binary paths
