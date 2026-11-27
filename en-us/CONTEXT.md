# Working context

US English mirror of [`CONTEXTO.md`](../CONTEXTO.md) (pt-BR, canonical). This file is the repository's persistent context. Any future session should read it **before** processing a new site, and update it (in both languages) when a decision or convention changes.

Last updated: November 27, 2026, 11:24 (America/Sao_Paulo).

## Goal

Read sites (links Alexandre sends) about Anthropic's Claude and Claude Code and turn them into useful instructions to **improve the use of Claude Code** (package `claude/`) **and of the Claude app** — chat, Claude Desktop on Mac and Windows, claude.ai (package `claude-app/`). The step-by-step and every generated file live in this repository: [AlexandreD3v/claudinhomelhorias](https://github.com/AlexandreD3v/claudinhomelhorias).

The Claude app scope was added on November 26, 2026 (see Premises). What has been processed is in [`sources/INDEX.md`](sources/INDEX.md).

## Relevant profile

- Name: Alexandre Jackson Correa.
- Working language in this repo: pt-BR (US English version mirrored in `en-us/`).
- GitHub: [AlexandreD3v](https://github.com/AlexandreD3v).
- Professional context useful for future examples (do not invent NetSuite artifacts without a source): NetSuite / SuiteScript development, works at Qlik, maintains the SuiteScript Toolkit, moving to contractor (PJ) work.
- Intended use of the artifacts: in Claude Code, a project (`.claude/`) or `~/.claude` (all projects); in the Claude app, the app, a claude.ai Project or Settings. Each artifact declares the destination explicitly (`projeto` or `usuario` in `claude/`, `project` or `user` in `en-us/claude/`; `app-claude`, `projeto-claudeai` or `configuracoes` in `claude-app/`).

## Conventions

- Texts in Brazilian Portuguese, with a US English mirror in `en-us/` (English names). File, skill, command and agent names in kebab-case ASCII (`processar-fonte` / `process-source`, not `processarFonte` or `processar_fonte`).
- Source numbering: `001`, `002`, … (three digits), the same in both languages. Short slug derived from the title or the domain, no accents. Each source has a **theme** (`Tema`: `claude-code`, `claude-app` or `ambos`), in the note and in the index `Tema` column.
- Notes file: `fontes/NNN-slug.md`, created from `templates/fonte.md`; en-US: `en-us/sources/NNN-slug.md`, from `en-us/templates/source.md`.
- Claude Code artifacts: in `claude/`, in the type's subfolder. Claude app artifacts (guides, project instructions, styles, prompts, settings): in `claude-app/`, in the type's subfolder. The two folders sit side by side on `main`. Each artifact cites the source (`NNN` + URL) and declares the **install destination**: `projeto` (the project's `.claude/`, or `./CLAUDE.md` / `./.mcp.json` at the root) or `usuario` (`~/.claude/`, or `~/.claude.json` for personal MCP). Field convention: `templates/README.md` (en-US: `en-us/templates/README.md`).
- Prefer a skill to a standalone command for new work. Keep `.claude/commands/` only when the user already has that habit or the source material is clearly a one-line shortcut.
- `CLAUDE.md` (project or user) stays short, concrete and only with what Claude cannot discover by reading the repository. Official target: under 200 lines per file. A multi-step procedure goes into a skill. An instruction that applies only to certain files goes into `.claude/rules/` with `paths`.
- What must never fail (never read `.env`, always format, never edit a generated folder) becomes a hook, `permissions.deny` or a managed setting — not a line in `CLAUDE.md`.
- Do not duplicate an existing artifact: before writing, search `claude/`, `claude-app/` and the index. If it is an improvement, edit the artifact and record the additional source.
- Do not paste substantial text from protected articles. Summarize, extract the actionable part and cite the URL.
- Check paths, frontmatter and format against the current official docs (links in `referencias/praticas-oficiais.md`, en-US `en-us/references/official-practices.md`) before writing.
- Commits on the default branch `main`, with clear pt-BR messages. A single source produces one commit; several links at once produce **a single commit for the batch**. This is a personal repository; direct commits are the agreed way of working. The `publicado` status only counts after the GitHub push.
- Dates in this repo, when local, use the **America/Sao_Paulo** time zone and state it explicitly.

## Premises

Current premises, confirmed by Alexandre on **November 25, 2026** (America/Sao_Paulo), including those that were open. Any future change goes into the diary and into this section.

### Agreed

- **Goal.** Turn sites Alexandre points to about Claude and Claude Code (Anthropic) into useful instructions to improve the use of Claude Code. The process and every generated file live in [AlexandreD3v/claudinhomelhorias](https://github.com/AlexandreD3v/claudinhomelhorias).
- **Audience.** Alexandre Jackson Correa. The artifacts serve his use of Claude Code. Each one declares whether it installs in the project (`.claude/`) or in `~/.claude`. The professional context (NetSuite / SuiteScript, Qlik, SuiteScript Toolkit, move to PJ) informs future examples; no NetSuite artifact is invented without a source.
- **Language.** Repository texts in pt-BR, which is canonical; since November 26, 2026, installable artifacts, notes and process files also in US English, in `en-us/` (see below). File, skill, command and agent names in kebab-case ASCII.
- **Where artifacts live.** The canonical installable Claude Code package is `claude/`, in the type's subfolder. The Claude app package is `claude-app/` (no install by copying: the app does not read the repository). This repo's `.claude/` folder is only a bridge to load skills/agents/styles from here (and via `--add-dir`). Installing elsewhere follows the artifact's `destino` field and the install README.
- **Artifact types.** Claude Code: `CLAUDE.md` snippet, rule (`paths`), skill (preferred for new work), legacy command, subagent, output style, hook and/or `permissions.deny`/settings, MCP, plugin (only if there is a real package). Claude app: usage guide, project instruction, style or preference, prompt, setting. Classification and destinations: tables in [`SITE-ANALYSIS-GUIDE.md`](SITE-ANALYSIS-GUIDE.md).
- **Official wins on format.** Paths, frontmatter and product behavior follow the current official docs (`code.claude.com` for Claude Code; `claude.com/resources`, `support.claude.com` and `anthropic.com/news` for the Claude app; shortcuts in `references/official-practices.md`). A blog tip that contradicts the official docs does not dictate the artifact; the divergence goes into the note. An actionable unofficial flow that does not contradict the official docs can be written down, with attribution, without being presented as Anthropic docs.
- **Citation and copyright.** Each artifact and the source note cite `NNN`, URL and access date (America/Sao_Paulo). No substantial text from a protected article is pasted: it is summarized, the actionable part extracted and the section pointed to.
- **Deduplication.** Before writing, search `claude/` and the index. An improvement edits the existing artifact and records the additional source.
- **Quality.** An artifact only goes in if it is concise, actionable, checked against the official docs, not a duplicate, attributed, not a substantial copy and installable (criteria in [`PROCESS.md`](PROCESS.md)).
- **Incomplete capture.** Paywall, login, block, video without transcript or inaccessible PDF: the content is not invented; ask Alexandre for an excerpt or other access.
- **Versioning.** Personal repository; direct commits to `main`, pt-BR messages. A single source produces one commit; several links sent at once produce a single commit for the batch. Local dates with the America/Sao_Paulo time zone stated.
- **"Done" for a source.** Complete note, updated index, artifacts (if any) with declared destination and validated, report in the guide's format, commit to `main` and, for `publicado` status, the **GitHub push**. Without a test in Claude Code (`claude/` artifact) or the Claude app (`claude-app/` artifact), the source stays `parcial`. A `descartado` source still gets a commit (note + index).

### Confirmed by Alexandre on November 25, 2026

- **Neighboring links.** If the site is mostly about Cursor, another agent or generic prompting, extract **only what applies to Claude Code** — and, since November 26, 2026, also to the Claude app (see the section below). Do not refuse the link outright and do not force an out-of-scope artifact.
- **Install destination.** Each artifact states explicitly whether it goes in the project (`.claude/`, or `./CLAUDE.md` / `./.mcp.json` at the root) or in `~/.claude` (or `~/.claude.json` for personal MCP). The field is mandatory in templates and artifacts; values: `projeto` or `usuario` (en-US: `project` or `user`).
- **`publicado` status.** Only after the GitHub push. A local commit is not enough. While the push is pending, the source does not go to `publicado` (it stays `parcial` if the rest is ready).
- **Conflict between sources.** Show both sides in the report and in the source note, **without silently choosing**. Aligning with the current official docs may be recommended, but both sides stay visible.
- **Untested artifact.** The mechanical check (frontmatter, JSON, `bash -n`, links) is always mandatory. If the artifact has not been tested in a Claude Code session (`claude/`) or in the Claude app (`claude-app/`), the source stays `parcial` until the test.
- **Several links at once.** One commit for the batch (all the sources of that request), not one commit per link.
- **Discarded source.** Reserve the number and commit the note and the index anyway, so the reason for discarding is not lost. Since November 26, 2026, only what serves neither Claude Code nor the Claude app is discarded.

### Confirmed by Alexandre on November 26, 2026

- **Scope widened to the Claude app.** Claude app content (chat and Claude Desktop, Mac and Windows, claude.ai) is also kept, in a new `claude-app/` folder on `main`, next to `claude/`, which remains the Claude Code package. No branch.
- **Extraction rule.** From each site, extract what applies to Claude Code (goes to `claude/`) or to the Claude app (goes to `claude-app/`). Discard only what serves neither. This widened the November 25 neighboring-links premise, which covered only Claude Code.
- **App artifacts.** Usage guides, project or style instructions, prompts and app settings. Each one states the destination: `app-claude` (Claude app Mac/Windows), `projeto-claudeai` (claude.ai Project) or `configuracoes` (Settings). The [`claude-app/`](claude-app/) README explains what goes in and how to use it.
- **Theme in the index.** The [`sources/INDEX.md`](sources/INDEX.md) table (pt-BR `fontes/INDICE.md`) gets the `Tema` column (`claude-code`, `claude-app` or `ambos`).
- **Two languages.** Alexandre's request on November 26, 2026: everything installable ships in pt-BR (in `claude/` and `claude-app/`) and in US English (mirror in `en-us/claude/` and `en-us/claude-app/`), to compare the use of the two versions and to share. en-US skills, agents and styles have a different English `name`, so they can coexist in `~/.claude/`. In that first step, the `fontes/` notes, the guide, `PROCESSO.md`, `CONTEXTO.md` and the templates stayed in pt-BR only, and [`README.en-US.md`](../README.en-US.md) introduced the repository in English (the next premise extended the translation to them).
- **How to use.** Each source with an installable artifact has a section in [`USO.md`](../USO.md) and [`USAGE.md`](USAGE.md): what it does, copy command, invocation and test.
- **Notes and process also in en-US.** Alexandre's request on November 26, 2026, after the en-US version of the artifacts: the `fontes/` notes, the index, the guide, `CONTEXTO.md`, `PROCESSO.md`, the templates, `referencias/praticas-oficiais.md` and the root `CLAUDE.md` get a US English version in `en-us/` (path map in [`README.md`](README.md)). pt-BR stays canonical and in the same place. From now on, new or changed notes and process files ship in both languages in the same commit.
- **Other premises.** They apply to the app too: declared destination, official-docs check, both sides of conflicts, `publicado` only after the push, untested leaves the source `parcial`, one commit per batch.

## Repository state at setup

- The GitHub repository was created on November 25, 2026, 20:57 (America/Sao_Paulo) (`2026-11-25T23:57:13Z`). It was **empty**: no commits, no files, default branch `main`, private visibility.
- Nothing was deleted. The structure below is the first population.

## Decision diary

### 2026-11-25 — Initial structure and official practices

- Official sources consulted (docs in English, summary in pt-BR): `code.claude.com` — best practices, memory/CLAUDE.md, skills, subagents, hooks, the `.claude` directory, extensions overview, output styles, MCP and plugins. Details and URLs: [`references/official-practices.md`](references/official-practices.md).
- The requested design (`README`, `CONTEXTO`, `PROCESSO`, `fontes/`, `claude/`, `templates/`) was kept and **extended** with `claude/rules/`, `claude/output-styles/`, `templates/mcp.json` and `referencias/`, because the official docs treat those mechanisms in the same customization set.
- Hooks have no magic folder read by Claude Code. The config lives in `settings.json` (project, local or user); the scripts can live in `claude/hooks/` and are referenced by the `command` field.
- Custom commands were merged into skills. Files in `.claude/commands/` remain valid; for new artifacts, write a skill in `claude/skills/<name>/SKILL.md`. To prevent automatic invocation, use `disable-model-invocation: true`.
- The `claude/` folder is the portable package (visible on GitHub). This repo's `.claude/` folder is a thin bridge for Claude Code to load skills and agents when the session opens here or when `--add-dir` is used.
- The `processar-fonte` skill and the `extrator-fonte` subagent were included for the pipeline itself — they do not come from an external site, they come from this process.
- The `CLAUDE.md` in `claude/` is a short starter inspired by the official practices, to copy selectively into a project or `~/.claude/CLAUDE.md`. The root `CLAUDE.md` applies only to working in **this** repository.

### 2026-11-25 — Premises and analysis guide (before the first link)

- Alexandre asked to confirm the premises and to have an artifact with the step-by-step for analyzing a site, before the first link.
- The premises were extracted from `CONTEXTO.md`, `PROCESSO.md` and the official research of November 25, 2026, and listed in the Premises section of this file. Still on that date, Alexandre confirmed the open ones (next diary entry).
- The operational step-by-step moved to [`SITE-ANALYSIS-GUIDE.md`](SITE-ANALYSIS-GUIDE.md) (pt-BR `GUIA-ANALISE-SITE.md`). `PROCESSO.md` became a short contract that points to the guide, so there are not two diverging flows.
- The initial setup content was published on GitHub in `aac9603` (on top of an owner README commit). This local checkout's git history diverges; the file contents are the same.

### 2026-11-25 — Open premises confirmed by Alexandre

- Neighboring links: extract only what applies to Claude Code.
- Install destination: mandatory field in every artifact and template (`projeto` = the project's `.claude/`; `usuario` = `~/.claude`).
- `publicado` status only after the GitHub push; a local commit is not enough.
- Conflict between sources: show both sides in the note and the report, without silently choosing.
- Artifact not tested in Claude Code: the source stays `parcial` until the test.
- Several links at once: a single commit for the batch.
- Discarded source: commit the note and the index anyway.
- The guide, the process, the templates and the `processar-fonte` skill were aligned with these decisions.

### 2026-11-26 — Scope widened to the Claude app

- Alexandre confirmed that Claude app content (chat/Desktop, Mac and Windows) is also kept, in the new `claude-app/` folder, on `main`, next to `claude/`. No branch.
- New rule: from each site, extract what applies to Claude Code (`claude/`) or to the Claude app (`claude-app/`); discard only what serves neither. It replaces the November 25 rule of "only what applies to Claude Code".
- App destinations: `app-claude`, `projeto-claudeai`, `configuracoes`. No install by copying files.
- Index with the `Tema` column. Filled in: 001 `claude-code`, 002 `claude-code`, 003 `claude-app`.
- Source 003 (9to5Mac, Install as app), previously `descartado`, was reprocessed: it became a guide in `claude-app/guias/` and moved to `parcial`, because it was not tested in the Claude app.
- The analysis guide, the process, the templates, the `processar-fonte` skill and the `extrator-fonte` subagent were aligned with the new scope.

### 2026-11-26 — Batch 004 and 005

- Two XDA sources, both `claude-code`, processed in a single commit: 004 (instructions out of the main session) and 005 (folder shared between agents).
- Lessons from the official check that count as conventions: an `@` import does not reduce context (only a skill, a rule with `paths` and a subfolder `CLAUDE.md` load on demand); Claude Code reads `AGENTS.md` on its own since v2.1.277 when there is no `CLAUDE.md`; a reader comment on an article is not a source.
- The starter `claude/CLAUDE.md` got two additions (004). New: skill `enxugar-contexto` (usuario), skill `registrar-handoff` (projeto) and snippet `compartilhar-agents-md` (projeto). All `parcial`, not tested in Claude Code.

### 2026-11-26 — en-US version and "how to use"

- Alexandre asked for a pt-BR and an en-US version of everything produced (sources 001 to 005), to test the difference in use and to share. He also asked whether each source had an artifact explaining what it does and how to use it: only 003 had one (the app guide already has requirements, steps and a test); for the others, how to install and test was spread across the note, the READMEs and the skill body.
- Chosen structure: mirror `en-us/claude/` and `en-us/claude-app/`, keeping the pt-BR paths intact (notes, index and earlier patches stay valid) and putting the en-US version in a single folder that is easy to share. A file-name suffix (`SKILL.en.md`) does not work: Claude Code only reads `SKILL.md`.
- en-US names: `use-opusplan`, `use-code-mode`, `trim-context`, `write-handoff`, `process-source`, `source-extractor`, `concise-en-us`, `share-agents-md` (full table in `USO.md` / `USAGE.md`).
- "How to use" in one file per language (`USO.md` at the root and `en-us/USAGE.md`), with one section per source and the "How to compare pt-BR and en-US" section (tokens in `/context`, adherence and quality, with the versions isolated by `CLAUDE_CONFIG_DIR`).
- The guide (steps 8 to 10, validation, report and checklist), `PROCESSO.md`, the templates and the `processar-fonte` skill got the two-language rule. No artifact was tested; the sources remain `parcial`.

### 2026-11-26 — Notes and process files in en-US

- Alexandre asked to also translate the notes and the process files. The en-US version lives in `en-us/`, with English names, consistent with `en-us/claude-app/guides/`: `en-us/sources/` (notes and `INDEX.md`), `en-us/SITE-ANALYSIS-GUIDE.md`, `en-us/CONTEXT.md`, `en-us/PROCESS.md`, `en-us/templates/`, `en-us/references/official-practices.md`.
- The root `CLAUDE.md` became `en-us/CLAUDE.en-US.md`, not `en-us/CLAUDE.md`: a `CLAUDE.md` in a subfolder loads on demand when Claude reads a file there, and would duplicate the repository instructions in the session.
- The links in the en-US version point to the en-US equivalents; whatever exists only in pt-BR (no file, for now) would point to the original.
- New rule in the guide (step 10 and checklist), in `PROCESSO.md`, in `CLAUDE.md`, in the templates and in the `processar-fonte`/`process-source` skills: new or changed notes, index and process files ship in both languages.


### 2026-11-26 — Source 006 (Skills over MCP)

- Alexandre approved processing now the official Anthropic article (Nov 24) on Skills over MCP, Tasks, Elicitation and File Uploads, despite the high weekly quota.
- Theme `ambos`: skill `usar-skills-pelo-mcp` (user) and guide `claude-app/guias/skills-pelo-mcp.md` (app-claude), with an en-US mirror (`use-mcp-skills`, `guides/skills-over-mcp.md`). Status `parcial`.
- Divergences recorded in the note: the article still says “coming soon to Enterprise”, the official table already lists Team and Enterprise as Admin-enabled; the docs cite v2.1.331+, the changelog announces the feature in 2.1.332; File Uploads is “rolling out” in the article and already documented in beta with restrictions.

### 2026-11-27 — Ten tips, one source at a time; source 007 (session cache)

- Alexandre approved adding the 10 tips from the research (`/workspace/claudinho-dicas-10.md`), **one at a time**, in list order, so he can watch how each one is used before the next.
- First: source 007, official article “Maximizing the value of your Claude Code sessions”. Theme `claude-code`, status `parcial`. Skill `cuidar-cache-da-sessao` (user) and optional snippet `instrucoes-de-compact.md`. en-US mirror: `protect-session-cache`, `compact-instructions.md`.
- Conflict with 001 recorded on both sides: `opusplan` switches model on plan-mode enter/exit and breaks the cache; turn it on at the start of the session (or after `/clear`), not in the middle.

### 2026-11-27 — Source 008 (clean the session; tip 2 of 10)

- Second tip on the list, after Alexandre asked to continue and to test 007 later. Same official article as 007; skill `limpar-sessao` (user), mirror `clean-session`. Status `parcial`.
- Distinction recorded with 004: an `@` import in `CLAUDE.md` does not save context; `@file` in a message attaches the file for that turn only. Also cross-linked with 007 (`/rewind` / `/compact` / cache after `/clear`).

### 2026-11-27 — Source 009 (/rewind and checkpoints; tip 3 of 10)

- Third tip on the list, after Alexandre asked to continue. Official checkpointing and commands docs. Skill `usar-rewind` (user), mirror `use-rewind`. Status `parcial`.
- Official limits in the note and the skill: a Bash-only file and most subagent edits are not restored — use Git. Cross-link with 007: `/rewind` keeps the prompt cache; `/compact` does not.
## How to resume a session

1. Read this file (including the Premises section) and the latest diary entry.
2. Open [`sources/INDEX.md`](sources/INDEX.md) (pt-BR `fontes/INDICE.md`) and see what was processed or left in progress.
3. Follow [`SITE-ANALYSIS-GUIDE.md`](SITE-ANALYSIS-GUIDE.md) for the next link. [`PROCESS.md`](PROCESS.md) is the short contract (quality and states) and points to the guide.
4. If the official docs changed, update `referencias/praticas-oficiais.md` and `en-us/references/official-practices.md`, plus the diary, before writing artifacts with a new format.
