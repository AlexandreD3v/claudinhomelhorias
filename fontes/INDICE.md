# Índice de fontes

Cada site processado ganha um número sequencial, uma nota em `fontes/NNN-slug.md` e uma linha nesta tabela. Modelo da nota: [`templates/fonte.md`](../templates/fonte.md).

Status possíveis: `em andamento`, `publicado` (só depois do push no GitHub e do teste no Claude Code ou no app Claude, conforme o tema), `parcial`, `descartado` (definidos em [`PROCESSO.md`](../PROCESSO.md)). O passo a passo da análise está em [`GUIA-ANALISE-SITE.md`](../GUIA-ANALISE-SITE.md).

Datas na coluna “Acesso” estão no fuso **America/Sao_Paulo**.

Coluna `Tema`: `claude-code` (artefatos em [`claude/`](../claude/)), `claude-app` (artefatos em [`claude-app/`](../claude-app/)) ou `ambos`. Só se descarta o que não serve a nenhum dos dois.

| # | Acesso | URL | Título | Tema | Resumo | Artefatos | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 001 | 2026-11-25 22:03 | https://www.xda-developers.com/i-stopped-hitting-claudes-usage-limits-after-changing-one-habit-in-how-i-start-sessions/ | I stopped hitting Claude's usage limits after changing one habit in how I start sessions | claude-code | Artigo da XDA sobre esticar o plano Pro com o alias `opusplan` (Opus no plano, Sonnet na execução). Título fala em hábito de início de sessão, mas o corpo não ensina `/clear`. | `claude/skills/usar-opusplan/SKILL.md` (usuario); `claude/settings/opusplan.exemplo.json` (usuario, opcional) | parcial |
| 002 | 2026-11-25 23:16 | https://www.marktechpost.com/2026/11/17/anthropic-claude-code-code-mode-javascript-tool-calls/ | Anthropic Adds Code Mode to Claude Code: Claude Now Chains Tool Calls in JavaScript | claude-code | Resumo do Code Mode experimental (v2.1.323+): Claude escreve JavaScript que encadeia várias tool calls. A disponibilidade em provedores de nuvem e telemetria do artigo (17/11) já está desatualizada em relação à doc oficial vigente. | `claude/skills/usar-code-mode/SKILL.md` (usuario); `claude/settings/code-mode.exemplo.json` (usuario, opt-in) | parcial |
| 003 | 2026-11-26 08:20 | https://9to5mac.com/2026/11/24/anthropic-just-gave-claude-users-a-new-way-to-make-mac-apps/ | Anthropic just gave Claude users a new way to make Mac apps | claude-app | Artigo da 9to5Mac sobre o beta “Install as app” no Claude para Mac e Windows (artifacts viram apps de mesa). Fora do Claude Code, mas dentro do escopo do app Claude: reprocessada com a doc oficial e virou guia. | `claude-app/guias/instalar-artifact-como-app.md` (app-claude) | parcial |
| 004 | 2026-11-26 08:38 | https://www.xda-developers.com/cut-claude-token-use-in-half-moving-instructions-out-of-main-session/ | I cut my Claude token use in half by moving instructions out of the main session | claude-code | Relato da XDA: CLAUDE.md enxuto, CLAUDE.md por pasta, skills e subagentes para tirar instrução e ruído da sessão principal. O oficial confirma o núcleo, mas `@` import não economiza contexto e o "metade" do título não é medido. | `claude/skills/enxugar-contexto/SKILL.md` (usuario); acréscimos no starter `claude/CLAUDE.md` | parcial |
| 005 | 2026-11-26 08:38 | https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/ | I stopped choosing between Claude Code, Codex, and Antigravity, and one shared folder lets them pick up each other's work | claude-code | Relato da XDA: AGENTS.md compartilhado, HANDOFF.md e DECISIONS.md numa pasta que vários agentes abrem. Do artigo só entra o que serve ao Claude Code; o oficial já lê AGENTS.md sozinho desde a v2.1.277. | `claude/snippets/compartilhar-agents-md.md` (projeto); `claude/skills/registrar-handoff/` (projeto) | parcial |

Os caminhos da coluna Artefatos são os pt-BR. Cada artefato instalável tem espelho en-US em `en-us/` (nome em inglês); a tabela de nomes e o “como usar” por fonte estão em [`USO.md`](../USO.md) e [`en-us/USAGE.md`](../en-us/USAGE.md).

Próximo número livre: **006**.
