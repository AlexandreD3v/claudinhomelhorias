<!--
US English mirror of the root CLAUDE.md (pt-BR, canonical), the instructions Claude Code
loads when a session opens in this repository. This file is deliberately NOT named
en-us/CLAUDE.md: a CLAUDE.md in a subfolder loads on demand when Claude reads a file there,
and would duplicate the repository instructions in the session. To test working in
English, swap it for the root CLAUDE.md in a local checkout (do not commit the swap).
-->

# Instructions for this repository

This repository holds the process and the customization artifacts for Alexandre's Claude Code (`claude/`) and Claude app (`claude-app/`). Language: **pt-BR** (canonical); artifacts, notes and process files also have a US English version in `en-us/`.

## Before any new site

1. Read `CONTEXTO.md` (en-US: `en-us/CONTEXT.md`) — current premises, decisions and conventions.
2. Check `fontes/INDICE.md` (en-US: `en-us/sources/INDEX.md`) for numbering and duplicates.
3. Follow `GUIA-ANALISE-SITE.md` (en-US: `en-us/SITE-ANALYSIS-GUIDE.md`) to the letter (`PROCESSO.md` / `en-us/PROCESS.md` only summarizes the quality contract). Respect the premises confirmed in `CONTEXTO.md` (Claude Code + Claude app scope with a theme per source, destination in the artifact, `publicado` only after the push, source `parcial` until tested in Claude Code or the Claude app, one commit per batch, conflicts with both sides visible). The `/processar-fonte` skill (en-US `/process-source`) is the invocable version; the `extrator-fonte` subagent (en-US `source-extractor`) isolates the reading.

## What not to do

- Do not invent frontmatter, paths or field names. Check `referencias/praticas-oficiais.md` (en-US: `en-us/references/official-practices.md`) and the official docs linked there.
- Do not replace another project's `CLAUDE.md` or `settings.json`. Artifacts in `claude/` are for selective copying.
- Do not paste substantial text from copyrighted articles.
- Do not delete existing content to start over.
- Do not describe the repository tree in this file: it is already in `README.md`. Only note here what is not obvious from the code.

## Writing

- Notes in `fontes/NNN-slug.md` from `templates/fonte.md`, and the en-US note in `en-us/sources/` from `en-us/templates/source.md`.
- Installable Claude Code artifacts in `claude/`; Claude app artifacts in `claude-app/` (guides, projects, styles, prompts, settings). Source citation in both.
- Every new or changed installable artifact ships in both languages: pt-BR in `claude/` or `claude-app/` and en-US in the mirror `en-us/claude/` or `en-us/claude-app/`, with a different English `name`. Update `USO.md` and `en-us/USAGE.md` (what it does, install, invocation, test).
- New or changed notes, index rows and process files also ship in en-US, in the `en-us/` mirror (path map in `en-us/README.md`).
- Bridge for Claude Code to load skills/agents from this folder: `.claude/`.
- Direct commits to `main`, message in pt-BR: one per single source, or one for the batch. `publicado` only after the GitHub push.
