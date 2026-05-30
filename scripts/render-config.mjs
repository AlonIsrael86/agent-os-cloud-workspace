import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const root = process.cwd();
const outDir = path.join(root, "generated");

const required = [
  "N8N_ALON_API_URL",
  "N8N_LM_PROD_API_URL",
  "N8N_YEDA_API_URL"
];

function render(template) {
  return template.replace(/\$\{([A-Z0-9_]+)\}/g, (_match, name) => {
    return process.env[name] ?? "";
  });
}

await mkdir(outDir, { recursive: true });

for (const name of required) {
  if (!process.env[name]) {
    console.warn(`WARN missing ${name}`);
  }
}

const files = [
  ["templates/mcp.cloud.json.tpl", "generated/mcp.json"],
  ["templates/codex.config.toml.tpl", "generated/codex.config.toml"]
];

for (const [source, target] of files) {
  const template = await readFile(path.join(root, source), "utf8");
  await writeFile(path.join(root, target), render(template), "utf8");
  console.log(`Wrote ${target}`);
}

