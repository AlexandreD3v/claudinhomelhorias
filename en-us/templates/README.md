# Templates

US English mirror of [`templates/`](../../templates/) (pt-BR, canonical). These templates produce the **en-US** version of each artifact and note; the pt-BR templates produce the pt-BR version. Copy the template for the type; never edit a template in place to record a real source.

## The `destination` field

Every installable artifact declares its install destination. For Claude Code (`claude/`), the values are (pt-BR keys in parentheses):

- `project` (`projeto`) — install in the project: `.claude/` (skills, agents, commands, rules, styles, hooks, `settings.json`) or, where applicable, `./CLAUDE.md` / `./.mcp.json` at the root.
- `user` (`usuario`) — install for every project: `~/.claude/` or, for personal MCP, `~/.claude.json`.

Where the field goes (without inventing a frontmatter key Claude Code does not recognize):

| Type | Where to declare |
| --- | --- |
| Skill and command | `metadata.destination` (inside `metadata`, an official field); en-US skills also carry `metadata.mirror-of` with the pt-BR name |
| Subagent | in the body, line `**Install destination:** project` or `user` — not in the frontmatter |
| Rule, output style, snippet / `CLAUDE.md` | HTML comment in the file |
| Hook script | comment in the script header |
| Example JSON (settings, hook block, MCP) | comment in the template's sibling markdown and in the folder README; the JSON itself keeps only valid keys, so it can be merged |

For the Claude app (`claude-app/`) the values stay `app-claude`, `projeto-claudeai` and `configuracoes`, always in an `**Install destination:** …` line right below the title (meaning in [`claude-app/README.md`](../claude-app/README.md)). There is no install by copying files: the app does not read the repository.

## Two languages

Every artifact ships in pt-BR (`claude/`, `claude-app/`) and en-US (`en-us/claude/`, `en-us/claude-app/`), same relative path, with a different English `name`. The source note also ships in both: `fontes/NNN-slug.md` from [`templates/fonte.md`](../../templates/fonte.md) and `en-us/sources/NNN-english-slug.md` from [`source.md`](source.md). Full rule in steps 8 to 10 of the [guide](../SITE-ANALYSIS-GUIDE.md).

## Templates

| Template (en-US) | pt-BR | Use |
| --- | --- | --- |
| [`source.md`](source.md) | `fonte.md` | Note in `en-us/sources/NNN-slug.md` |
| [`claude-md-snippet.md`](claude-md-snippet.md) | `trecho-claude-md.md` | Snippet for `en-us/claude/snippets/` or merging into the starter |
| [`skill/SKILL.md`](skill/SKILL.md) | `skill/SKILL.md` | New skill in `en-us/claude/skills/<name>/SKILL.md` |
| [`command.md`](command.md) | `comando.md` | Legacy command in `en-us/claude/commands/<name>.md` |
| [`agent.md`](agent.md) | `agente.md` | Subagent in `en-us/claude/agents/<name>.md` |
| [`rule.md`](rule.md) | `regra.md` | Rule with `paths` in `en-us/claude/rules/` |
| [`output-style.md`](output-style.md) | `output-style.md` | Output style in `en-us/claude/output-styles/` |
| [`hook-settings.md`](hook-settings.md) + [`hook-settings.json`](hook-settings.json) | same names | `hooks` block to merge into settings |
| [`mcp.md`](mcp.md) + [`mcp.json`](mcp.json) | same names | Skeleton of a project `.mcp.json` or a note for `~/.claude.json` |
| [`claude-app-artifact.md`](claude-app-artifact.md) | `artefato-claude-app.md` | Guide, project instruction, style, prompt or setting in `en-us/claude-app/<subfolder>/` |
