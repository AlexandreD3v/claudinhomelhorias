# Per-site process

US English mirror of [`PROCESSO.md`](../PROCESSO.md) (pt-BR, canonical). Pipeline for each link Alexandre sends. Since November 26, 2026 the scope covers **Claude Code** (package `claude/`) and the **Claude app** — chat and Desktop, Mac and Windows (package `claude-app/`). Each source has a theme (`Tema`): `claude-code`, `claude-app` or `ambos` (both). The full operational step-by-step — from capture to report — is in [`SITE-ANALYSIS-GUIDE.md`](SITE-ANALYSIS-GUIDE.md). Use that guide in every analysis; do not keep a parallel flow.

The skill [`claude/skills/process-source/SKILL.md`](claude/skills/process-source/SKILL.md) (`/process-source`; pt-BR `/processar-fonte`) and the subagent [`claude/agents/source-extractor.md`](claude/agents/source-extractor.md) (pt-BR `extrator-fonte`) follow the guide. The current premises (confirmed on November 25, 2026) are in [`CONTEXT.md`](CONTEXT.md).

## Prerequisites

- Having read `CONTEXT.md` (or `CONTEXTO.md`) in this session, including the Premises section.
- Having the relevant official docs at hand (shortcuts in [`references/official-practices.md`](references/official-practices.md)). If the source material contradicts the official docs on paths, frontmatter or product behavior, **the official docs prevail**; note the divergence in the source note. If two unofficial sources disagree, show **both sides** in the note and the report, without silently choosing.

## Contract: quality criteria

An artifact only enters the repository if it meets all of these:

1. **Concise** — no useless preamble; `CLAUDE.md` and skill/agent descriptions short (the `description` enters the context of every session).
2. **Actionable** — it can be executed or verified; not a vague opinion.
3. **Checked** — paths and frontmatter match the current official docs.
4. **No duplicate** — does not repeat another artifact or the starter, except an explicit merge of sources.
5. **Attributed** — URL and access date tracked in the index and the note.
6. **No substantial copying** — does not reproduce the article; summarizes and points to it.
7. **Installable or usable** — declares the destination: `projeto` or `usuario` in `claude/` (`project` or `user` in `en-us/claude/`; the type's README explains where to copy); `app-claude`, `projeto-claudeai` or `configuracoes` in `claude-app/` (the folder README explains where to read or paste).
8. **Bilingual and with a "how to use"** — ships in pt-BR and en-US (mirror in `en-us/`, with a different English `name`) and has the source's section in `USO.md` and `en-us/USAGE.md` (steps 8 to 10 of the guide). The source note, the index row and any changed process file also get their en-US version in `en-us/`.

Mechanical validation is mandatory. The test is mandatory to close as `publicado` — in Claude Code for `claude/` artifacts, in the Claude app for `claude-app/` artifacts; without that test, the source stays `parcial` (step 9 of the guide).

## Index states

The status values stay in pt-BR, as in the repository index.

| Status | Meaning |
| --- | --- |
| `em andamento` (in progress) | Number reserved; reading or writing under way |
| `publicado` (published) | Note and artifacts written, tested (Claude Code or Claude app, depending on the theme), committed to `main` and **already pushed to GitHub** |
| `parcial` (partial) | Something useful was written, but something is pending (incomplete page, test in Claude Code or the Claude app not done yet, push pending, classification doubt) |
| `descartado` (discarded) | The site yielded no artifact for either Claude Code or the Claude app; the note explains why. The note and the index **are committed** anyway |

Several links in the same request go into a **single batch commit**. A single source produces one commit. A discarded source also goes into that commit (or into a commit of its own, if it comes alone).

## What not to do

- Do not write an artifact "just to have a file" if there is no actionable insight.
- Do not put a long procedure in the starter `CLAUDE.md`.
- Do not treat a blog tip as the official format when Anthropic's docs say otherwise.
- Do not silently pick a side in a conflict between sources; show both in the note and the report.
- Do not omit the install destination (`projeto` or `usuario`; in the app, `app-claude`, `projeto-claudeai` or `configuracoes`).
- Do not discard a Claude app feature just because it is not Claude Code: it goes into `claude-app/`.
- Do not mark `publicado` before the GitHub push, nor while the artifact has not been tested in Claude Code (`claude/`) or the Claude app (`claude-app/`).
- Do not invent the content of a page you could not read (paywall, block, video without transcript).
- Do not delete existing repository content to "start over".
