---
name: protect-session-cache
description: >
  Protects the prompt cache in a Claude Code session: sets model, effort and
  Fast mode at the start, uses /rewind (not /compact) to undo the last turns,
  and compacts before a break. Use when talking about cache, prefill,
  /rewind versus /compact, switching models mid-conversation, or opusplan
  mid-session.
when_to_use: >
  The user asks why quota jumped after a /model, wants to undo the last
  turns, is about to pause a long session, or is thinking of turning on
  opusplan in the middle of the work.
argument-hint: ""
metadata:
  destination: user
  source: "007"
  url: "https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions"
  accessed: "2026-11-27"
  mirror-of: cuidar-cache-da-sessao
---

# Protect the session cache

**Install destination:** `user` (`~/.claude/skills/protect-session-cache/`). US English mirror of `cuidar-cache-da-sessao`.

Habits from the official source 007 article (Anthropic, August 14, 2026), checked again on November 27, 2026. The cache is automatic; on a subscription you don't see a price, but the same requests draw down the quota. Not tested in this checkout. Related page: [prompt caching](https://code.claude.com/docs/en/prompt-caching).

## Rules

1. Choose `/model`, `/effort` and, if you will use it, Fast mode **at the start** of the session, or right after a `/clear`. Switching mid-session breaks the cache and the next turn rereads the whole conversation (full-price prefill). Turning Fast mode on mid-session still prefills at Fast mode prices; turning it off is free, cache-wise.
2. If the last turns are not worth keeping, use `/rewind` (or `/undo`) to just before them — only the end is dropped, everything before stays cached, at no extra cost. Don't use `/compact` just to undo: it rewrites the conversation and always costs something. The menu and the limits on what rewind restores are in [checkpointing](https://code.claude.com/docs/en/checkpointing) (Bash-only edits, and most subagent edits, may not come back; use Git).
3. If you actually want a summary, run `/compact` **before** a break, while the cache still holds: one hour on a subscription; five minutes on an API key (`ENABLE_PROMPT_CACHING_1H=1` raises that to one hour). Say what to keep, or paste the `compact-instructions.md` snippet into `CLAUDE.md`. On a 1M model, `/autocompact 200k` restores the older auto-compact safety net (v2.1.221+).
4. Resuming an old session is almost always a cache miss (the cache has usually expired and the system prompt is rebuilt at launch).

## Conflict with source 001 (`opusplan`)

Each move in or out of plan mode with `opusplan` is a model switch and breaks the cache — source 001 already records that. The cheap moment to run `/model opusplan` is the **start** of the session or right after `/clear`, not the middle of an already long conversation. The `use-opusplan` skill still stands; this one only adds when to turn it on.

## What this skill does not cover

`/clear` between tasks, `@` in a message and `/context` are also in the same article and now live in source 008 (skill `clean-session`). Don't confuse an `@` in a message with an `@` import in `CLAUDE.md` (source 004: an import does not save context).
