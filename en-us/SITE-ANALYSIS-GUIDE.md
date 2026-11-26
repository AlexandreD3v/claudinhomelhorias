# Site analysis guide

US English mirror of [`GUIA-ANALISE-SITE.md`](../GUIA-ANALISE-SITE.md) (pt-BR, canonical). Operational step-by-step for each link Alexandre sends. Follow the steps in order. Do not skip the credibility check, the official-docs check or deduplication.

**Scope (confirmed on November 26, 2026):** from each site, extract what applies to **Claude Code** (goes to [`claude/`](claude/)) or to the **Claude app** — chat and Claude Desktop, Mac and Windows, claude.ai (goes to [`claude-app/`](claude-app/)). Only what serves neither is discarded. Each source gets a **theme** (`Tema`): `claude-code`, `claude-app` or `ambos` (both).

This guide is the execution reference. The short contract (quality, index states, what not to do) stays in [`PROCESS.md`](PROCESS.md). The current premises, confirmed on November 25, 2026, are in [`CONTEXT.md`](CONTEXT.md). The [`/process-source`](claude/skills/process-source/SKILL.md) skill (pt-BR `/processar-fonte`) and the [`source-extractor`](claude/agents/source-extractor.md) subagent (pt-BR `extrator-fonte`) follow this same flow.

Language of generated files: **pt-BR**, and everything also gets a **US English** version in the `en-us/` mirror: installable artifacts (steps 8 and 9), notes, index and process files (step 10). The path map is in [`README.md`](README.md). Access and report dates: **America/Sao_Paulo** time zone, stated explicitly.

The index keys stay in pt-BR in both languages: statuses `em andamento` (in progress), `publicado` (published), `parcial` (partial), `descartado` (discarded); theme `ambos` (both); pt-BR destinations `projeto` / `usuario` (en-US artifacts use `project` / `user`).

## 1. Intake — capture the request

1. Record the URL as Alexandre sent it and its canonical form (no tracking parameters: `utm_*`, `fbclid`, `gclid`, etc.). If the query is part of the content (article id, page), keep it.
2. Check the scope. If the material is mostly about Cursor, another agent, Xcode or generic prompting, extract **only what applies to Claude Code or the Claude app**. Do not refuse the link outright and do not force an out-of-scope artifact. If the article is about the Claude app (for example Claude Desktop, artifacts, projects, styles), the content also goes in, into `claude-app/`. Set the **theme** (`claude-code`, `claude-app` or `ambos`) and mention in the report what was left aside because it serves neither.
3. Open [`fontes/INDICE.md`](../fontes/INDICE.md) (en-US: [`sources/INDEX.md`](sources/INDEX.md)). Take the **next free number** (`001`, `002`, …) and a short **slug** in kebab-case ASCII (domain or shortened title, no accents). If several links arrive in the same request, reserve one number for each, all `em andamento`, and treat them as a batch (a single commit in step 11).
4. Add the row to the index with status `em andamento`, the provisional theme and today's date/time (America/Sao_Paulo). This reserves the number so another session does not reuse it.
5. Copy [`templates/fonte.md`](../templates/fonte.md) to `fontes/NNN-slug.md` and fill in right away: URL, provisional title, access date, author/site if already obvious. The en-US note starts from [`templates/source.md`](templates/source.md).

## 2. Fetch and read (including several pages)

1. Read the main page in full (not just the title and the lead).
2. Follow extra pages **only when needed** to understand or check an insight, for example:
   - continuation of a series ("part 2", "next");
   - an official document it cites (format, frontmatter, path);
   - a README, changelog or version page that dates the advice;
   - an example tied to the flow (a repository or Gist the author points to), if it is short and the core of the tip.
3. Do not crawl. A rule of thumb: the main page, plus at most a handful of essential links (usually up to 3–5). Record in the source note what was read and what was deliberately left aside.
4. If the capture fails (block, login, paywall, video without transcript, inaccessible PDF), **stop**. Record the block in the note, leave the status `parcial` or `em andamento` and ask Alexandre for an excerpt, export or other access. **Do not invent** content you did not read.
5. You can delegate reading and extraction to the `source-extractor` subagent (`extrator-fonte`). Final classification, the official check, deduplication and writing stay with whoever runs the cycle.

## 3. Check credibility and date

Before turning any idea into an artifact, record in the note:

