# Installable package (`en-us/claude/`)

US English mirror of [`claude/`](../../claude/), the Claude Code package. It follows the `.claude/` layout of Claude Code, plus a starter `CLAUDE.md` to copy selectively. Claude Code does **not** read this folder on its own: copy what you need (see [`../USAGE.md`](../USAGE.md)). Material for the Claude app (chat/Desktop) lives in the sibling folder [`../claude-app/`](../claude-app/).

Skills, agents and the output style here have **English names** that differ from the pt-BR ones, so both versions can be installed side by side in `~/.claude/` without colliding. The name map is in [`../USAGE.md`](../USAGE.md#name-map).

| Subfolder | Maps to | What is there today |
| --- | --- | --- |
| [`CLAUDE.md`](CLAUDE.md) | `./CLAUDE.md`, `./.claude/CLAUDE.md` or `~/.claude/CLAUDE.md` | Short starter based on the official practices |
| [`snippets/`](snippets/) | Pieces to merge into an existing `CLAUDE.md` | `share-agents-md` |
| [`skills/`](skills/) | `.claude/skills/` or `~/.claude/skills/` | `process-source`, `use-opusplan`, `use-code-mode`, `trim-context`, `write-handoff` |
| [`commands/`](commands/) | `.claude/commands/` (legacy format) | README with an example only; prefer skills |
| [`agents/`](agents/) | `.claude/agents/` or `~/.claude/agents/` | Subagent `source-extractor` |
| [`hooks/`](hooks/) | Scripts referenced by `hooks` in settings | Minimal example + JSON block |
| [`settings/`](settings/) | `.claude/settings.json` or `~/.claude/settings.json` | Examples to merge, not to copy over |
| [`rules/`](rules/) | `.claude/rules/` | README with the format |
| [`output-styles/`](output-styles/) | `.claude/output-styles/` | Style `concise-en-us` |

When installing settings or hooks, **merge** them into the existing file. Do not overwrite a project's `settings.json` blindly.
