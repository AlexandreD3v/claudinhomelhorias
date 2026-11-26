---
name: write-handoff
description: >
  Writes the end-of-session handoff in a project folder shared with other
  coding agents: adds the note at the top of HANDOFF.md and respects
  DECISIONS.md. Use when ending the session or before handing the project to another agent.
when_to_use: >
  The user says "write the handoff", "I'm switching agents" or "end the
  session and leave a note", in a project that has HANDOFF.md and DECISIONS.md.
disable-model-invocation: true
metadata:
  destination: project
  source: "005"
  url: "https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/"
  accessed: "2026-11-26"
  mirror-of: registrar-handoff
---

# Write the handoff

**Install destination:** `project` (`.claude/skills/write-handoff/`). US English mirror of `registrar-handoff`. `HANDOFF.md` and `DECISIONS.md` live in the project folder, shared with the other agents.

Flow from the source 005 article (XDA, November 1, 2026), which is the author's usage report, not a Claude Code feature. The file templates are in [`templates.md`](templates.md). Not tested in Claude Code.

Project prerequisites: `HANDOFF.md` and `DECISIONS.md` at the root; `AGENTS.md` with the rules block from `templates.md`; `CLAUDE.md` with `@AGENTS.md` (snippet `share-agents-md`).

## Steps

1. Read `HANDOFF.md` (the newest note is at the top) and `DECISIONS.md`.
2. List what this session finished and what is incomplete. Check with `git status` and `git log` that the list matches the repository.
3. Write the new note **at the top** of `HANDOFF.md`, in the `templates.md` format: date and time with time zone, agent (Claude Code), what was done, what was not, where the next agent should start and questions for the human.
4. If something was settled for good (for example "plain HTML in this project"), add it to `DECISIONS.md`. **Do not reverse** a decision already there. If you disagree, record the disagreement as a question for the human in the note.
5. Keep `HANDOFF.md` short. This repository's recommendation, not the article's: past about 10 notes, move the oldest to `HANDOFF-ARCHIVE.md`, because a file that grows without end becomes a context cost for whoever reads it first.
6. Show the user what you wrote and stop. Do not commit unless asked.

## Limits

- The article recommends one agent at a time in the folder. Two agents editing in parallel can touch the same files without reading each other's notes.
- Each agent follows the rules its own way: the author reports that Antigravity needed a more explicit prompt than Codex to write the note.
- "Only the human reverses a decision" (`DECISIONS.md`) is a rule written for the agents; the author says he did not test what happens without it.
