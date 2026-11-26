# Índice de fontes

Cada site processado ganha um número sequencial, uma nota em `fontes/NNN-slug.md` e uma linha nesta tabela. Modelo da nota: [`templates/fonte.md`](../templates/fonte.md).

Status possíveis: `em andamento`, `publicado` (só depois do push no GitHub e do teste no Claude Code), `parcial`, `descartado` (definidos em [`PROCESSO.md`](../PROCESSO.md)). O passo a passo da análise está em [`GUIA-ANALISE-SITE.md`](../GUIA-ANALISE-SITE.md).

Datas na coluna “Acesso” estão no fuso **America/Sao_Paulo**.

| # | Acesso | URL | Título | Resumo | Artefatos | Status |
| --- | --- | --- | --- | --- | --- | --- |
| 001 | 2026-11-25 22:03 | https://www.xda-developers.com/i-stopped-hitting-claudes-usage-limits-after-changing-one-habit-in-how-i-start-sessions/ | I stopped hitting Claude's usage limits after changing one habit in how I start sessions | Artigo da XDA sobre esticar o plano Pro com o alias `opusplan` (Opus no plano, Sonnet na execução). Título fala em hábito de início de sessão, mas o corpo não ensina `/clear`. | `claude/skills/usar-opusplan/SKILL.md` (usuario); `claude/settings/opusplan.exemplo.json` (usuario, opcional) | parcial |
| 002 | 2026-11-25 23:16 | https://www.marktechpost.com/2026/11/17/anthropic-claude-code-code-mode-javascript-tool-calls/ | Anthropic Adds Code Mode to Claude Code: Claude Now Chains Tool Calls in JavaScript | Resumo do Code Mode experimental (v2.1.323+): Claude escreve JavaScript que encadeia várias tool calls. A disponibilidade em provedores de nuvem e telemetria do artigo (17/11) já está desatualizada em relação à doc oficial vigente. | `claude/skills/usar-code-mode/SKILL.md` (usuario); `claude/settings/code-mode.exemplo.json` (usuario, opt-in) | parcial |

Próximo número livre: **003**.