- author and outlet (Anthropic / `code.claude.com` / `claude.com` / `support.claude.com`, Anthropic engineering, community, newsletter, marketing);
- publication date and, if any, the update date;
- the Claude Code, Claude app (Desktop) or model version mentioned, if it appears;
- whether the text is a usage report, speculation or a tutorial with reproducible steps.

Interpretation:

- The current official docs prevail on paths, frontmatter, field names and product behavior.
- An old article, or one citing old versions, is not discarded automatically: the insight may still hold. Mark it as possibly outdated and confirm it in the **current** official docs (not only in [`references/official-practices.md`](references/official-practices.md), which is a snapshot).
- Marketing, "10 miracle tips" and restatements of the obvious already covered in the starter or the official summary leave the artifact list, unless there is a concrete format detail or a flow we do not have yet.
- If this page disagrees with another source (official or not), describe **both sides** in the note and the report, **without silently choosing**. A recommendation (for example, follow the current official docs) may appear, but both sides stay visible.

## 4. Extract actionable insights

For each idea, ask the filter question: **does this change, concretely, how Alexandre uses Claude Code or the Claude app?**

Discard: marketing, generalities, what he would already do by reading the target repository itself, what serves neither Claude Code nor the Claude app, and what is already covered equivalently in `claude/`, `claude-app/` or `referencias/praticas-oficiais.md`. A Claude app feature is not discarded just because it is not Claude Code: it becomes an artifact in `claude-app/`. If the same insight serves both, the theme is `ambos`, with an artifact in each folder and a cross-reference.

For each insight that passes, record in the source note:

- the **action** (what to do);
- **when** it matters;
- the likely artifact **type**;
- the **theme** (`claude-code`, `claude-app` or `ambos`);
- the likely **install destination** (`projeto` or `usuario` for Claude Code; `app-claude`, `projeto-claudeai` or `configuracoes` for the Claude app);
- the **source section** (section name or anchor, not a long excerpt);
- whether it needs an official-docs check (yes/no).

## 5. Check against the official docs

1. Identify the type's official guide (shortcuts in `references/official-practices.md`). For Claude Code, `code.claude.com/docs`; for the Claude app, `claude.com/resources`, the Help Center (`support.claude.com`) and `anthropic.com/news`. If the repository summary may be stale, reopen the current official page and, if it changed, update the summary and the `CONTEXTO.md` diary (both languages) **before** writing an artifact with a new format.
2. Check path, frontmatter and field names (hyphens in skills; camelCase in agents, such as `disallowedTools`). Do not invent keys.
3. If the site contradicts the official docs on format or product behavior, the artifact **follows the official docs**. The divergence — both sides — goes into the source note and the report.
4. An unofficial flow that does **not** contradict the official docs and is actionable can become an artifact, with the source's attribution and date. Do not present it as Anthropic documentation.

## 6. Deduplicate

Search `claude/`, `claude-app/`, `fontes/INDICE.md`, `claude/CLAUDE.md` and `claude/snippets/`.

- If the advice already exists and the new text adds nothing useful: cite the overlap in the note and do not create a new file.
- If it adds something (an exception, a better example, a version restriction): edit the existing artifact (in both languages), record the additional source (`NNN` + URL) and explain what changed.
- Do not keep two artifacts that teach the same thing under different names.

## 7. Classify the artifact type

