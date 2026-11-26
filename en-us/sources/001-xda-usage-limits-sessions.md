# Source 001 — I stopped hitting Claude's usage limits after changing one habit in how I start sessions

- **URL:** https://www.xda-developers.com/i-stopped-hitting-claudes-usage-limits-after-changing-one-habit-in-how-i-start-sessions/
- **Accessed:** 2026-11-25 22:03 (America/Sao_Paulo)
- **Author / site:** Abhinav Raj, XDA Developers. Published November 21, 2026, 10:30 (EST) — 12:30 (America/Sao_Paulo).
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/001-xda-limites-uso-sessoes.md`](../../fontes/001-xda-limites-uso-sessoes.md)

## Summary

Report by a Pro user who kept hitting the 5-hour and weekly limits (and once spent more than US$300 on extra credits in a bad month). The "habit" he adopts is not starting the session with `/clear`, despite the title: it is using Claude Code's `opusplan` alias, so Opus plans and Sonnet executes after the plan is approved. He describes his own test (two HTML Tetris games, medium effort, in the same 5-hour window) in which `opusplan` came out 16% cheaper in `/usage`'s API-price estimate (US$0.34 vs US$0.40), with a cache miss on the model switch (19.3k tokens reread). The two runs would have added two points to the session bar and nothing to the weekly one.

## What was read

- The article's main page (including the comments at the end; nothing actionable for Claude Code there).
- For the official check (not "extra pages" of the article): [model configuration](https://code.claude.com/docs/en/model-config) (`opusplan`), [prompt caching](https://code.claude.com/docs/en/prompt-caching) (model switch), [manage costs](https://code.claude.com/docs/en/costs) (`/usage`), [usage limits](https://support.claude.com/en/articles/11647753-how-do-usage-and-length-limits-work), [Claude Code on Pro/Max/Ultra](https://support.claude.com/en/articles/11145838-use-claude-code-with-your-pro-max-or-ultra-plan), [models, usage, and limits](https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code), [pricing](https://claude.com/pricing).

## Actionable insights

### Insight 1 — Use `opusplan` to plan with Opus and execute with Sonnet

- **Action:** In Claude Code, select the `opusplan` alias (`/model opusplan` or the `model` field in settings), enter plan mode, approve the plan and let Sonnet execute.
- **When it matters:** Work with a clear planning phase followed by implementation, when you want to stretch the plan's limit (Pro/Max) without giving up Opus for the reasoning.
- **Artifact type:** skill (procedure) + optional settings fragment
- **Install destination:** user (`usuario`)
- **Source section:** "Anthropic's advice is to plan with Opus, and execute with Sonnet" and "Opusplan wrote better code for 16% less"
- **Checked against official docs:** yes — https://code.claude.com/docs/en/model-config and https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code

### Insight 2 — Track usage with `/usage` (and Settings > Usage)

- **Action:** Use `/usage` in Claude Code and the Settings > Usage page on the website; the bars are percentages, not a message count. The dollar cost in the Session block is an estimate at API prices, not the subscriber's bill.
- **When it matters:** Whenever you are managing the 5-hour or weekly limit.
- **Artifact type:** folded into the skill (does not justify a separate artifact)
- **Install destination:** user (`usuario`)
- **Source section:** "Claude's limits are still the tightest I've run into"
- **Checked against official docs:** yes — https://code.claude.com/docs/en/costs and https://support.claude.com/en/articles/11647753-how-do-usage-and-length-limits-work

### Insight 3 — The 5-hour and weekly limits are shared with the Claude app

- **Action:** Treat chat on claude.ai / the app and Claude Code as the same balance.
- **When it matters:** When planning the day's usage.
- **Artifact type:** folded into the skill (short fact, does not deserve a separate snippet in the starter)
- **Install destination:** user (`usuario`)
- **Source section:** "Claude's limits are still the tightest I've run into"
- **Checked against official docs:** yes — help center and https://claude.com/pricing

### Insight 4 — Handing the plan to Sonnet causes a cache miss (one-time cost per switch)

- **Action:** Expect (and accept) a reread of the history on the model switch; do not read it as an `opusplan` failure. Avoid toggling plan mode without need.
- **When it matters:** When using `opusplan` or any `/model` in the middle of a session.
- **Artifact type:** folded into the skill
- **Install destination:** user (`usuario`)
- **Source section:** the "catch" of the Tetris test
- **Checked against official docs:** yes — https://code.claude.com/docs/en/prompt-caching

## Artifacts produced

- `en-us/claude/skills/use-opusplan/SKILL.md` (pt-BR: `claude/skills/usar-opusplan/SKILL.md`) — destination: `user` (`~/.claude/skills/use-opusplan/`) — how to turn on and use `opusplan`, with the official cache and limit caveats.
- `en-us/claude/settings/opusplan.example.json` (pt-BR: `claude/settings/opusplan.exemplo.json`) — destination: `user` (`~/.claude/settings.json`, merge the `model` key) — optional default; the skill warns not to save it blindly if Alexandre wants Opus all the time in some projects.

## Duplicates and reuse

There was no skill, snippet or setting about `opusplan`, `/usage` or shared limits in the `claude/` package.

## Divergences from the official docs

- **Article title versus body (and versus the official habits docs).** The title promises a habit about *how to start sessions*. The body teaches `opusplan`. The official docs ([models, usage, and limits](https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code) and [manage costs](https://code.claude.com/docs/en/costs)) recommend `/clear` when switching to an unrelated task as the most effective lever for cost and quality, and `/compact` to continue the same task. Both sides: the article does not describe `/clear`; Anthropic does. This source's artifact covers `opusplan` (what the text actually teaches) and only points to `/clear` as an official complement, without attributing that habit to the article.
- **16% savings and the Tetris test.** It is a single experiment by the author (two runs, medium effort, a single HTML file). The official docs confirm the "plan with Opus, execute with Sonnet" pattern and the cache miss on the switch, but do **not** guarantee 16% nor the US$0.34 / 0.40 values. The skill does not repeat those numbers as a rule.
- **Dollar cost in `/usage`.** The author uses Claude Code's API-price estimate. The official costs doc warns that, on Pro/Max/Ultra plans, the session's dollar value is **not** the subscription charge; what matters for the limit are the plan bars.
- **Saving `opusplan` as the default.** The [model configuration](https://code.claude.com/docs/en/model-config) doc says that picking `opusplan` (or Default) in `/model` **does not change** the saved model choice. For a permanent default, use the `model` field in settings (or `ANTHROPIC_DEFAULT_MODEL`). The article does not mention this detail.
- **Max price (US$100) and "5× Pro".** Checked at https://claude.com/pricing on the access date. Pro "at least 5× Free per 5-hour session" and Max "5× Pro every 5 hours and every week" also match the official text. The US$300 spent on credits is only a personal account.

## Conflicts between sources

- **XDA article:** the practical path is `opusplan`; the title suggests a session-start habit, but the body does not develop `/clear` / `/compact`.
- **Anthropic official docs:** confirm `opusplan` (`/model opusplan`) and, **in addition**, treat `/clear` between unrelated tasks and `/compact` in the middle of a long task as core usage habits. They also confirm the cache miss on every model switch, including each move in/out of plan mode with `opusplan`.
- Both sides stay visible above. Recommendation (aligned with the official docs, without hiding the article): use `opusplan` when there is a plan + execution phase; also use `/clear` when changing tasks, as the official docs ask — that did not come from the article's body.

## Open items

- **Test in Claude Code not done yet** (no Claude Code in this session). That is why the status stays `parcial` even after the GitHub push. To close as `publicado`: install the skill in `~/.claude/skills/`, run `/use-opusplan` (or `/usar-opusplan`) or follow the flow (`/model opusplan`, plan mode, `/usage`) and write down the result.
- GitHub push: up to whoever publishes the patch; the status does **not** change to `publicado` with the push alone, because the test is still missing.
