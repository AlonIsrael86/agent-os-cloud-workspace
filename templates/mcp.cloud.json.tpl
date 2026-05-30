{
  "mcpServers": {
    "n8n-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": ["--yes", "n8n-mcp@latest"],
      "env": {
        "MCP_MODE": "stdio",
        "LOG_LEVEL": "error",
        "DISABLE_CONSOLE_OUTPUT": "true",
        "N8N_API_URL": "${N8N_ALON_API_URL}",
        "N8N_API_KEY": "${N8N_ALON_API_KEY}"
      }
    },
    "n8n-mcp-lastminute-prod": {
      "type": "stdio",
      "command": "npx",
      "args": ["--yes", "n8n-mcp@latest"],
      "env": {
        "MCP_MODE": "stdio",
        "LOG_LEVEL": "error",
        "DISABLE_CONSOLE_OUTPUT": "true",
        "N8N_API_URL": "${N8N_LM_PROD_API_URL}",
        "N8N_API_KEY": "${N8N_LM_PROD_API_KEY}"
      }
    },
    "n8n-mcp-yeda": {
      "type": "stdio",
      "command": "npx",
      "args": ["--yes", "n8n-mcp@latest"],
      "env": {
        "MCP_MODE": "stdio",
        "LOG_LEVEL": "error",
        "DISABLE_CONSOLE_OUTPUT": "true",
        "N8N_API_URL": "${N8N_YEDA_API_URL}",
        "N8N_API_KEY": "${N8N_YEDA_API_KEY}"
      }
    },
    "context7": {
      "type": "http",
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "${CONTEXT7_API_KEY}"
      }
    },
    "canva": {
      "type": "http",
      "url": "https://mcp.canva.com/mcp"
    },
    "meta-ads": {
      "type": "http",
      "url": "https://mcp.facebook.com/ads"
    },
    "higgsfield": {
      "type": "http",
      "url": "https://mcp.higgsfield.ai/mcp"
    },
    "notebooklm": {
      "type": "stdio",
      "command": "npx",
      "args": ["notebooklm-mcp@latest"]
    },
    "21st-magic": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@21st-dev/magic@latest"],
      "env": {
        "TWENTY_FIRST_API_KEY": "${TWENTY_FIRST_API_KEY}"
      }
    },
    "make-mcp-eu1": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "make-mcp-server"],
      "env": {
        "MAKE_API_KEY": "${MAKE_EU1_API_KEY}",
        "MAKE_API_URL": "https://eu1.make.com/api/v2",
        "MAKE_TEAM_ID": "${MAKE_EU1_TEAM_ID}"
      }
    },
    "make-mcp-eu2": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "make-mcp-server"],
      "env": {
        "MAKE_API_KEY": "${MAKE_EU2_API_KEY}",
        "MAKE_API_URL": "https://eu2.make.com/api/v2",
        "MAKE_TEAM_ID": "${MAKE_EU2_TEAM_ID}"
      }
    },
    "parse-bot": {
      "type": "http",
      "url": "https://api.parse.bot/mcp",
      "headers": {
        "X-API-Key": "${PARSE_BOT_API_KEY}"
      }
    },
    "clarity-orin": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@microsoft/clarity-mcp-server",
        "--clarity_api_token=${CLARITY_ORIN_API_TOKEN}"
      ]
    }
  }
}

