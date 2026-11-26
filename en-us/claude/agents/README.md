# Subagents

Each subagent is a Markdown file with frontmatter in `.claude/agents/name.md` (project) or `~/.claude/agents/` (user). It runs in an isolated context and returns a summary. The `description` must make clear **when** to delegate — it enters the main session's context, so keep it short.

**Install:** copy the file into `.claude/agents/` or `~/.claude/agents/`. Restart the session if Claude does not see the new agent. List and reminder: `/agents`.

**Official format:** [Create custom subagents](https://code.claude.com/docs/en/sub-agents). Common fields: `name`, `description`, `tools`, `disallowedTools` (camelCase), `model`, `effort`, `permissionMode`, `isolation`, `omitClaudeMd`. Full list in [`references/official-practices.md`](../../references/official-practices.md). Template: [`templates/agent.md`](../../templates/agent.md).

Priority when the same `name` exists in several places: managed settings > `--agents` flag > project > user > plugin. The English name `source-extractor` differs from the pt-BR `extrator-fonte`, so both can coexist.

Subagent in this package: [`source-extractor.md`](source-extractor.md).
