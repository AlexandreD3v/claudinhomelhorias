---
name: use-opusplan
description: >
  Turns on and uses Claude Code's opusplan alias: Opus plans in plan mode
  and Sonnet executes after approval, to stretch the plan's usage limit.
  Use when talking about usage limits, cost, /usage, plan mode, or when
  the work has a clear planning phase followed by implementation.
when_to_use: >
  The user wants to spend less of the quota, mentions 5-hour or weekly
  limits, asks for opusplan, or is about to start a task that needs a
  plan before the code.
argument-hint: ""
allowed-tools: Read Grep Glob
metadata:
  destination: user
  source: "001"
  url: "https://www.xda-developers.com/i-stopped-hitting-claudes-usage-limits-after-changing-one-habit-in-how-i-start-sessions/"
  accessed: "2026-11-25"
  mirror-of: usar-opusplan
---

# Use opusplan to stretch the quota

**Install destination:** `user` (`~/.claude/skills/use-opusplan/`). US English mirror of `usar-opusplan`.

Procedure checked against the official docs ([model configuration](https://code.claude.com/docs/en/model-config), [prompt caching](https://code.claude.com/docs/en/prompt-caching), [manage costs](https://code.claude.com/docs/en/costs), [models, usage and limits](https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code)). Source 001 (XDA, November 21, 2026) reports the same pattern; do not treat the author's test numbers (16%, US$0.34) as a guarantee.

## When to use

- The task has a planning phase (architecture, approach, files to touch) and then implementation.
- You are on a subscription with limits (Pro, Max, etc.) and want to save Opus for the reasoning, not for every line of code.

Do not make `opusplan` the blind default for every project: if the whole task needs Opus (hard refactor, cross-cutting debugging), stay on `opus`. Sonnet alone is still fine for day-to-day work, per the official docs.

## How to turn it on

For **this session:**

```text
/model opusplan
```

In the `/model` picker, choosing `opusplan` **does not save** a new default (the official docs say the saved choice does not change with Default or with `opusplan`). For a permanent default, merge into `~/.claude/settings.json` (see `en-us/claude/settings/opusplan.example.json` in this repository):

```json
{
  "model": "opusplan"
}
```

`claude --model opusplan` also works for that one invocation.

## How to work

1. Enter plan mode (`/plan` or Shift+Tab, depending on your surface).
2. Ask for the plan and review it. Opus is the model for this phase.
3. Approve the plan and leave plan mode. Claude Code switches to Sonnet automatically for execution. The conversation is **not** wiped: Sonnet still sees the plan.
4. Track usage with `/usage` (percentage bars for the plan, not a message count). On a subscription, the session's dollar value is an estimate at API prices, not the plan's charge. On the website, use Settings > Usage.

## Official caveats (do not skip)

- **Cache miss on the switch.** Every move in or out of plan mode with `opusplan` is a model switch and starts a new cache. The next request rereads the history. This is expected; avoid toggling plan mode without need. Source 007 (`protect-session-cache`) goes further: turn on `opusplan` at the start of the session or right after `/clear`, not in the middle of an already long conversation.
- **Shared limits.** The 5-hour limit (starts at the first message and resets 5 hours later) and the weekly limit apply together to Claude (web, desktop, mobile) and Claude Code. Verified Ultra has no 5-hour limit, per the help center at the date of this source.
- **Another official habit this article does not teach:** when *switching to an unrelated task*, Anthropic recommends `/clear` (the conversation resets; `CLAUDE.md` and the project stay). In the middle of the same task, use `/compact`. Do not attribute this to the XDA article; it is in the official usage and cost docs.

## What not to do

- Do not present the 16% savings from the XDA test as the expected result.
- Do not copy `model: opusplan` into a project's `.claude/settings.json` if the convention there is another model; this default is personal (`user`).
