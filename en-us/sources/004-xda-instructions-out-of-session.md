# Source 004 — I cut my Claude token use in half by moving instructions out of the main session

- **URL:** https://www.xda-developers.com/cut-claude-token-use-in-half-moving-instructions-out-of-main-session/
- **Accessed:** 2026-11-26 08:38 (America/Sao_Paulo)
- **Author / site:** Dhruv Bhutani, XDA Developers. Published October 29, 2026, 7:30 (EDT) — 08:30 (America/Sao_Paulo). Usage report, no Claude Code version cited.
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/004-xda-instrucoes-fora-da-sessao.md`](../../fontes/004-xda-instrucoes-fora-da-sessao.md)

## Summary

Report by someone who uses Claude Code to look after a self-hosted setup (Docker, logs, small apps). The thesis: token spend depends less on how complex the task is and more on what stays loaded in the session. He keeps the root `CLAUDE.md` as a short guide (what the project does, where the main files are, test commands, constraints), puts each component's instructions next to its files (one `CLAUDE.md` per folder, such as frontend and backend), turns repeated workflows into skills and sends long investigations (logs, Compose, permissions) to subagents that return a summary with evidence. The text itself warns that a subagent is not a universal fix and can raise the total tokens. The title's "half" is the author's impression, not a measurement. The readers' comments (Graphban, a "Billion-Context" MCP and others) are unverified third-party suggestions: they were not followed or installed.

## What was read

- The article's canonical page, with the comments (ignored as a source).
- Official docs, on November 26, 2026: [memory / CLAUDE.md](https://code.claude.com/docs/en/memory), [costs](https://code.claude.com/docs/en/costs), [subagents](https://code.claude.com/docs/en/sub-agents), [skills](https://code.claude.com/docs/en/skills) and [commands](https://code.claude.com/docs/en/commands).
- Nothing in the article applies to the Claude app (chat/Desktop): the text is only about Claude Code.

## Actionable insights

### Insight 1 — A lean root CLAUDE.md and a `CLAUDE.md` per folder

- **Action:** keep only the essentials at the root and put the instructions for one part of the project in a `CLAUDE.md` inside that folder. The official docs confirm it: subfolder files load when Claude reads, writes or edits a file there, and the target is under 200 lines per file.
- **When it matters:** projects with several parts (frontend/backend, several services).
- **Artifact type:** skill (triage) and an addition to the starter
- **Install destination:** user (`usuario`, the skill); the starter mixes project and user by section
- **Source section:** "Keep your CLAUDE.md file lean"
- **Checked against official docs:** yes — memory ("How CLAUDE.md files load", "Write effective instructions")

### Insight 2 — Repeated workflows become skills

- **Action:** move from `CLAUDE.md` into a skill the procedure that only matters sometimes. The costs doc says the same ("Move instructions from CLAUDE.md to skills").
- **When it matters:** workflow instructions (investigating a service, reviewing a PR) present in every session without need.
- **Artifact type:** none new; it was already in the starter. It becomes a step of the `trim-context` skill (`enxugar-contexto`).
- **Install destination:** user (`usuario`)
- **Source section:** "Separate instruction files and skills for project-specific tasks"
- **Checked against official docs:** yes — costs

### Insight 3 — A subagent for high-volume investigation

- **Action:** delegate logs, tests and research to a subagent that returns only the summary. Official: the context is isolated, but the subagent's requests count toward the same usage limit, and a custom subagent loads `CLAUDE.md` (only Explore and Plan start without it; `omitClaudeMd: true` fixes it in custom ones). The article covers the first point and the total-tokens caveat, not the second.
- **When it matters:** large investigations with a clear goal and a short result.
- **Artifact type:** none new; a step of the `trim-context` skill
- **Install destination:** user (`usuario`)
- **Source section:** "I use subagents to avoid bloating up my main session"
- **Checked against official docs:** yes — subagents ("Isolate high-volume operations", "What loads at startup") and costs

## Artifacts produced

- `en-us/claude/skills/trim-context/SKILL.md` (pt-BR: `claude/skills/enxugar-contexto/SKILL.md`) — destination: `user` — measures (`/context`, `/usage`, `/status`, `/doctor prompt-audit`), triages each block of `CLAUDE.md`, warns that an `@` import does not save anything and guides subagent use with the official caveats. Manual invocation only (`disable-model-invocation: true`).
- `en-us/claude/CLAUDE.md` (pt-BR: starter `claude/CLAUDE.md`, edited) — destination: per section, `project` or `user` — two additions: a subfolder `CLAUDE.md` loads on demand; an `@` import does not save context.

## Duplicates and reuse

The starter already said: short file (under 200 lines), procedures in skills, rules with `paths`, no-exception rules in a hook or `deny`. That was **not** duplicated. Only what was missing was added (subfolder `CLAUDE.md`, `@` import) and the skill was created as an invocable procedure. The `source-extractor` subagent (`extrator-fonte`) already uses `omitClaudeMd: true`; no new subagent was created, because the built-in Explore and the official prompt pattern already cover delegation. `use-opusplan` is about the model, not the context; `use-code-mode` does not overlap.

## Divergences from the official docs

- The article suggests splitting `CLAUDE.md` into instruction files and using `CLAUDE.md` to guide the model to each one. The official docs are specific: `@file` loads together with the importer, so it does **not reduce** the context. Only what loads on demand reduces it (skill, rule with `paths`, subfolder `CLAUDE.md`). The skill follows the official docs.
- The article does not mention that the subagent also receives `CLAUDE.md`.

## Conflicts between sources

- **Pointing `CLAUDE.md` to separate files.** Article: split the instructions into files and let `CLAUDE.md` guide to the right one. Official: an `@` import does not save anything; mentioning the path in plain text only helps if Claude decides to open the file. Recommendation (without hiding the article): use the on-demand mechanisms.
- **Source 008** (the same official article as 007, skill `clean-session`): an `@file` *in a message* attaches the file for that turn and can avoid a Read or a search. That does not contradict the import: they are different mechanisms. Both sides stay: an `@` in `CLAUDE.md` does not save context (this source); an `@` in a message is a session habit (008).
- **Half the tokens.** Article title: usage "cut in half", a personal number with no method. The body admits a subagent can raise the total. Official: no savings figure; the subagent's requests count toward the usage limit. The skill promises no savings.
- **What stays at the root.** Article: the root `CLAUDE.md` says where the main files are. Official: `/doctor` cuts from `CLAUDE.md` what Claude can discover in the code, such as the folder tree, the dependency list and the architecture overview. The skill says to keep only what is not derivable.

## Open items

- **Test in Claude Code not done yet** (no Claude Code in this session). It stays `parcial`, even after the GitHub push. To close: install the skill in `~/.claude/skills/`; in a project with a large `CLAUDE.md`, write down `/context`, run `/trim-context` (or `/enxugar-contexto`), apply the triage and run `/context` again; create a `CLAUDE.md` in a subfolder and check that it loads when Claude reads a file there.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
