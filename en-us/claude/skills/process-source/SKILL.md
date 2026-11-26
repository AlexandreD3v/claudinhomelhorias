---
name: process-source
description: >
  Reads a site about Claude, Claude Code or the Claude app (Desktop, claude.ai),
  extracts actionable insights and writes artifacts into this repository
  (claudinhomelhorias), in claude/ or claude-app/ plus their en-us/ mirrors,
  following GUIA-ANALISE-SITE.md. Use when the user sends a link, asks to
  process a source, or to turn an article into a skill, CLAUDE.md, hook,
  agent or setting.
when_to_use: >
  The user pastes the URL of an article, guide or post about Claude Code,
  or says "process this source", "turn this site into instructions".
argument-hint: "[url]"
arguments: [url]
allowed-tools: Read Grep Glob WebFetch WebSearch Bash
metadata:
  destination: user
  source: initial-setup
  origin: "Initial process of the claudinhomelhorias repository"
  accessed: "2026-11-25"
  mirror-of: processar-fonte
---

# Process a source

**Install destination:** `user` (`~/.claude/skills/process-source/`). US English mirror of the pt-BR skill `processar-fonte`; both can be installed together because the names differ.

Canonical: follow `GUIA-ANALISE-SITE.md` at the root of the **claudinhomelhorias** repository (https://github.com/AlexandreD3v/claudinhomelhorias). The guide, `PROCESSO.md` (quality contract and index states) and `CONTEXTO.md` (premises confirmed on November 25 and 26, 2026, including the Claude app scope and the bilingual rule) are written in pt-BR. This text summarizes the flow so the skill works even with `--add-dir`. Work in that repository's checkout; do not write the artifacts into the wrong project.

Languages: source notes and process files stay in **pt-BR**. Every new installable artifact ships in **two languages**: pt-BR in `claude/` or `claude-app/`, US English in `en-us/claude/` or `en-us/claude-app/`, with a different English kebab-case ASCII `name`. Dates: America/Sao_Paulo time zone.

## Input

The URL is `$url` (or `$ARGUMENTS` if it comes loose). If the link is missing, ask before inventing a source. If several URLs arrive in the same request, process all of them in the same cycle and make **a single commit for the batch**.

## Steps

Follow the guide's twelve steps, in this summary:

1. Intake: canonical URL; set the theme (`claude-code`, `claude-app` or `ambos`). For a neighboring link (Cursor, another agent, generic prompting), extract only what applies to Claude Code or the Claude app. Next number in `fontes/INDICE.md`, slug, row `em andamento`, note from `templates/fonte.md`.
2. Read the main page and only the extras you need (series, cited official docs, version). No crawler. On a paywall, login or block, record it and stop — do not invent the content. The reading can go to the `source-extractor` subagent (pt-BR: `extrator-fonte`).
3. Record credibility and date (author, outlet, recency, cited version). On conflict with another source, describe both sides in the note and the report, without silently choosing.
4. Extract only actionable insights for using Claude Code or the Claude app. Discard marketing, what serves neither, and what is already in `claude/`, `claude-app/` or `referencias/praticas-oficiais.md`.
5. Check path and frontmatter against the current official docs (`code.claude.com`; for the app, `claude.com/resources` and `support.claude.com`). If the site diverges, the artifact follows the official docs; both sides go into the note. Update the repo summary if the official docs changed.
6. Deduplicate in `claude/`, `claude-app/` and the index; prefer editing an existing artifact.
7. Classify with the guide's tables (Claude Code: CLAUDE.md snippet, rule, skill, legacy command, subagent, style, hook/settings, MCP, plugin; Claude app: guide, project instruction, style, prompt, setting; or none).
8. Write into `claude/` or `claude-app/` with the template from `templates/`, the source citation and the **destination** in the right place for the type (`projeto` or `usuario`; in the app, `app-claude`, `projeto-claudeai` or `configuracoes`), with valid examples. Write the US English mirror in `en-us/` with an English name that does not collide, and update `USO.md` and `en-us/USAGE.md` (what it does, install, invoke, test). Update the copy in `.claude/` if this repo's pipeline depends on the Claude Code artifact (`claude-app/` has no copy).
9. Validate both languages: frontmatter on the first line, `python3 -m json.tool` on JSON, `bash -n` on hooks, destination declared, no name collision. Test in Claude Code (`/doctor` or invocation) or, for `claude-app/`, in the Claude app. Without that test, the source stays `parcial`.
10. Close the note and the index. `publicado` only after the test (Claude Code or Claude app) **and** the GitHub push. A `descartado` source (serves neither) still gets a note, index row and commit. Fill the index `Tema` column. Update the `CONTEXTO.md` diary if a new decision appears.
11. Commit on `main` with a clear pt-BR message: one per single source, or one for the batch. Then push; without the push, do not mark `publicado`.
12. Deliver the report in the format of section 12 of the guide (including destination, conflicts with both sides, test and push).

## Definition of done

The work ends only when the note, the index and the artifacts (in both languages) meet the criteria of `PROCESSO.md`, the guide's checklist is complete and the report is out. `publicado` needs a test (Claude Code or Claude app) and the GitHub push.
