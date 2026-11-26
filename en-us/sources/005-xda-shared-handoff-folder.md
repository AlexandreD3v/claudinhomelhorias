# Source 005 — I stopped choosing between Claude Code, Codex, and Antigravity, and one shared folder lets them pick up each other's work

- **URL:** https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/
- **Accessed:** 2026-11-26 08:38 (America/Sao_Paulo)
- **Author / site:** Nolen Jonker, XDA Developers. Published November 1, 2026, 14:01 (EST) — 16:01 (America/Sao_Paulo). Usage report, no Claude Code version cited.
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/005-xda-pasta-compartilhada-handoff.md`](../../fontes/005-xda-pasta-compartilhada-handoff.md)

## Summary

The author pays for Claude Code, Codex and Antigravity and started keeping the project's memory in the folder, not in any app's history. `AGENTS.md` is everyone's rulebook; `CLAUDE.md` just imports it with one line. Rules tell each agent to read `HANDOFF.md` (a log with the newest note at the top) before touching anything and to sign a note when leaving, saying what it finished, what it did not and where to continue. `DECISIONS.md` holds what is settled, and no agent may reverse it: if it disagrees, it says so in the handoff. Each agent gets a "lane" and only one works in the folder at a time. In Claude Code and Codex, the session closes through a handoff skill. The reported gain: when one agent runs out of quota, another continues from the last note. The author admits a cost (every session ends with a handoff, the agents follow the rules in different ways) and that he did not test what happens without the decisions rule.

## What was read

- The article's canonical page, with the comments (ignored as a source: they mention Gitea, Honcho, T3 Code and others, unverified).
- Official docs, on November 26, 2026: [memory / AGENTS.md and imports](https://code.claude.com/docs/en/memory#agents-md), [glossary](https://code.claude.com/docs/en/glossary), [commands](https://code.claude.com/docs/en/commands) (`/import`, `/init`, `/context`), [skills](https://code.claude.com/docs/en/skills) and the [changelog](https://code.claude.com/docs/en/changelog) (`AGENTS.md` support since 2.1.277, September 18, 2026).
- Left out because it serves neither Claude Code nor the Claude app: the behavior of Codex and Antigravity, Antigravity's 12,000-character rules limit and the per-agent lanes. The Claude app (chat/Desktop) does not come in: the text is about coding agents.

## Actionable insights

### Insight 1 — One shared `AGENTS.md`, imported by `CLAUDE.md`

- **Action:** keep the project rules in `AGENTS.md` and, in `CLAUDE.md`, put `@AGENTS.md` plus the Claude-Code-only instructions below it. The official docs confirm the pattern and add details the article lacks: from v2.1.277, Claude Code reads `AGENTS.md` on its own when there is no `CLAUDE.md` in the working directory or above; when there is one, it reads only `CLAUDE.md`; `CLAUDE.local.md` also counts as a `CLAUDE.md`; on Windows the import is preferable to a symlink.
- **When it matters:** projects that other agents also open.
- **Artifact type:** trecho-claude-md (CLAUDE.md snippet)
- **Install destination:** project (`projeto`)
- **Source section:** "How I set up one folder for all three"
- **Checked against official docs:** yes — memory ("AGENTS.md", "Share one file with other coding tools")

### Insight 2 — Handoff log and decisions record

- **Action:** `HANDOFF.md` with the newest note at the top, signed by each agent when leaving, and `DECISIONS.md` with what is settled (an agent does not reverse; it disagrees in the handoff). Close the session through a skill called by name. This is the author's practice, not a Claude Code feature; the official docs have no handoff equivalent.
- **When it matters:** switching agents because of usage limits or each one's strengths.
- **Artifact type:** skill (with a supporting templates file)
- **Install destination:** project (`projeto`)
- **Source section:** "The project remembers itself, regardless of which agent opens it"
- **Checked against official docs:** yes for the skill format (`disable-model-invocation`, supporting files); the flow itself is unofficial, with attribution

### Insight 3 — Bring the Codex setup into Claude Code

- **Action:** Claude Code has `/import codex|gemini|cursor`, which brings instructions, MCP, commands, subagents and skills as a one-time copy. It is an official alternative for people who just want to migrate, and it does not replace the shared folder.
- **When it matters:** one-time migration, without continuous handoff.
- **Artifact type:** none (record only; it is a native command)
- **Install destination:** —
- **Source section:** not in the article; comes from the official commands doc
- **Checked against official docs:** yes — commands

## Artifacts produced

- `en-us/claude/snippets/share-agents-md.md` (pt-BR: `claude/snippets/compartilhar-agents-md.md`) — destination: `project` (root `./CLAUDE.md`) — the `@AGENTS.md` with the caveat of when it is needed, the check in `/context all` and the Windows and `CLAUDE.local.md` caveats.
- `en-us/claude/skills/write-handoff/SKILL.md` (pt-BR: `claude/skills/registrar-handoff/SKILL.md`) — destination: `project` (`.claude/skills/write-handoff/`) — writes the note at the top of `HANDOFF.md`, respects `DECISIONS.md` and does not commit. Manual invocation only.
- `en-us/claude/skills/write-handoff/templates.md` (pt-BR: `claude/skills/registrar-handoff/modelos.md`) — destination: `project` — templates for `HANDOFF.md`, `DECISIONS.md` and the rules block for `AGENTS.md`.

## Duplicates and reuse

Nothing in `claude/` covered `AGENTS.md`, imports or handoff. The starter only mentions `CLAUDE.md` and `CLAUDE.local.md`. The starter's rule "an instruction Claude must follow goes in a hook, not in `CLAUDE.md`" applies here too: the handoff is a convention, not a guarantee. The `trim-context` skill (source 004) is complementary: it warns that a growing log becomes a context cost.

## Divergences from the official docs

- The article describes Claude Code as looking for its own `CLAUDE.md` and needing the import to reach `AGENTS.md`. The official docs, since v2.1.277 (September 18, 2026, before the article), read `AGENTS.md` directly when there is no `CLAUDE.md`. With a `CLAUDE.md` present, the import (or `/config` > Project instructions) is still needed. The article is right for people who already have a `CLAUDE.md` and omits the new case.
- "The `CLAUDE.md` never needs to be touched": officially, Claude-Code-only instructions go below the import, in `CLAUDE.md`.

## Conflicts between sources

- **How Claude Code finds `AGENTS.md`.** Article: only via `CLAUDE.md` with the import. Official: direct reading without `CLAUDE.md` (v2.1.277+), import (or the `claude-md-and-agents-md` setting) with `CLAUDE.md`. Recommendation (without hiding the article): without `CLAUDE.md`, nothing to do on a recent version; with `CLAUDE.md`, use the snippet.
- **Telling the agent "read `HANDOFF.md`" in text.** Article: the rule in `AGENTS.md` tells each agent to read the handoff before touching anything. Official: a text instruction only makes Claude see the file if it decides to open it; an `@HANDOFF.md` guarantees loading, but brings the whole file into every session, and an import does not reduce the context (source 004 and official docs). Both sides stay: instructed reading (cheap, no guarantee) and import (guaranteed, growing cost). The skill reads the file explicitly and suggests keeping the log short and archiving old notes (this repository's recommendation, neither official nor from the article).
- **Source 004 versus source 005.** 004 advises keeping the always-loaded context lean; 005 accumulates a log the agents need to read. There is no real contradiction, but the log is only cheap while it is short.

## Open items

- **Test in Claude Code not done yet** (no Claude Code in this session; the article's other agents were not tested either). It stays `parcial`, even after the GitHub push. To close: in a test folder, create `AGENTS.md` with the block from `templates.md` and a `CLAUDE.md` with `@AGENTS.md`; on Claude Code v2.1.277 or later, `/context all` should list `CLAUDE.md` under Memory files; install the skill in `.claude/skills/`, run `/write-handoff` (or `/registrar-handoff`), open a new session and ask "continue from the last handoff", checking that it read the top note.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
