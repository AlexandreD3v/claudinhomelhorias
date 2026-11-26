# Commands (legacy format)

A command is a single Markdown file in `.claude/commands/foo.md`, invoked with `/foo`.

**For new work, create a skill** in `../skills/`. The official docs ([Skills](https://code.claude.com/docs/en/skills)) merged custom commands into skills: files in this folder still work, Claude can invoke them on its own, and a skill with the same name takes precedence.

**Install:** copy the `.md` into `.claude/commands/` or `~/.claude/commands/`.

**Frontmatter:** the same fields as a skill, **except** `name` and `paths`. The command name is the file name. To keep Claude from triggering it on its own, use `disable-model-invocation: true`.

## Minimal valid example

File `.claude/commands/repo-status.md`:

```markdown
---
description: Summarizes this repository's git state (branch, status and latest commits).
disable-model-invocation: true
argument-hint: ""
---

Run `git status -sb` and `git log -5 --oneline` and summarize in English: current branch, modified files and the last five commits. Do not commit.
```

There are no installable commands in this package yet (the `process-source` skill covers the main flow).
