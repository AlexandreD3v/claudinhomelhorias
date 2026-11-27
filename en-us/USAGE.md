# How to use the artifacts (en-US)

A short guide for people who just want to install and use, without reading the analysis notes. One section per source: what it does, where to install it (with the copy command), how to invoke it and how to test it. The Portuguese version, with the same artifacts, is [`USO.md`](../USO.md). The analysis notes behind each section are in [`sources/`](sources/).

Nothing here has been tested in Claude Code or in the Claude app yet: every source is `parcial` (partial) in the [index](sources/INDEX.md). If a step does not work as described, note the version (`claude --version`) and report it.

The commands assume the repository is cloned at `~/claudinhomelhorias`:

```bash
REPO=~/claudinhomelhorias
```

Destination `user` = `~/.claude/` (all your projects). Destination `project` = `.claude/` at the project root (goes into git). On Windows, `~/.claude` is `%USERPROFILE%\.claude`. The pt-BR files use the keys `usuario` and `projeto` for the same thing.

## Name map

The English names differ on purpose: both versions can be installed together in `~/.claude/` without colliding. To compare them, though, see [How to compare pt-BR and en-US](#how-to-compare-pt-br-and-en-us).

| Source | Type | en-US (`en-us/claude/`, `en-us/claude-app/`) | pt-BR (`claude/`, `claude-app/`) |
| --- | --- | --- | --- |
| 001 | skill | `use-opusplan` | `usar-opusplan` |
| 001 | settings | `settings/opusplan.example.json` | `settings/opusplan.exemplo.json` |
| 002 | skill | `use-code-mode` | `usar-code-mode` |
| 002 | settings | `settings/code-mode.example.json` | `settings/code-mode.exemplo.json` |
| 003 | app guide | `guides/install-artifact-as-app.md` | `guias/instalar-artifact-como-app.md` |
| 004 | skill | `trim-context` | `enxugar-contexto` |
| 004 | starter | `CLAUDE.md` | `CLAUDE.md` (additions) |
| 005 | snippet | `snippets/share-agents-md.md` | `snippets/compartilhar-agents-md.md` |
| 005 | skill | `write-handoff` (+ `templates.md`) | `registrar-handoff` (+ `modelos.md`) |
| 006 | skill | `use-mcp-skills` | `usar-skills-pelo-mcp` |
| 006 | app guide | `guides/skills-over-mcp.md` | `guias/skills-pelo-mcp.md` |
| 007 | skill | `protect-session-cache` | `cuidar-cache-da-sessao` |
| 007 | snippet | `snippets/compact-instructions.md` | `snippets/instrucoes-de-compact.md` |
| 008 | skill | `clean-session` | `limpar-sessao` |
| repo | skill | `process-source` | `processar-fonte` |
| repo | subagent | `source-extractor` | `extrator-fonte` |
| repo | output style | `concise-en-us` | `conciso-ptbr` |
| repo | settings | `settings/settings.example.json` | `settings/settings.exemplo.json` |
| repo | hook | `hooks/example.sh`, `hooks/example-block.json` | `hooks/exemplo.sh`, `hooks/bloco-exemplo.json` |

## Source 001 — opusplan to stretch the quota

- **What it does:** the `use-opusplan` skill teaches the `opusplan` alias: Opus plans in plan mode and Sonnet executes after approval, with the official caveats (cache, shared limits).
- **Cross-reference with source 007:** each move in or out of plan mode with `opusplan` switches model and breaks the prompt cache. Turn on `/model opusplan` at the start of the session (or right after `/clear`), not in the middle of an already long conversation; details in the `protect-session-cache` skill.
- **Install (user):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/en-us/claude/skills/use-opusplan" ~/.claude/skills/
  ```
  Optional, to make `opusplan` the default: merge `en-us/claude/settings/opusplan.example.json` into `~/.claude/settings.json` (do not replace the file).
- **Invoke:** `/use-opusplan`, or Claude loads it on its own when you talk about quota, limits or plan mode. To use the mode itself: `/model opusplan`.
- **Test:** in a new session, type `/` and check that `use-opusplan` shows up. Run `/model opusplan`, enter plan mode, ask for a plan, approve it and check in `/status` that execution moved to Sonnet.

## Source 002 — experimental Code Mode

- **What it does:** the `use-code-mode` skill explains how to turn on Code Mode (Claude writes JavaScript that chains several tool calls), the version requirements, the limits and how to turn it off.
- **Install (user):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/en-us/claude/skills/use-code-mode" ~/.claude/skills/
  ```
  Optional: merge `en-us/claude/settings/code-mode.example.json` into `~/.claude/settings.json`. Never into a project's settings, which ignore the variable.
- **Invoke:** `/use-code-mode`, or automatically when talking about Code Mode. To turn it on for one session: `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1 claude` (v2.1.323+, native build, terminal).
- **Test:** the session should show `Code Mode (experimental) is on`. Ask for a change repeated across several files and use `Ctrl+O` to see the JavaScript.

## Source 003 — install an artifact as an app (Claude app)

- **What it does:** the guide `en-us/claude-app/guides/install-artifact-as-app.md` explains "Install as app" in Claude for Mac and Windows: requirements, steps, permissions, beta limits and quota.
- **Install (app-claude):** nothing to copy. Open the guide and follow it in Claude Desktop 6.28899.0 or later.
- **Invoke:** in the app, open the artifact and choose Install as app (title menu or Share).
- **Test:** the "How to test this guide" section at the end of the guide.

## Source 004 — trim the always-loaded context

- **What it does:** the `trim-context` skill measures the context (`/context`, `/usage`, `/doctor prompt-audit`) and decides what leaves `CLAUDE.md` for a skill, a rule with `paths`, a subfolder `CLAUDE.md`, a hook or a subagent. The starter `en-us/claude/CLAUDE.md` carries two reminders about it.
- **Cross-reference with source 008:** an `@` *import* in `CLAUDE.md` does not save context (this source). `@file` *in a message* (skill `clean-session`) attaches the file for that turn only and can avoid a Read — they are different mechanisms.
- **Install (user):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/en-us/claude/skills/trim-context" ~/.claude/skills/
  ```
  From the starter, copy only the pieces your `CLAUDE.md` lacks.
- **Invoke:** manual only: `/trim-context` (the skill has `disable-model-invocation: true`).
- **Test:** in a project with a large `CLAUDE.md`, write down `/context`, run `/trim-context`, apply the approved triage and run `/context` again. Create a `CLAUDE.md` in a subfolder and check that it only loads when Claude reads a file there.

## Source 005 — shared folder and handoff between agents

- **What it does:** the `share-agents-md` snippet puts `@AGENTS.md` in `CLAUDE.md` so Claude Code reads the rules the other agents read. The `write-handoff` skill writes the end-of-session note at the top of `HANDOFF.md` and respects `DECISIONS.md`.
- **Install (project)**, at the root of the shared project:
  ```bash
  mkdir -p .claude/skills && cp -R "$REPO/en-us/claude/skills/write-handoff" .claude/skills/
  ```
  Create `HANDOFF.md` and `DECISIONS.md` from the templates in `write-handoff/templates.md` and paste the "Handoff between agents" block into `AGENTS.md`. If the project has a `CLAUDE.md`, paste the body of `en-us/claude/snippets/share-agents-md.md` at its top. Without a `CLAUDE.md`, Claude Code v2.1.277+ already reads `AGENTS.md` on its own.
- **Invoke:** manual only: `/write-handoff` when ending the session.
- **Test:** in a new session, `/context all` should list `CLAUDE.md` under Memory files. Run `/write-handoff`, open another session and ask "continue from the last handoff".


## Source 006 — skills, Tasks and Elicitation over MCP

- **What it does:** the `use-mcp-skills` skill shows how to find and invoke skills that the MCP server or connector itself ships (`/server:skill`), how to follow an MCP task in `/tasks` and how to answer an Elicitation dialog, with the official limits (version, plans, where it does not apply). The `guides/skills-over-mcp.md` guide covers the same in the Claude app. File Uploads is mentioned only as a warning: it is still rolling out.
- **Install the skill (user):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/en-us/claude/skills/use-mcp-skills" ~/.claude/skills/
  ```
  The app guide is not installed by copying a file: open `en-us/claude-app/guides/skills-over-mcp.md` and follow it in the app (destination `app-claude`).
- **Invoke:** `/use-mcp-skills` when you are about to connect a server that publishes skills, or let Claude load this skill if the description matches. The *server's* skill is invoked with `/server:skill`, not with this name.
- **Test:** on Claude Code v2.1.332+ (Pro/Max/Ultra, `/login`), connect a server or connector that publishes skills; `/skills` should list `server:skill`; invoke a harmless skill. If it offers Tasks or Elicitation, follow it in `/tasks` (close `/tasks` to see the dialog). In the app, the flow is through the connector. Not tested yet; the source is `parcial`.


## Source 007 — protect the session prompt cache

- **What it does:** the `protect-session-cache` skill teaches you to set model, effort and Fast mode at the start, to use `/rewind` (not `/compact`) to undo the last turns, and to compact before a break, while the cache still holds (one hour on a subscription). It records the conflict with source 001: `opusplan` breaks the cache on every plan-mode enter/exit. The `compact-instructions.md` snippet is optional, to paste into `CLAUDE.md`.
- **Install the skill (user):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/en-us/claude/skills/protect-session-cache" ~/.claude/skills/
  ```
  Optional: paste the body of `en-us/claude/snippets/compact-instructions.md` into `~/.claude/CLAUDE.md` or the project's `CLAUDE.md`.
- **Invoke:** `/protect-session-cache`, or Claude loads it on its own when you talk about cache, `/rewind`, `/compact` or switching models mid-session.
- **Test:** in a new session, set the model at the start, run two or three turns, run `/rewind` and check that the conversation moved back. In another session, compare (in `/usage` or whatever cache signal your version shows) a mid-session `/model` versus one at the start. Not tested yet; the source is `parcial`.


## Source 008 — clean the session (/clear, /context, @ in the message)

- **What it does:** the `clean-session` skill teaches `/clear` between unrelated tasks, `/context` at the start of a new session and `@file` in the message to attach a known file. It distinguishes that `@` from an import in `CLAUDE.md` (source 004) and points `/rewind` and `/compact` to source 007.
- **Install (user):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/en-us/claude/skills/clean-session" ~/.claude/skills/
  ```
- **Invoke:** `/clean-session`, or Claude loads it on its own when you switch tasks, ask what is in context, or name a file without attaching it.
- **Test:** in a session with history from another task, run `/clear` and check that the history is gone and `CLAUDE.md` stayed; in a new session, `/context` once; in a request, `@` a known file. Not tested yet; the source is `parcial`.

## The repository's own tools

They do not come from an external source; they serve the pipeline. `process-source` (skill, user) and `source-extractor` (subagent, user) process a new link following the [guide](SITE-ANALYSIS-GUIDE.md): install with `cp -R "$REPO/en-us/claude/skills/process-source" ~/.claude/skills/` and `cp "$REPO/en-us/claude/agents/source-extractor.md" ~/.claude/agents/`, and invoke with `/process-source <url>` in this repository's checkout. The `concise-en-us` style (user) goes into `~/.claude/output-styles/` and is turned on with `/output-style` or `"outputStyle": "concise-en-us"` in settings.

## How to compare pt-BR and en-US

Goal: see, in your own use, whether the English version uses less context or is followed better than the Portuguese one. There is no official number on this; you have to measure.

**Isolate the two versions.** With both installed together, the descriptions of the auto-invoked skills (`use-opusplan`/`usar-opusplan`, `use-code-mode`/`usar-code-mode`, `use-mcp-skills`/`usar-skills-pelo-mcp`, `protect-session-cache`/`cuidar-cache-da-sessao`, `clean-session`/`limpar-sessao`, `process-source`/`processar-fonte`) enter the skill list twice, and Claude may pick either one. To compare, install one language at a time, or use one config directory for each (it may ask you to log in again):

```bash
CLAUDE_CONFIG_DIR=~/.claude-ptbr claude   # only the pt-BR artifacts installed here
CLAUDE_CONFIG_DIR=~/.claude-enus claude   # only the en-US artifacts installed here
```

**Keep everything else equal:** same project, same model (`/model`), same Claude Code version, a new session (or `/clear`) for each run and the same request. The request language matters too: compare pt-BR with a Portuguese request and en-US with an English request and, to isolate the artifact's effect, also run en-US with a Portuguese request.

**What to observe:**

| Criterion | How to measure |
| --- | --- |
| Tokens | `/context` at session start (skill list and Memory files) and after invoking the skill; `/usage` for the approximate attribution per skill. Compare the same artifact in both languages. |
| Adherence | Did the auto-invoked skill trigger on the right request? Did it follow the steps (for example, `trim-context`/`enxugar-contexto` measured before proposing; `write-handoff`/`registrar-handoff` wrote at the top and did not commit)? Did it respect the caveats (no savings promise)? |
| Quality | Correct commands and paths, response language as expected, clarity, how many corrections you had to ask for. |

Log each run in one line: date, `claude --version`, model, artifact language, request language, task, `/context` tokens (before and after), adherence (yes, partial, no), quality (1 to 5) and notes. Two or three runs per artifact show the trend; a single run can mislead.
