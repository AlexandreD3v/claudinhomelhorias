# Output styles

A style is a Markdown file in `.claude/output-styles/` (project) or `~/.claude/output-styles/` (user). It sets the role, tone and format of **every** response in the session.

**Activation:** `/output-style`, the config menu, or the `outputStyle` key in settings (value is **case-sensitive**; the official built-in names are `Proactive`, `Concise`, `Explanatory` and `Learning`).

**Frontmatter:** `name`, `description`, `keep-coding-instructions`, `force-for-plugin` (the last one only in plugins). With `keep-coding-instructions: true`, Claude Code keeps its software-engineering instructions and changes only the communication.

Docs: [Output styles](https://code.claude.com/docs/en/output-styles).

Style in this package: [`concise-en-us.md`](concise-en-us.md), the US English counterpart of the pt-BR `conciso-ptbr`. To make it a default, merge `"outputStyle": "concise-en-us"` into settings (already suggested in [`../settings/settings.example.json`](../settings/settings.example.json)).
