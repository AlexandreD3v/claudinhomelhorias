# Rules (`.claude/rules/`)

Markdown files whose only frontmatter key read by Claude Code is `paths`. Without `paths`, the rule behaves like a general instruction; with `paths`, it only enters the context when the files being worked on match the globs.

**Install:** copy the `.md` into `.claude/rules/` (project) or `~/.claude/rules/` (user).

**Minimal valid example:**

```markdown
---
paths:
  - "**/*.ts"
  - "**/*.tsx"
---

- Use 2-space indentation in these files.
- Do not export dead symbols; delete the code instead of commenting it out in a block.
```

Docs: [How Claude remembers your project](https://code.claude.com/docs/en/memory) (`.claude/rules/` section).

There are no rules from external sources yet.
