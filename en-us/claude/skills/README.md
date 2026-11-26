# Skills

Each skill is a folder `skill-name/SKILL.md`, plus supporting files if needed.

**Install:** copy the folder into `.claude/skills/` (project) or `~/.claude/skills/` (all your projects). Invocation: `/skill-name`, or Claude loads it on its own when the `description` matches — unless `disable-model-invocation: true`.

**Official format:** [Skills](https://code.claude.com/docs/en/skills). The YAML frontmatter must be the first line of the file. Most used fields: `name`, `description` (recommended), `when_to_use`, `argument-hint`, `arguments`, `disable-model-invocation`, `user-invocable`, `allowed-tools`, `paths`. The destination and source go in `metadata` (a free-form official field).

**About commands:** files in `.claude/commands/` still work, but the official docs recommend skills for new work. If a skill and a command share a name, the skill wins.

The English names below differ from the pt-BR ones (in parentheses), so both versions can be installed together. Skills in this package:

- [`process-source`](process-source/SKILL.md) (`processar-fonte`) — this repository's pipeline (destination: `user`).
- [`use-opusplan`](use-opusplan/SKILL.md) (`usar-opusplan`) — plan with Opus and execute with Sonnet to stretch the quota (destination: `user`; source 001).
- [`use-code-mode`](use-code-mode/SKILL.md) (`usar-code-mode`) — turn on the experimental Code Mode and chain tool calls in JavaScript (destination: `user`; source 002).
- [`trim-context`](trim-context/SKILL.md) (`enxugar-contexto`) — measure and trim the always-loaded context (CLAUDE.md, rules, imports), deciding what becomes a skill, rule, subfolder, hook or subagent (destination: `user`; source 004).
- [`write-handoff`](write-handoff/SKILL.md) (`registrar-handoff`) — handoff note in `HANDOFF.md` for projects shared with other agents, with templates in [`templates.md`](write-handoff/templates.md) (destination: `project`; source 005).
