---
name: usar-skills-pelo-mcp
description: >
  Usa skills, Tasks e Elicitation enviados por um servidor ou conector MCP
  no Claude Code, sem copiar a skill para ~/.claude/skills. Use ao falar de
  Skills over MCP, skill de conector, /servidor:skill, MCP task ou diálogo
  de elicitation.
when_to_use: >
  O usuário conectou um servidor MCP ou um conector que publica skills,
  pergunta como invocar uma skill do servidor, precisa acompanhar um MCP
  task em /tasks, ou um servidor pediu input no meio da chamada.
argument-hint: ""
metadata:
  destino: usuario
  fonte: "006"
  url: "https://claude.com/resources/articles/skills-over-mcp-tasks-and-more"
  acesso: "2026-11-26"
---

# Usar skills pelo MCP

**Destino de instalação:** `usuario` (`~/.claude/skills/usar-skills-pelo-mcp/`).

Fluxo conferido no artigo oficial da fonte 006 (Anthropic, 24 de novembro de 2026) e na documentação vigente em 26 de novembro de 2026: [Skills from MCP servers](https://code.claude.com/docs/en/skills#skills-from-mcp-servers), [Use skills from MCP servers](https://code.claude.com/docs/en/mcp#use-skills-from-mcp-servers), [MCP tasks](https://code.claude.com/docs/en/mcp#mcp-tasks-that-run-on-the-server), [Elicitation](https://code.claude.com/docs/en/mcp#respond-to-mcp-elicitation-requests) e o [changelog](https://code.claude.com/docs/en/changelog). Onde o artigo e o oficial divergem, **siga o oficial da sua versão**. Não foi testado neste checkout.

## Requisitos

- Claude Code **v2.1.331+** segundo a doc; o changelog anuncia Skills over MCP (beta) na **v2.1.332** (formato `servidor:skill` no menu `/`). Confira `claude --version`.
- Sessão interativa no terminal (ou sessão local no Desktop, aba Code). VS Code está em rollout.
- Planos com `/login`: Pro, Max e Ultra **ligadas**. Team e Enterprise **desligadas** até um admin ligar (Owner em Organization settings > Connectors; a setting de Skills da organização também precisa estar ligada). O artigo ainda diz “em breve no Enterprise”; a [tabela oficial](https://code.claude.com/docs/en/feature-availability) já lista Enterprise como *Admin-enabled*.
- Modelo: Fable, ou Opus 4.8, Sonnet 5, Haiku 5.5 ou posterior, com conexão direta à Anthropic e feature flags. Sem isso, ou em nuvem, `claude -p`, SDK, GitHub Actions, HIPAA/ZDR, provedor de nuvem ou `ANTHROPIC_BASE_URL` customizado, as skills MCP **não valem**.

## Skills do servidor

1. Não copie a skill do servidor para `~/.claude/skills/` nem para `.claude/skills/`: ela atualiza com o servidor.
2. Confira `/mcp` (servidor conectado, revisão 2026-07-28 ou posterior ajuda) e `/skills` ou o menu `/`. O nome é `servidor:skill`. Conector: `claude_ai_Nome:skill`. Plugin: `plugin_plugin_servidor:skill` (espaços e pontuação no nome do servidor, salvo `-`, viram `_`).
3. Invoque com `/servidor:skill` e argumentos, ou peça ao Claude. Digitar o comando no prompt não pede aprovação.
4. Em auto mode, o classificador decide se carrega a skill, sem lê-la. Em Manual ou acceptEdits, aparece um prompt; “Allow this version” vale até o servidor mudar os arquivos. Regra `deny`/`ask`/`allow` `Skill(mcp__servidor__*)` no `/permissions` (v2.1.331+).
5. Limite: até 100 skills por servidor. Campos de skill local que o Claude Code **ignora** numa skill MCP: `allowed-tools`, `disallowed-tools`, `hooks`, `model`, `effort`, `context`, `agent`, `background`, `shell`, `paths`, `metadata`, comandos `!`, `@` e substituições `${CLAUDE_PROJECT_DIR}` / `${CLAUDE_SESSION_ID}`.
6. Só adicione servidores em que você confia: a skill pode mandar o Claude rodar código, e o servidor pode mudá-la a qualquer momento.

## Tasks

MCP task (servidor roda o trabalho, v2.1.304+): a tool call devolve logo, o Claude segue, o rodapé mostra `N MCP task`. Acompanhe ou pare em `/tasks` (tecla `x`). O resultado vai para o Claude, não para o transcript: peça o resultado. Task de servidor remoto sobrevive ao sair; retome a **mesma** sessão. `Esc` não cancela a task. Não confundir com o background automático de uma tool call lenta (2 minutos, morre ao sair).

O artigo coloca Tasks como disponibilidade geral para Pro, Max e Ultra, em rollout para Team e Enterprise. A doc de MCP não repete essa divisão por plano: confira o seu.

## Elicitation

Se o servidor pedir input no meio da chamada, aparece um diálogo (form: preencha; URL: abra o link). Recusar é uma resposta. Com `/tasks` aberto o diálogo fica escondido: feche `/tasks` para responder. Para responder depois (v2.1.324+), `Esc` no diálogo e reabra pelo detalhe da task em `/tasks`.

## File Uploads

Ainda em rollout (artigo) / beta com requisitos estreitos na [doc de conectores](https://claude.com/docs/connectors/building/files). Não trate como recurso geral nesta skill.

## O que não fazer

- Não prometa a cifra de “mais de 85%” de contexto do artigo: a doc oficial do Claude Code descreve o tool search sem percentual.
- Não use esta skill para implementar a extensão no servidor; aponte a doc oficial.
