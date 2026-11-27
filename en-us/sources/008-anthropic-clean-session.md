# Source 008 — Maximizing the value of your Claude Code sessions (session habits)

- **URL:** https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions
- **Accessed:** 2026-11-27 10:50 (America/Sao_Paulo)
- **Author / site:** Anthropic, official article on claude.com/resources. Published August 14, 2026 (`datePublished`). No individual author. Same article as source 007; this source covers only the TL;DR on `/clear`, `/context` and `@` in a message.
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/008-anthropic-limpar-sessao.md`](../../fontes/008-anthropic-limpar-sessao.md)

## Summary

The second slice of the official article on session value. Between unrelated tasks, `/clear` stops prior irrelevant history from being sent back (`CLAUDE.md` and the project stay). In a new session, `/context` once shows what is already loaded (`CLAUDE.md`, MCP tool definitions) so you can cut the excess. In a request, `@file` attaches the file to the message and can save a Read or a search — this is **not** the `@` import in `CLAUDE.md`, which source 004 already documented as saving no context. Noisy commands: quiet flags, or heavy output in a subagent (extends 004; no new artifact). After a `/clear`, the moment to (re)set model and effort is the one in source 007.

## What was read

- The article's canonical page (content already collected in the 10-tip research and in source 007; no new full fetch).
- The [commands](https://code.claude.com/docs/en/commands) reference (`/clear`, `/context`), already used in earlier sources, and what source 001 already cited from the costs docs: `/clear` when changing task, `/compact` to continue the same one.

## Actionable insights

### Insight 1 — `/clear` when you change tasks

- **Action:** finish the task and run `/clear` before the next one, if they do not share useful context. The conversation is cleared; `CLAUDE.md`, skills and the project remain. Don't use `/clear` just to undo the last turns — that is `/rewind` (source 007). Don't use `/compact` in place of `/clear` when the task has changed: compacting summarizes the irrelevant and still costs something.
- **When it matters:** several tasks in the same day, in the same checkout.
- **Artifact type:** skill
- **Install destination:** user
- **Source section:** TL;DR “Run `/clear` between tasks”
- **Checked against official docs:** yes — official article and [commands](https://code.claude.com/docs/en/commands); in line with what source 001 already pointed to in the costs docs

### Insight 2 — `/context` once in a new session

- **Action:** at the start, run `/context` (or `/context all` if you want the memory-file list) and see what is already in before any request. If what weighs is a bloated `CLAUDE.md`, imports or always-loaded rules, the triage is source 004's (`/trim-context`). If what weighs is MCP tools, the conversation is source 006 and the tool-search docs — this skill only says to look at the number and act.
- **When it matters:** a project with a large `CLAUDE.md`, several MCP servers, or quota rising “with no work”.
- **Artifact type:** skill
- **Install destination:** user
- **Source section:** TL;DR “Run `/context` once in a fresh session”
- **Checked against official docs:** yes — official article and [commands](https://code.claude.com/docs/en/commands)

### Insight 3 — `@file` in the message, not in `CLAUDE.md`

- **Action:** when the request is about a file you already know, use `@path` in the message to attach it for that turn, instead of only naming it and waiting for a Read or a search. This does not replace source 004's lean `CLAUDE.md`: an `@` *import* in `CLAUDE.md` loads the file in **every** session, with no context saving.
- **When it matters:** a one-off request (“fix this test”, “review this diff”).
- **Artifact type:** skill
- **Install destination:** user
- **Source section:** TL;DR “@-mention files instead of naming them”
- **Checked against official docs:** yes — official article; the distinction from the import is source 004's and the memory docs already cited there

## Artifacts produced

- `en-us/claude/skills/clean-session/SKILL.md` — destination: `user` (`~/.claude/skills/clean-session/`) — when to use `/clear`, `/context` and `@` in a message, with the distinctions from sources 004 and 007. US English mirror of `limpar-sessao`.

## Duplicates and reuse

Source 007 left these three habits out on purpose. Source 001 already pointed to `/clear` as an official habit the XDA article does not teach; this source turns it into a skill, in the official article's frame. Source 004 already teaches `/context` to *measure and triage* the always-loaded context, and warns that an `@` import does not save anything; this source adds `/context` as a start-of-session habit and `@` *in a message*. A subagent for noisy output only extends 004 — there is no new artifact just for that.

## Divergences from the official docs

None on the facts: the article is from Anthropic and lines up with the commands page and with the costs docs already cited in 001. This source does not invent a savings figure for `/clear` or for `@` in a message.

## Conflicts between sources

- **Source 004 versus the `@` in this source.** 004: an `@` import in `CLAUDE.md` does **not** reduce context (the imported file loads with it at the start). 008: `@file` *in a message* attaches the file to that turn and can avoid a Read or a search. They do not contradict each other — they are different mechanisms. Both sides stay in this note, in 004 and in `USAGE.md`.
- **Source 007.** After `/clear`, (re)set model and effort if you need to (007). To undo the last turns, `/rewind`, not `/clear`. To summarize the *same* task before a break, `/compact` (007), not `/clear`. No contradiction.

## Open items

- **Not yet tested in Claude Code.** Stays `parcial`. To close it out: install the skill; in a session with history from another task, `/clear` and confirm the history is gone and `CLAUDE.md` stayed; in a new session, `/context` once; in a request, `@` a known file and see whether Claude has to go find it. Not tested here.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
