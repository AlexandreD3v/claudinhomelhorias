---
name: clean-session
description: >
  Cleans and inspects a Claude Code session: /clear between unrelated
  tasks, /context at the start to see what is already loaded, and @file
  in the message to attach a known file. Use when switching tasks, opening
  a new session, or naming a file without attaching it.
when_to_use: >
  The user finishes one task and starts another, asks what is eating
  context, names a file without attaching it, or confuses /clear with
  /compact or /rewind.
argument-hint: ""
metadata:
  destination: user
  source: "008"
  url: "https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions"
  accessed: "2026-11-27"
  mirror-of: limpar-sessao
---

# Clean the session

**Install destination:** `user` (`~/.claude/skills/clean-session/`). US English mirror of `limpar-sessao`.

Habits from the official source 008 article (Anthropic, August 14, 2026; the same article as source 007, the `/clear`, `/context` and `@`-in-a-message slice), checked on November 27, 2026. Not tested in this checkout. Commands: [commands](https://code.claude.com/docs/en/commands).

## Rules

1. When you **switch to a task** that does not share useful context, run `/clear`. The conversation is cleared; `CLAUDE.md`, skills and the project remain. Don't use `/clear` to undo the last turns — that is `/rewind` (source 009, skill `use-rewind`; the cache side is source 007). Don't use `/compact` in place of `/clear` when the task has changed.
2. In a **new session**, run `/context` once (or `/context all` for the memory-file list) and see what is already in. If the weight is `CLAUDE.md`, imports or always-loaded rules, use `/trim-context` (source 004). If it is MCP tools, see source 006 and the tool-search docs.
3. When the request is about a file you already know, write `@path` **in the message** to attach it for that turn, instead of only naming it. That can save a Read or a search.
4. A noisy command: ask for quiet flags (`-q`, `--quiet`) or put the heavy output in a subagent — the output enters the conversation and stays until the session ends (source 004's principle; not a new artifact).
5. After a `/clear`, if you need a specific model or effort, set them then (source 007): that is the cheap moment for the cache.

## `@` in a message versus an `@` import (source 004)

An `@path` **in `CLAUDE.md`** (an import) loads the file in every session and does **not** save context — the `trim-context` skill already warns about that. An `@path` **in a message** applies to that turn only and keeps Claude from having to find the file. Don't swap one for the other.

## What this skill does not cover

The `/rewind` menu and checkpoint limits: source 009. Protecting the prompt cache (`/model` at the start, `/rewind` vs `/compact`, compacting before a break) is source 007. Triaging `CLAUDE.md` is source 004.
