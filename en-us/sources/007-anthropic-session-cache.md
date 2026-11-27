# Source 007 — Maximizing the value of your Claude Code sessions

- **URL:** https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions
- **Accessed:** 2026-11-27 10:33 (America/Sao_Paulo)
- **Author / site:** Anthropic, official article on claude.com/resources. Published August 14, 2026 (`datePublished`). No individual author.
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/007-anthropic-cache-da-sessao.md`](../../fontes/007-anthropic-cache-da-sessao.md)

## Summary

Official article on getting more value from every token in a Claude Code session. Prompt cache is automatic: rereading the cached prefix costs 0.1× input; writing to the cache costs up to 2×, once. Anything that changes the start of the request (tools, system prompt, the conversation with `CLAUDE.md` at the front) triggers a full-price prefill of the whole prefix — on a subscription the same requests draw down the quota, even with no visible price. The article says to set model, effort and Fast mode **at the start** (or right after a `/clear`); if the last few turns went wrong, use `/rewind` (it only cuts the end; everything before stays cached, at no extra cost) and not `/compact` (it rewrites the conversation and always costs something). `/compact` is worth it **before a break**, while the cache is still warm (one hour on a subscription; five minutes on an API key, or one hour with `ENABLE_PROMPT_CACHING_1H=1`). Stable compact guidance can live in a "Compact instructions" section of `CLAUDE.md`. Resuming an old session is almost always a cache miss. The article also covers `/clear`, `@` on a file and `/context`; that stays for tip 2 of the research list and does not go into this source's artifacts.

## What was read

- The article's canonical page (content already collected in the 10-tip research; publication date checked on November 27, 2026).
- Official docs already used in source 001: [prompt caching](https://code.claude.com/docs/en/prompt-caching) and, for the `/rewind` menu, [checkpointing](https://code.claude.com/docs/en/checkpointing). No new broad docs sweep.

## Actionable insights

### Insight 1 — Set model, effort and Fast mode at the start of the session

- **Action:** choose `/model`, `/effort` and, if you will use it, Fast mode **before** the work (or right after `/clear`). Switching mid-session breaks the cache and the next turn rereads the whole conversation. Turning Fast mode on mid-session still prefills at Fast mode prices; turning it off is free, cache-wise. This does not mean never switch — it means don't switch in the middle of a long conversation.
- **When it matters:** a session that has already accumulated context and will continue.
- **Artifact type:** skill
- **Install destination:** user
- **Source section:** “Prompt caching” / TL;DR “Set your model and effort level before you start”
- **Checked against official docs:** yes — the article is official; the [prompt caching](https://code.claude.com/docs/en/prompt-caching) page was already the basis of source 001 on the cache miss at a model switch

### Insight 2 — `/rewind` to undo the last turns; `/compact` before a break

- **Action:** if the last turns are not worth keeping, `/rewind` to just before them. That only cuts the end, the prefix stays cached and you don't pay the prefill. `/compact` rewrites the conversation (the system prompt in front survives) and always costs something; writing the summary itself is cheaper while the old cache still holds — so compact **before** a long break, not after. Stable compact instructions can go in a "Compact instructions" section of `CLAUDE.md`; if you use a 1M model and want the older auto-compact safety net, `/autocompact 200k` (Claude Code v2.1.221+).
- **When it matters:** a conversation that went off track, or a pause longer than a few minutes (past one hour on a subscription, the cache expires).
- **Artifact type:** skill + optional claude-md snippet
- **Install destination:** `user` (skill); `user` or `project` (snippet)
- **Source section:** “Prompt caching” (`/rewind` vs `/compact` tip) and the note on `/compact` before a break
- **Checked against official docs:** yes — official article; the `/rewind` menu is in [checkpointing](https://code.claude.com/docs/en/checkpointing) (limits on what rewind restores come from that page, not this article)

## Artifacts produced

- `en-us/claude/skills/protect-session-cache/SKILL.md` — destination: `user` (`~/.claude/skills/protect-session-cache/`) — when to switch model/effort, `/rewind` vs `/compact`, compact before a break, and the `opusplan` caveat (source 001). US English mirror of `cuidar-cache-da-sessao`.
- `en-us/claude/snippets/compact-instructions.md` — destination: `user` or `project` (paste into `CLAUDE.md`) — short "Compact instructions" section, optional. US English mirror of `instrucoes-de-compact.md`.

## Duplicates and reuse

Source 001 already records the cache miss on a model switch (including each move in or out of plan mode with `opusplan`) and points to `/clear` and `/compact` as official habits the XDA article does not teach. This source does not replace 001: it goes deeper on the cache (the 0.1× price, what breaks the prefix, Fast mode, the one-hour window, cheap `/rewind` vs paid `/compact`, the `CLAUDE.md` section). There was no skill just for that. `/clear` between tasks, `@` in a message and `/context` from the same article stay out, reserved for tip 2 of the list.

## Divergences from the official docs

None on the facts: the article is from Anthropic itself and lines up with the prompt-caching page. Scope only: the article cites `/rewind` as a way to cut the end without breaking the cache; the checkpointing page is what lists what rewind **does not** restore (Bash-only changes, subagents). The skill points to both and does not promise to restore what a checkpoint does not capture.

## Conflicts between sources

- **Source 001 (`opusplan`) versus this source.** Both agree that every model switch, including entering or leaving plan mode with `opusplan`, causes a cache miss. This article makes the practical cost clearer: rereading the history in the middle of a long conversation is expensive; the cheap moment to turn on `opusplan` (or any `/model`) is the start of the session or right after a `/clear`. That does not invalidate 001 — the `use-opusplan` skill still stands — but 001 gets a cross-reference: don't turn the alias on in the middle of an already long session. Both sides stay visible in both notes and in `USAGE.md`.
- Source 001 still recommends `/compact` in the middle of a long task, in the sense of the costs docs. This source does not forbid `/compact`; it reserves it for when you actually want a summary (and, preferably, before a break, with a warm cache) and says to use `/rewind` when the goal is only to drop the last turns.

## Open items

- **Not yet tested in Claude Code.** Stays `parcial`. To close it out: install the skill in `~/.claude/skills/`; in a new session, set the model at the start, run two or three turns, `/rewind` one of them and check that the conversation moved back; in another session, watch in `/usage` (or whatever cache signal your version shows) the effect of a mid-session `/model` versus one at the start. Not tested here.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