Use the tables below (the first is based on [Extend Claude Code](https://code.claude.com/docs/en/features-overview) and the [best practices](https://code.claude.com/docs/en/best-practices)). The "Where to write in the package" column is the path **in this repository** (pt-BR; the en-US version goes to the same relative path under `en-us/`, with English names). The install destination is a separate, mandatory field, declared in the artifact itself.

**Claude Code** (folder `claude/`; destination `projeto` or `usuario`):

| If the insight is… | Write it as… | Where to write in the package |
| --- | --- | --- |
| A short fact or rule that must hold in **every** session (build command, convention, "always do X") and that Claude **cannot** discover by reading the repo | `CLAUDE.md` snippet | `claude/snippets/` and, if it belongs in the starter, a candidate for `claude/CLAUDE.md` |
| An instruction that applies only to certain paths or file types | Rule | `claude/rules/<name>.md` with `paths` frontmatter |
| A multi-step procedure, checklist, long reference material or a flow invoked with `/name` | Skill | `claude/skills/<name>/SKILL.md` |
| An old single-Markdown-file shortcut (avoid for new work) | Command | `claude/commands/<name>.md` |
| Work that should run isolated (research, review, extraction) and return a summary | Subagent | `claude/agents/<name>.md` |
| Tone, role or format of **every** response in the session | Output style | `claude/output-styles/<name>.md` |
| Something that **must** always happen or be blocked, without depending on the model | Hook and/or `permissions.deny` | script in `claude/hooks/` + block in `claude/settings/` |
| A connection to an external tool (issue tracker, browser, API) | MCP | adapt [`templates/mcp.json`](templates/mcp.json); the project config goes in `.mcp.json` (document the install; do not mix it blindly with `settings.json`) |
| A reusable set of several of the items above to distribute | Plugin (only if there really is a package) | document in the index; do not invent a manifest without need |
| Not actionable, a duplicate or serves neither Claude Code nor the Claude app | None | only the record in the note, with the reason |

**Claude app** (folder `claude-app/`; destination `app-claude`, `projeto-claudeai` or `configuracoes`; template [`templates/claude-app-artifact.md`](templates/claude-app-artifact.md)):

| If the insight is… | Write it as… | Where to write in the package (pt-BR / en-US) | Destination |
| --- | --- | --- | --- |
| How to use an app feature: requirements, version, plans, steps, permissions, limits, good practices | Usage guide | `claude-app/guias/<name>.md` / `en-us/claude-app/guides/` | `app-claude` |
| Fixed context or response rules for the conversations of a claude.ai Project | Project instruction | `claude-app/projetos/<name>.md` / `en-us/claude-app/projects/` | `projeto-claudeai` |
| Tone, style or response preference for every conversation of the account | Style or preference | `claude-app/estilos/<name>.md` / `en-us/claude-app/styles/` | `configuracoes` |
| Reusable text to paste into a conversation | Prompt | `claude-app/prompts/<name>.md` / `en-us/claude-app/prompts/` | `app-claude` |
| An app setting (turn on a feature, permissions, connectors; or an owner control on Team/Enterprise) | Setting | `claude-app/configuracoes/<name>.md` / `en-us/claude-app/settings/` | `configuracoes` |

Tie-breakers:

- Torn between `CLAUDE.md` and a skill: a procedure or material that only matters sometimes becomes a skill (the body only enters the context when used).
- Torn between a skill and a hook: if "almost always" is not enough, make it a hook or `deny`.
- Prefer a skill to a standalone command for new work.
- Personal preferences (tone, shortcuts, his own MCP) tend toward `usuario`; a repository's conventions and hooks tend toward `projeto`.
- A feature that exists only in the app (Claude Desktop, artifacts, claude.ai Projects) goes to `claude-app/`; a CLI, IDE or Code-tab feature goes to `claude/`. If one product's official docs do not cover the other (for example, installing an artifact published by Claude Code as an app), record the gap in the note and do not claim it can or cannot be done.
- Do not write an artifact "just to have a file".

## 8. Write the artifact

1. Start from the type's template in [`templates/`](templates/) (pt-BR: [`templates/`](../templates/)).
2. Write into `claude/` (Claude Code) or `claude-app/` (Claude app), in the right subfolder. Names in kebab-case ASCII.
3. Declare the **install destination** (`projeto` or `usuario` in `claude/`; `app-claude`, `projeto-claudeai` or `configuracoes` in `claude-app/`, in a line right below the title) in the right place for the type — see the table in [`templates/README.md`](templates/README.md). Do not invent a frontmatter key Claude Code ignores or rejects (in rules, only `paths`; in subagents, the destination goes in the body, not in an unofficial `metadata`).
4. Be short and verifiable ("run `npm test` before committing", not "test your changes").
5. Cite the source in the file: number `NNN`, URL and access date. In skills and commands, use the `metadata` frontmatter (an official field). In agents, put the citation in the body. In `claude-app/`, use the template's HTML comment (source, URL, access, official pages checked and whether it was tested).
6. Examples must be minimal and valid. YAML frontmatter must start on the first line (`---`). Invalid YAML or an unknown key makes Claude Code ignore fields.
7. `claude-app/` artifacts have no copy in `.claude/`: the Claude app does not read this repository. If the Claude Code artifact must also load in this repository (a skill, agent or style used in the pipeline itself), update the matching copy in `.claude/` and keep both identical. The canonical installable package is always `claude/`. This does **not** replace the `destino` field: this repo's `.claude/` bridge is not the install in Alexandre's project.
8. Do not replace, in the target project, a `CLAUDE.md` or `settings.json` that is already tuned: here we only prepare the package for selective copying or merging. Each type's README in `claude/` must keep explaining where to copy.
9. Do not paste substantial text from a copyrighted article.
10. **Two languages.** Every new or changed installable artifact ships in pt-BR (in `claude/` or `claude-app/`) and in US English, at the same relative path under `en-us/claude/` or `en-us/claude-app/`. In the en-US version:
    - the skill, agent and style `name` is an English kebab-case ASCII name, **different** from the pt-BR one (`usar-opusplan` → `use-opusplan`), so both versions can coexist in `~/.claude/`; supporting files and examples also get English names (`modelos.md` → `templates.md`, `*.exemplo.json` → `*.example.json`);
    - the content is the same (same steps, caveats, citation and official check), with nothing added or cut; in skills, `metadata.mirror-of` points to the pt-BR name and the destination goes in `metadata.destination` (`project` or `user`); in the app, the destination values stay `app-claude`, `projeto-claudeai` and `configuracoes`;
    - links to notes and process files point to the en-US equivalents in `en-us/` (map in `README.md`); only what has no en-US version points to the pt-BR original.
11. **How to use.** Update [`USO.md`](../USO.md) and [`USAGE.md`](USAGE.md): the source's section (what it does, where to install with the copy command, how to invoke, how to test) and the pt-BR ↔ en-US name map.

## 9. Validate

Mechanical validation (mandatory before closing the source):

- Markdown with frontmatter: the first line is `---`; field names match the type's official table (see `references/official-practices.md`).
- The install destination is declared and is `projeto` or `usuario` (in `claude/`), or `app-claude`, `projeto-claudeai` or `configuracoes` (in `claude-app/`).
- In `claude-app/`, relative links and cited official URLs open (check them one by one) and the header has the official check date and whether it was tested.
- JSON (`settings`, hook blocks, MCP): `python3 -m json.tool path/file.json` must exit without error.
- Hook script: `bash -n path/script.sh` (or equivalent) and the execute bit (`chmod +x`) on macOS/Linux.
- Folder/file names in kebab-case ASCII, not colliding with an existing skill or agent, **in either language** (the en-US `name` cannot repeat a pt-BR one nor another en-US one).
- Both languages are present and equivalent: same relative path under `en-us/`, same frontmatter fields, valid JSON in both, relative links working in both.
- `CLAUDE.md` snippets: keep within the spirit of the official target (short final file, preferably under 200 lines).

Validation in Claude Code: validate both versions (each can be tested alone; to compare them, follow "How to compare pt-BR and en-US" in `USAGE.md`). Copy, or use `--add-dir` / `/add-dir` on this repository, check with `/context`, `/doctor`, `/hooks` or `/mcp` depending on the type, and try invoking the skill or the agent. **If the artifact has not yet been tested in a Claude Code session, the source stays `parcial` until the test.** The mechanical check alone does not authorize `publicado`.

Validation in the Claude app (`claude-app/` artifacts): follow the artifact's own steps in the app, on the version and plan it requires, and record how and on which version it was tested. **Without that test, the source stays `parcial`.** A source with theme `ambos` only reaches `publicado` with both tests.

## 10. Record and close the source

1. Complete `fontes/NNN-slug.md`: insights, artifacts (with destination), duplicates, divergences, conflicts with both sides visible, open items and status.
2. Update the row in `fontes/INDICE.md` (theme, summary, artifacts produced, status). In the artifacts column, list the pt-BR path; the en-US mirror is implied and appears in the name map in `USO.md`.
3. Check that `USO.md` and `en-us/USAGE.md` have the source's section. A source with an installable artifact does not close without the "how to use" in both languages.
4. **Notes and process in two languages.** Write the en-US note in `en-us/sources/NNN-english-slug.md` (same number, equivalent content, links pointing to the en-US equivalents) and the matching row in `en-us/sources/INDEX.md`. If the cycle changed a process file (`GUIA-ANALISE-SITE.md`, `CONTEXTO.md`, `PROCESSO.md`, `templates/`, `referencias/praticas-oficiais.md`, root `CLAUDE.md`), update the en-US equivalent listed in `en-us/README.md` in the same commit.
5. If a new convention or premise appeared, update the diary — and, if needed, the Premises section — in `CONTEXTO.md` (and `en-us/CONTEXT.md`).
6. Choose the status:
   - `publicado` — note and artifacts (if any) written, tested in Claude Code or the Claude app (depending on the theme), committed to `main` and **already pushed to GitHub**;
   - `parcial` — something useful was written, but something is pending (incomplete page, test in Claude Code or the Claude app not done yet, push pending, classification doubt);
   - `descartado` — the site yielded no artifact for either Claude Code or the Claude app; the note explains why. Reserve the number and **commit the note and the index** anyway.

## 11. Commit

On the `main` branch, message in **pt-BR**.

- A single source: one commit.
- Several links in the same request: **a single commit for the batch**.
- A discarded source: goes into the commit (the batch's or its own), with the note and the index.

Examples (kept in pt-BR, as the real messages are):

```text
Adiciona fonte 003 (título curto) e skill foo

Lê <url> e extrai o fluxo de /foo como skill, conferido na doc de skills.
```

```text
Adiciona fontes 003–005 (títulos curtos)

Processa o lote: skill foo (003, usuario), regra bar (004, projeto) e descarte de 005.
```

```text
Registra fonte 006 (título curto) como descartada

A página não traz insight acionável além do que já está no starter.
```

If the source only produces a minimal fix to an existing artifact, the message must say so. The agreed way of working is a direct commit to `main`, followed by a push. **Without the GitHub push, no source goes to `publicado`.** If the push is pending, the status stays `parcial` (or `descartado`, if that is the case) and the report makes the push explicit.

## 12. Final report for Alexandre

Close the cycle with a short report in this format (for a batch, one block per source, plus a line at the top listing the batch and the commit). The report is written in pt-BR; the field names below are the English equivalents of the pt-BR template in the canonical guide:

```text
Source NNN — <title>
URL: <canonical>
Tema: claude-code | claude-app | ambos
Accessed: YYYY-MM-DD HH:MM (America/Sao_Paulo)
Credibility: <official | community | marketing>, published/updated on <date or "no date">, cited version <if any>

What it yielded:
- <artifact path> (en-US: <mirror path>) — destination: projeto | usuario | app-claude | projeto-claudeai | configuracoes — <one line on what it does and how to install or use it>

What it did not yield (and why):
- <discarded insight, ignored Cursor/other-agent passage that serves neither Claude Code nor the Claude app, or page not read>

Official check: <ok / divergence (summary of both sides) / repo summary updated>
Conflicts between sources: <none / both sides, in 2–4 lines, no silent choice>
Duplicates: <none / merged into artifact X>
Test (Claude Code and/or Claude app): <done (how, on which version) | not done — source stays parcial>
GitHub push: <done (SHA/link) | pending — source does not go to publicado>
Index status: publicado | parcial | descartado
Open items: <none, or test, push, paywall, etc.>

How to use: <one or two lines with the destination and the install or usage path>
```

Do not anticipate the next request. If the batch still has a `parcial` source, say what is missing for each one.

## Closing checklist

- [ ] Canonical URL, number and slug reserved in the index (`em andamento` at the start); a batch with one number per link
- [ ] Note `fontes/NNN-slug.md` created from the template
- [ ] Main page read; extras justified and listed; blocks recorded without invention
- [ ] Theme set (`claude-code`, `claude-app` or `ambos`); from neighboring links, only what serves Claude Code or the Claude app was extracted
- [ ] Credibility and date (author, outlet, recency, version) recorded
- [ ] Insights filtered by the question "does it change the use of Claude Code or the Claude app?"
- [ ] Path and frontmatter checked against the current official docs
- [ ] Conflicts between sources described with both sides visible (note and report)
- [ ] Duplicate searched in `claude/`, `claude-app/` and the index; merge recorded if any
- [ ] Type chosen from the classification table; template used
- [ ] Install destination declared in the artifact (`projeto` or `usuario` in `claude/`; `app-claude`, `projeto-claudeai` or `configuracoes` in `claude-app/`)
- [ ] Source cited in the artifact; copy in `.claude/` updated if the pipeline here depends on it
- [ ] en-US version written in `en-us/` with a non-colliding English `name` and content equivalent to the pt-BR one
- [ ] Source section and name map updated in `USO.md` and `en-us/USAGE.md` (what it does, install, invocation, test)
- [ ] JSON / frontmatter / hook validated mechanically
- [ ] Test done in Claude Code (`claude/`) or the Claude app (`claude-app/`); if not, status `parcial`
- [ ] Index (with the `Tema` column) and note closed with the correct status; `CONTEXTO.md` diary updated if appropriate
- [ ] en-US note in `en-us/sources/` and row in `en-us/sources/INDEX.md`; changed process files with their en-US equivalent updated in the same commit
- [ ] Commit to `main` (one per single source, or one for the batch), including discards
- [ ] GitHub push done before marking `publicado`
- [ ] Report in the section 12 format sent to Alexandre
