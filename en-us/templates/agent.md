---
name: agent-name
description: >
  What the subagent does and when Claude should delegate to it.
  Keep the description short: it enters the main session's context.
tools: Read, Grep, Glob
# disallowedTools: Write, Edit
model: inherit
# effort: medium
# permissionMode: default
# isolation: worktree
# omitClaudeMd: true
# memory: user
---

**Install destination:** project

<!-- Values: project = .claude/agents/  |  user = ~/.claude/agents/
     Do not use a `metadata` field in the frontmatter: it is not official for subagents.
     The English name must differ from the pt-BR agent's name.
     Source: NNN — URL — accessed YYYY-MM-DD (America/Sao_Paulo) -->

You are an expert in …. When invoked:

1. …
2. Return only a structured summary to the main conversation. Do not bring back whole logs or files.

The `tools` field above is a YAML list of tool names (commas in the same style as the official example are also accepted). `disallowedTools` uses camelCase, unlike skills.
