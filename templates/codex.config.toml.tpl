model = "gpt-5.5"
model_reasoning_effort = "high"
approval_policy = "never"
sandbox_mode = "danger-full-access"
personality = "pragmatic"

[features]
goals = true
memories = true

[projects."/workspace"]
trust_level = "trusted"

[mcp_servers.n8n-mcp]
command = "npx"
args = ["--yes", "n8n-mcp@latest"]

[mcp_servers.n8n-mcp.env]
DISABLE_CONSOLE_OUTPUT = "true"
LOG_LEVEL = "error"
MCP_MODE = "stdio"
N8N_API_URL = "${N8N_ALON_API_URL}"
N8N_API_KEY = "${N8N_ALON_API_KEY}"

[mcp_servers.context7]
url = "https://mcp.context7.com/mcp"

[mcp_servers.context7.headers]
CONTEXT7_API_KEY = "${CONTEXT7_API_KEY}"

[mcp_servers.canva]
url = "https://mcp.canva.com/mcp"

[mcp_servers.mobbin]
url = "https://api.mobbin.com/mcp"

[mcp_servers.meta-ads]
url = "https://mcp.facebook.com/ads"
