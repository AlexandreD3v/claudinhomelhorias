---
name: trim-context
description: >
  Audits a project's always-loaded context (CLAUDE.md, rules, imports) and
  decides what moves to a skill, a rule with paths, a subfolder CLAUDE.md, a
  hook or a subagent. Use when the session burns too many tokens, CLAUDE.md is
  large or /context shows heavy memory.
when_to_use: >
  The user says Claude Code uses a lot of quota, asks to trim or reorganize
  CLAUDE.md, or wants to know what to move out of the main session.
disable-model-invocation: true
allowed-tools: Read Grep Glob
metadata:
  destination: user
  source: "004"
  url: "https://www.xda-developers.com/cut-claude-token-use-in-half-moving-instructions-out-of-main-session/"
  accessed: "2026-11-26"
  mirror-of: enxugar-contexto
---

# Trim the always-loaded context

**Install destination:** `user` (`~/.claude/skills/trim-context/`). US English mirror of `enxugar-contexto`. The skill audits the project the session is open in. It proposes the changes and only edits project files after your approval.

Procedure checked against the official docs on [memory](https://code.claude.com/docs/en/memory), [costs](https://code.claude.com/docs/en/costs) and [subagents](https://code.claude.com/docs/en/sub-agents) on November 26, 2026. Source 004 (XDA, October 29, 2026) is a usage report; where it diverges, the official docs win. There is no savings promise: neither Anthropic nor the article measures a number that holds for your project.

## 1. Measure before changing anything

- `/context` shows what fills the window, including memory files, with suggestions for heavy tools and memory.
- `/usage`, on Pro, Max, Ultra, Team or Enterprise plans, attributes recent usage to skills, subagents, plugins and MCP servers and shows "Recommendations", such as `Trim ~/code/api/CLAUDE.md · 49k tokens per request`. The numbers are approximate and come from this machine's local history.
- `/status` warns when an instructions file goes over 200 lines.
- `/doctor prompt-audit` (v2.1.283 or later) points out stale instructions, references to files that do not exist and files that contradict each other. It only proposes; nothing changes until you ask.

Write down the `/context` numbers (memory files) to compare at the end.

## 2. Triage each block of CLAUDE.md

| The block is… | It goes to… |
| --- | --- |
| Essential in every session: what the project does, test and build commands, important constraints | Stays in the root `CLAUDE.md` (official target: under 200 lines) |
| Only relevant to one part of the code (frontend, backend, a folder) | A `CLAUDE.md` inside that subfolder, which loads when Claude reads, writes or edits a file there; or a rule in `.claude/rules/` with `paths` |
| A multi-step procedure used now and then (review a PR, investigate a service, migrate a database) | A skill: its body only enters the context when used |
| Must never fail (never read `.env`, always format) | A hook or `permissions.deny`, not a line in `CLAUDE.md` |
| Discoverable by reading the repository (folder tree, dependency list, architecture overview) | Delete; this is what `/doctor` tends to cut |
| Stale or contradictory | Delete |

A limit that bites: a subfolder `CLAUDE.md`, or a rule loaded on demand, that goes over 40,000 characters (200K window) reaches Claude only from the start, with a notice to read the rest with the Read tool. Check with `wc -m path/CLAUDE.md`.

## 3. Trap: `@file` does not save anything

Splitting `CLAUDE.md` into several files and importing them with `@path` organizes, but **does not reduce the context**: the imported file loads together with the importer, at session start. To actually save, use the on-demand options in the table above. Mentioning a path in plain text (no `@`) only helps if Claude decides to open the file.

## 4. Send verbose operations to a subagent

Running tests, fetching docs and reading large logs fill the main conversation. Ask a subagent to do the work and return only the summary, for example:

```text
Use a subagent to run the test suite and report only the failing tests, with the error message.
```

Caveats, per the official docs:

- The subagent makes its own requests and they **count toward the same usage limit** of the plan. It reduces the main session's context, not necessarily the total tokens.
- A custom subagent loads the `CLAUDE.md` hierarchy, including yours. Only the built-in Explore and Plan start without it. In a subagent that does not need the project rules, use `omitClaudeMd: true` (this package's `source-extractor` already does).
- For a simple task, pick a smaller model in the subagent (`model: haiku`).
- A small, direct change stays in the main session. A subagent pays off for a large investigation with a clear goal and a short result.

## 5. Verify

1. Run `/context` again and compare the memory files with the number you wrote down.
2. For a subfolder `CLAUDE.md` or a rule with `paths`, ask Claude to read a file in that folder and check in `/context` that the file loaded, so the gain is measured and not assumed.
3. Run `/doctor prompt-audit` to see whether contradictory instructions remain.

Do not promise the gain to the user: report the difference `/context` showed.
