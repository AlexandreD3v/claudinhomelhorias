# Source 009 — Checkpointing (`/rewind`)

- **URL:** https://code.claude.com/docs/en/checkpointing
- **Accessed:** 2026-11-27 11:24 (America/Sao_Paulo)
- **Author / site:** Official Claude Code docs (Anthropic). “Checkpointing” page, checked again on this date. Aliases and the menu entry are also in [commands](https://code.claude.com/docs/en/commands) (`/rewind`, `/checkpoint`, `/undo`). No individual author.
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/009-oficial-rewind-checkpoints.md`](../../fontes/009-oficial-rewind-checkpoints.md)

## Summary

Claude Code automatically records the file tree before each prompt that starts a turn, for edits made by its file tools. `/rewind` (aliases `/undo` and `/checkpoint`; or `Esc` twice with an empty prompt) opens a menu: restore code and conversation, conversation only, code only, or summarize from/up to that point. Up to 100 checkpoints per session; snapshots go in the sweep (about 30 days by default; `cleanupPeriodDays` extends that). After you resume a session, `/rewind` still works. It does not replace Git: a file changed **only** in Bash (and that Claude had not already edited with its tools), most subagent edits, external changes, symlinks/hard links and mid-turn messages are left out or only partly covered. Source 007 already teaches that `/rewind` (cutting the end) keeps the prompt cache and `/compact` does not; this source goes deeper on the menu and the limits.

## What was read

- The canonical [checkpointing](https://code.claude.com/docs/en/checkpointing) page, fetched on November 27, 2026.
- The `/rewind` entry in [commands](https://code.claude.com/docs/en/commands), already used in sources 007 and 008.

## Actionable insights

### Insight 1 — Use `/rewind` to undo or summarize at the right point

- **Action:** run `/rewind` (or `/undo`, or `Esc` twice with the input empty; in vim, `Esc` twice from NORMAL mode). Pick the prompt and the action: code and conversation, conversation only, code only, “Summarize from here” or “Summarize up to here”. The code-restore options appear only if that checkpoint has tracked edits. After restoring the conversation or summarizing “from here”, the original prompt returns in the input so you can re-send or edit it. If you **exit** before the next prompt, the rewound messages can come back: send a prompt still in this session so Claude Code saves the state, or run `/rewind` again. After a `/clear` in the same process, the menu gains `/resume (previous session)` until you exit or resume a different session. Summarizing does not change files on disk; to branch the session, the docs point to `/branch` or `claude --continue --fork-session`, not rewind.
- **When it matters:** trying a path, undoing a mistake, or trimming context mid-session without losing the start.
- **Artifact type:** skill
- **Install destination:** user
- **Source section:** “Rewind and summarize” and “Common use cases”
- **Checked against official docs:** yes — the checkpointing page itself and [commands](https://code.claude.com/docs/en/commands)

### Insight 2 — Know what rewind does not restore (use Git)

- **Action:** treat a checkpoint as quick session-level recovery, not permanent history. Use Git (or another VCS) for: a file that only Bash changed and Claude had not already edited with its tools; subagent edits other than a foreground skill with `context: fork`; manual or other-session changes; symlink or hard-link files (the restore warns `Restored the code, but skipped N files`). In the rewind menu, a message sent mid-turn can show as “No code restore”; to undo that turn's file edits, pick the prompt that **started** the turn. Snapshots disappear in the sweep (~30 days): a later rewind can fail with `No files were restored`.
- **When it matters:** a session that used Bash, a subagent, or symlink-managed files (dotfiles, pnpm).
- **Artifact type:** skill
- **Install destination:** user
- **Source section:** “Limitations”
- **Checked against official docs:** yes — the “Limitations” section of the same page

## Artifacts produced

- `en-us/claude/skills/use-rewind/SKILL.md` — destination: `user` (`~/.claude/skills/use-rewind/`) — menu, shortcuts, official limits and the cross-link with source 007 (cache). US English mirror of `usar-rewind`.

## Duplicates and reuse

Source 007 already uses `/rewind` as the cheap way to drop the last turns, as opposed to `/compact`, and points to the checkpointing page for the limits. This source does not replace 007: it goes deeper on the menu, shortcuts, the sweep, `/resume` after `/clear` and what does **not** come back. Source 008 reminds you that `/clear` is not how you undo turns; the menu detail now lives in this skill.

## Divergences from the official docs

None: the source is the docs themselves. The commands page only confirms the aliases (`/rewind`, `/checkpoint`, `/undo`).

## Conflicts between sources

- **Source 007.** Both agree: `/rewind` cuts the end and keeps the cache; `/compact` rewrites the conversation and always costs something. The “Summarize” options in the rewind menu, according to the checkpointing docs, compress context in the same session, “like a targeted `/compact`”. No contradiction: to undo, restore; to summarize, use the menu's summarize (or `/compact`, preferably with a warm cache, as in 007). Both sides stay in this note and in 007.
- No conflict with 008: after `/clear`, the menu can offer `/resume (previous session)` in the same process — that complements, rather than reverses, “clear the conversation”.

## Open items

- **Not yet tested in Claude Code.** Stays `parcial`. To close it out: install the skill; in a session, have Claude edit a file, run `/rewind` and check the options; then change the same file only in Bash (without Claude having edited it first) and confirm that rewind does not restore it (Git does). Not tested here.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
