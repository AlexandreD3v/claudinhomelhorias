# Claudinho Melhorias (English overview)

Personal repository of **Alexandre Jackson Correa** that turns articles and guides about [Claude Code](https://code.claude.com/docs/en/overview) and the Claude app (chat and Claude Desktop, Mac and Windows), by Anthropic, into useful, installable instructions. Portuguese version: [`README.md`](README.md).

## Two languages

Every installable artifact exists in two versions, kept in sync:

| Version | Claude Code | Claude app | How to use |
| --- | --- | --- | --- |
| pt-BR | [`claude/`](claude/) | [`claude-app/`](claude-app/) | [`USO.md`](USO.md) |
| en-US | [`en-us/claude/`](en-us/claude/) | [`en-us/claude-app/`](en-us/claude-app/) | [`en-us/USAGE.md`](en-us/USAGE.md) |

The English skills, agents and output style have different names (for example `usar-opusplan` → `use-opusplan`), so both versions can be installed side by side in `~/.claude/` without colliding. The full name map and a method to compare the two versions (tokens in `/context`, adherence, quality) are in [`en-us/USAGE.md`](en-us/USAGE.md).

The analysis notes ([`fontes/`](fontes/)), the process files ([`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md), [`PROCESSO.md`](PROCESSO.md), [`CONTEXTO.md`](CONTEXTO.md)) and the [`templates/`](templates/) stay in pt-BR only.

## How it works

1. A link arrives; the content is read and its credibility checked.
2. Actionable insights for Claude Code or the Claude app are checked against the official docs and classified as an artifact type (CLAUDE.md snippet, skill, subagent, hook, setting, rule, output style, MCP; or an app guide, project instruction, style, prompt or setting).
3. The artifact is written in pt-BR and en-US, with the source cited and an install destination: `project` (`.claude/` of a project) or `user` (`~/.claude/`) for Claude Code; `app-claude`, `projeto-claudeai` or `configuracoes` for the Claude app.
4. A source becomes `publicado` (published) only after a real test in Claude Code or the Claude app **and** the push to GitHub; until then it is `parcial` (partial).

## Install

Claude Code does not read `claude/` or `en-us/claude/` on its own: copy each artifact to the destination it declares. Example for a user-level skill:

```bash
cp -R ~/claudinhomelhorias/en-us/claude/skills/use-opusplan ~/.claude/skills/
```

Merge settings and hooks into existing files instead of overwriting them, and copy only the `CLAUDE.md` pieces you lack. Claude app artifacts are not copied: read them and follow the steps in the app. Per-artifact commands are in [`en-us/USAGE.md`](en-us/USAGE.md).

## Sources so far

| # | Source | Theme | Artifacts (en-US) |
| --- | --- | --- | --- |
| 001 | XDA — usage limits and how sessions start | claude-code | skill `use-opusplan`, settings fragment |
| 002 | MarkTechPost — Code Mode | claude-code | skill `use-code-mode`, settings fragment |
| 003 | 9to5Mac — Install as app | claude-app | guide `install-artifact-as-app` |
| 004 | XDA — instructions out of the main session | claude-code | skill `trim-context`, starter `CLAUDE.md` |
| 005 | XDA — one shared folder for several agents | claude-code | snippet `share-agents-md`, skill `write-handoff` |

All of them are `parcial`: none has been tested in Claude Code or the Claude app yet. Details (pt-BR): [`fontes/INDICE.md`](fontes/INDICE.md).
