# en-US version

US English mirror of this repository: the installable packages, the analysis notes and the process files. pt-BR stays canonical and in its original place; this folder has the same content with English file names. Start with [`USAGE.md`](USAGE.md) (what each artifact does, how to install, invoke and test, name map and how to compare with pt-BR). Repository overview in English: [`../README.en-US.md`](../README.en-US.md).

## Path map

| pt-BR (canonical) | en-US |
| --- | --- |
| [`claude/`](../claude/) | [`claude/`](claude/) — Claude Code package (skill/agent/style names in [`USAGE.md`](USAGE.md#name-map)) |
| [`claude-app/`](../claude-app/) (`guias/`) | [`claude-app/`](claude-app/) (`guides/`) — Claude app package |
| [`USO.md`](../USO.md) | [`USAGE.md`](USAGE.md) |
| [`fontes/README.md`](../fontes/README.md) | [`sources/README.md`](sources/README.md) |
| [`fontes/INDICE.md`](../fontes/INDICE.md) | [`sources/INDEX.md`](sources/INDEX.md) |
| [`fontes/001-xda-limites-uso-sessoes.md`](../fontes/001-xda-limites-uso-sessoes.md) | [`sources/001-xda-usage-limits-sessions.md`](sources/001-xda-usage-limits-sessions.md) |
| [`fontes/002-marktechpost-code-mode.md`](../fontes/002-marktechpost-code-mode.md) | [`sources/002-marktechpost-code-mode.md`](sources/002-marktechpost-code-mode.md) |
| [`fontes/003-9to5mac-install-as-app.md`](../fontes/003-9to5mac-install-as-app.md) | [`sources/003-9to5mac-install-as-app.md`](sources/003-9to5mac-install-as-app.md) |
| [`fontes/004-xda-instrucoes-fora-da-sessao.md`](../fontes/004-xda-instrucoes-fora-da-sessao.md) | [`sources/004-xda-instructions-out-of-session.md`](sources/004-xda-instructions-out-of-session.md) |
| [`fontes/005-xda-pasta-compartilhada-handoff.md`](../fontes/005-xda-pasta-compartilhada-handoff.md) | [`sources/005-xda-shared-handoff-folder.md`](sources/005-xda-shared-handoff-folder.md) |
| [`fontes/006-anthropic-skills-pelo-mcp.md`](../fontes/006-anthropic-skills-pelo-mcp.md) | [`sources/006-anthropic-skills-over-mcp.md`](sources/006-anthropic-skills-over-mcp.md) |
| [`GUIA-ANALISE-SITE.md`](../GUIA-ANALISE-SITE.md) | [`SITE-ANALYSIS-GUIDE.md`](SITE-ANALYSIS-GUIDE.md) |
| [`CONTEXTO.md`](../CONTEXTO.md) | [`CONTEXT.md`](CONTEXT.md) |
| [`PROCESSO.md`](../PROCESSO.md) | [`PROCESS.md`](PROCESS.md) |
| [`templates/`](../templates/) (`fonte.md`, `agente.md`, `comando.md`, `regra.md`, `trecho-claude-md.md`, `artefato-claude-app.md`) | [`templates/`](templates/) (`source.md`, `agent.md`, `command.md`, `rule.md`, `claude-md-snippet.md`, `claude-app-artifact.md`; other names unchanged) |
| [`referencias/praticas-oficiais.md`](../referencias/praticas-oficiais.md) | [`references/official-practices.md`](references/official-practices.md) |
| [`CLAUDE.md`](../CLAUDE.md) (root) | [`CLAUDE.en-US.md`](CLAUDE.en-US.md) — not named `CLAUDE.md` on purpose: a `CLAUDE.md` in a subfolder loads on demand and would duplicate the repository instructions in the session |
| [`README.md`](../README.md) | [`../README.en-US.md`](../README.en-US.md) |

Not mirrored: the `.claude/` bridge (it only loads the pt-BR pipeline skill, agent and style in this checkout) and `.gitignore`.

Keys kept in pt-BR in both languages, because the index uses them: statuses (`em andamento`, `publicado`, `parcial`, `descartado`), theme `ambos`, artifact types (`trecho-claude-md`, `guia-app`, …) and the Claude app destinations (`app-claude`, `projeto-claudeai`, `configuracoes`). Claude Code destinations are `project` / `user` here and `projeto` / `usuario` in pt-BR.

To share only the English version, this folder is enough; its links point to en-US files, except the explicit "pt-BR original" cross-references.
