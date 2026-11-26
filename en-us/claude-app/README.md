# Claude app package (`en-us/claude-app/`)

US English mirror of [`claude-app/`](../../claude-app/): material for the **Claude app** (chat and Claude Desktop, on Mac and Windows, and claude.ai in the browser) — usage guides, project instructions, styles, prompts and settings. Its pair is [`../claude/`](../claude/), the **Claude Code** package.

From each site, what serves Claude Code goes to `claude/` and what serves the Claude app goes here. Only what serves neither is discarded (rule confirmed by Alexandre on November 26, 2026; details in [`CONTEXT.md`](../CONTEXT.md)).

## What goes here

| Subfolder | What it holds | Install destination |
| --- | --- | --- |
| [`guides/`](guides/) | Usage guide for an app feature: requirements, version, plans, steps, permissions, limits, good practices | `app-claude` |
| `projects/` | Project instructions: text to paste into a claude.ai Project's instructions | `projeto-claudeai` |
| `styles/` | Response style and preferences, to paste into preferences or an app style | `configuracoes` |
| `prompts/` | Reusable prompt to paste into a conversation | `app-claude` |
| `settings/` | App settings, such as turning on a feature, permissions and connectors (including what a Team/Enterprise owner controls) | `configuracoes` |

Only `guides/` exists today. The other subfolders appear with the first artifact of that type.

## Install destination

Every artifact here declares its destination in a line right below the title (`**Install destination:** …`). The values keep the repository's keys:

- `app-claude` — the Claude app for Mac or Windows (and claude.ai in the browser, when the feature exists there). The artifact is to read and follow in the app, or to paste into a conversation.
- `projeto-claudeai` — a claude.ai Project (project instructions and knowledge files). Applies only to that project's conversations.
- `configuracoes` — the app's or organization's Settings (profile preferences, styles, features and connectors). Applies to every conversation of the account, or of the organization when the artifact is for an owner.

Unlike `claude/`, there is **no install by copying files** here: Claude Code reads `.claude/`, but the Claude app does not read this folder. The artifact is text to read, follow or paste where the destination says.

## How to use

1. Open [`../USAGE.md`](../USAGE.md) or the index [`sources/INDEX.md`](../sources/INDEX.md) and look for sources with theme `claude-app` or `ambos`.
2. Open the artifact and read the destination at the top.
3. Follow the steps in the app, or paste the text where the destination says (project instructions, preferences, conversation).
4. Check the version and plan the artifact requires. App features are in beta and change fast; each artifact's check date is in its header.

## Guides today

- [`guides/install-artifact-as-app.md`](guides/install-artifact-as-app.md) — install an artifact as an app in Claude for Mac and Windows, with permissions, limits and quota (source 003, not tested). pt-BR: `claude-app/guias/instalar-artifact-como-app.md`.
- [`guides/skills-over-mcp.md`](guides/skills-over-mcp.md) — skills, Tasks and Elicitation shipped by the MCP connector, with plans, where the article and the official docs diverge, and File Uploads still rolling out (source 006, not tested). pt-BR: `claude-app/guias/skills-pelo-mcp.md`.
