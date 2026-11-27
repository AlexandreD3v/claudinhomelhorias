---
name: use-rewind
description: >
  Uses /rewind (aliases /undo and /checkpoint) to restore code and/or
  conversation to a checkpoint, or to summarize from a point. Includes what
  rewind does not restore (Bash-only changes, most subagent edits; use Git).
  Use when undoing an attempt, rewinding the conversation, or summarizing
  mid-session.
when_to_use: >
  The user wants to undo Claude's edits, go back to an earlier prompt,
  summarize part of the conversation from the rewind menu, or asks whether
  rewind undoes a Bash command or a subagent's work.
argument-hint: ""
metadata:
  destination: user
  source: "009"
  url: "https://code.claude.com/docs/en/checkpointing"
  accessed: "2026-11-27"
  mirror-of: usar-rewind
---

# Use `/rewind`

**Install destination:** `user` (`~/.claude/skills/use-rewind/`). US English mirror of `usar-rewind`.

Flow from the official source 009 docs ([checkpointing](https://code.claude.com/docs/en/checkpointing), [commands](https://code.claude.com/docs/en/commands)), checked on November 27, 2026. Not tested in this checkout.

Claude Code writes an automatic checkpoint, for file-tool edits, before each prompt that starts a turn (up to 100 per session; snapshots leave in the sweep, about 30 days by default, configurable with `cleanupPeriodDays`). After you resume a session, `/rewind` is still available.

## How to use it

1. Run `/rewind` or `/undo` (or `/checkpoint`). With an empty prompt, `Esc` twice opens the same menu (in vim: `Esc` twice from NORMAL mode). If the input has text, `Esc` twice only clears the text (recall it with `Up`).
2. Pick the prompt and the action: restore code and conversation, conversation only, code only, “Summarize from here” or “Summarize up to here”. Code restore appears only if that point has tracked edits.
3. After restoring the conversation or summarizing “from here”, the original prompt returns in the input. If you **exit** before sending the next prompt, the rewound messages can come back: send a prompt in this session so the state is saved, or run `/rewind` again. Restored files stay as rewind left them.
4. After a `/clear` in the same process, the top of the menu can show `/resume (previous session)` until you exit or resume a different session.
5. Summarizing in the menu does not change files on disk and works like a targeted `/compact`. To branch the session without losing the original, the docs point to `/branch` or `claude --continue --fork-session`.

## What rewind does not restore — use Git

- A file changed **only** in Bash, if Claude had not already edited it with its tools in this conversation. (If Claude had already edited the file, rewind also undoes what Bash did afterward.)
- Subagent edits, in most cases. Exception: a *foreground* skill with `context: fork` (`background: false`). A background fork and a background `/code-review --fix` do not come back through rewind.
- Manual edits of yours, or from another concurrent session, in files this session did not edit.
- Symlinks and hard links: the restore warns `Restored the code, but skipped N files`. To see the paths, `/debug` before you restore.
- A message sent mid-turn: can show as “No code restore”. To undo that turn's file edits, pick the prompt that **started** the turn.
- A checkpoint whose snapshot has already left the sweep: can fail with `No files were restored`.

Checkpoints are quick session-level recovery, not permanent history. For that, use Git.

## Relation to source 007 (cache)

`/rewind` that only cuts the end of the conversation **keeps** the prompt cache; `/compact` rewrites the conversation and always costs something (skill `protect-session-cache`). Use `/rewind` to undo; `/compact` or the menu's summarize when the goal is a summary (preferably with a still-warm cache, as in 007).

## What this skill does not cover

Setting model/effort at the start and compacting before a break: source 007. `/clear` between tasks: source 008.
