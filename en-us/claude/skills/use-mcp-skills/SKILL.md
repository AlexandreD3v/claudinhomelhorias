---
name: use-mcp-skills
description: >
  Uses skills, Tasks and Elicitation shipped by an MCP server or connector
  in Claude Code, without copying the skill into ~/.claude/skills. Use when
  talking about Skills over MCP, a connector skill, /server:skill, an MCP
  task or an elicitation dialog.
when_to_use: >
  The user connected an MCP server or a connector that publishes skills,
  asks how to invoke a server skill, needs to follow an MCP task in /tasks,
  or a server asked for input mid-call.
argument-hint: ""
metadata:
  destination: user
  source: "006"
  url: "https://claude.com/resources/articles/skills-over-mcp-tasks-and-more"
  accessed: "2026-11-26"
  mirror-of: usar-skills-pelo-mcp
---

# Use skills over MCP

**Install destination:** `user` (`~/.claude/skills/use-mcp-skills/`). US English mirror of `usar-skills-pelo-mcp`.

Flow checked against the official source 006 article (Anthropic, November 24, 2026) and the docs current on November 26, 2026: [Skills from MCP servers](https://code.claude.com/docs/en/skills#skills-from-mcp-servers), [Use skills from MCP servers](https://code.claude.com/docs/en/mcp#use-skills-from-mcp-servers), [MCP tasks](https://code.claude.com/docs/en/mcp#mcp-tasks-that-run-on-the-server), [Elicitation](https://code.claude.com/docs/en/mcp#respond-to-mcp-elicitation-requests) and the [changelog](https://code.claude.com/docs/en/changelog). Where the article and the official docs diverge, **follow the official docs for your version**. Not tested in this checkout.

## Requirements

- Claude Code **v2.1.331+** according to the docs; the changelog announces Skills over MCP (beta) in **v2.1.332** (`server:skill` in the `/` menu). Check `claude --version`.
- An interactive terminal session (or a local Desktop session, Code tab). VS Code is rolling out.
- Plans with `/login`: on for Pro, Max and Ultra. Off for Team and Enterprise until an admin turns them on (Owner in Organization settings > Connectors; the organization's Skills setting must also be on). The article still says “coming soon to Enterprise”; the [official table](https://code.claude.com/docs/en/feature-availability) already lists Enterprise as *Admin-enabled*.
- Model: Fable, or Opus 4.8, Sonnet 5, Haiku 5.5 or later, with a direct connection to Anthropic and feature flags. Without that, or in the cloud, `claude -p`, the SDK, GitHub Actions, HIPAA/ZDR, a cloud provider or a custom `ANTHROPIC_BASE_URL`, MCP skills **do not apply**.

## Server skills

1. Do not copy the server's skill into `~/.claude/skills/` or `.claude/skills/`: it updates with the server.
2. Check `/mcp` (server connected; revision 2026-07-28 or later helps) and `/skills` or the `/` menu. The name is `server:skill`. Connector: `claude_ai_Name:skill`. Plugin: `plugin_plugin_server:skill` (spaces and punctuation in the server name, except `-`, become `_`).
3. Invoke with `/server:skill` and arguments, or ask Claude. Typing the command at the prompt does not need approval.
4. In auto mode, the classifier decides whether the skill loads, without reading it. In Manual or acceptEdits, you get a prompt; “Allow this version” holds until the server changes the files. A `deny`/`ask`/`allow` `Skill(mcp__server__*)` rule in `/permissions` (v2.1.331+).
5. Limit: up to 100 skills per server. Local-skill fields Claude Code **ignores** on an MCP skill: `allowed-tools`, `disallowed-tools`, `hooks`, `model`, `effort`, `context`, `agent`, `background`, `shell`, `paths`, `metadata`, `!` commands, `@` references and `${CLAUDE_PROJECT_DIR}` / `${CLAUDE_SESSION_ID}` substitutions.
6. Only add servers you trust: a skill can direct Claude to run code, and the server can change the skill at any time.

## Tasks

An MCP task (the server runs the work, v2.1.304+): the tool call returns at once, Claude keeps going, the footer shows `N MCP task`. Follow or stop it in `/tasks` (`x` key). The result goes to Claude, not into the transcript: ask for the result. A remote server's task survives exit; resume the **same** session. `Esc` does not cancel the task. Do not confuse this with automatic backgrounding of a slow tool call (two minutes, dies on exit).

The article lists Tasks as generally available for Pro, Max and Ultra, rolling out to Team and Enterprise. The MCP docs do not repeat that plan split: check yours.

## Elicitation

If the server asks for input mid-call, a dialog appears (form: fill it in; URL: open the link). Declining is an answer. With `/tasks` open the dialog stays hidden: close `/tasks` to answer. To answer later (v2.1.324+), `Esc` in the dialog and reopen it from the task's details in `/tasks`.

## File Uploads

Still rolling out (article) / beta with tight requirements in the [connector docs](https://claude.com/docs/connectors/building/files). Do not treat it as a general-purpose feature in this skill.

## What not to do

- Do not promise the article's “over 85%” context figure: the official Claude Code docs describe tool search with no percentage.
- Do not use this skill to implement the extension on a server; point to the official docs.
