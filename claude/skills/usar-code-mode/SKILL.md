---
name: usar-code-mode
description: >
  Liga e usa o Code Mode experimental do Claude Code, em que o Claude
  escreve JavaScript que encadeia várias tool calls num só passo.
  Use ao falar de Code Mode, CLAUDE_CODE_EXPERIMENTAL_CODE_MODE,
  tool calls em lote, ou tarefas com muitas chamadas relacionadas.
when_to_use: >
  O usuário quer ligar o Code Mode, pergunta se vale a pena, menciona
  JavaScript encadeando Bash/Read/Edit/MCP, ou vai fazer uma mudança
  repetida em muitos arquivos, uma busca com filtro, ou comandos em paralelo.
argument-hint: ""
allowed-tools: Read Grep Glob
metadata:
  destino: usuario
  fonte: "002"
  url: "https://www.marktechpost.com/2026/11/17/anthropic-claude-code-code-mode-javascript-tool-calls/"
  acesso: "2026-11-25"
---

# Usar o Code Mode (experimental)

**Destino de instalação:** `usuario` (`~/.claude/skills/usar-code-mode/`).

O Code Mode é **experimental**, vem **desligado** por padrão e pode mudar ou sumir em qualquer release. Procedimento conferido na documentação oficial vigente ([Code Mode](https://code.claude.com/docs/en/code-mode), [changelog](https://code.claude.com/docs/en/changelog)). A fonte 002 (MarkTechPost, 17 de novembro de 2026) resume o lançamento; onde o artigo e o oficial divergem (provedores de nuvem e telemetria), **siga o oficial da sua versão**.

## Quando usar

Tarefas com muitas tool calls relacionadas, por exemplo:

- uma mudança que se repete em vários arquivos;
- uma busca cujos resultados precisam de filtro antes de o Claude ler o conteúdo;
- vários comandos independentes que podem rodar ao mesmo tempo.

Não ligue só “para economizar tokens”: a Anthropic **não** publica cifra oficial de economia no Code Mode do CLI.

## Como ligar

Requisitos mínimos: Claude Code **v2.1.323** ou posterior, **build nativo**, sessão **interativa no terminal**. No Windows, é preciso ter Git for Windows. Modelos: Opus 5.5, Sonnet 5.5, Haiku 5.5 ou Fable 5.2. Confira `claude --version` e, se precisar, `claude update`.

**Nesta sessão** (macOS, Linux, WSL):

```bash
CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1 claude
```

No PowerShell: `$env:CLAUDE_CODE_EXPERIMENTAL_CODE_MODE = "1"` e depois `claude`.

**Default pessoal** (todas as sessões novas): mescle o bloco `env` em `~/.claude/settings.json` — veja `claude/settings/code-mode.exemplo.json`. A documentação oficial diz que essa variável **é ignorada** nos settings de um projeto: um repositório clonado não consegue ligar o Code Mode por você.

Na primeira vez, confirme “Yes, turn on Code Mode”. A sessão deve mostrar `Code Mode (experimental) is on`. Para retomar (`--continue` / `--resume`), a variável precisa continuar `1`; com ela em `0` ou ausente, o Claude Code recusa retomar uma sessão de Code Mode.

Um `0` em qualquer lugar (shell, settings de usuário, `--settings` ou managed settings) **desliga**, mesmo com `1` em outro. Administradores podem bloquear com `0` nos managed settings; não podem forçar o recurso ligado.

Se um subagente tiver lista `tools:`, inclua `REPL` para ele usar o Code Mode.

## Como acompanhar e os limites

- No chat você vê as tool calls (por exemplo o diff), não o JavaScript. Para ler o código: `Ctrl+O`, expandir a linha Code, `Ctrl+O` de novo para voltar.
- Código em que o Claude **espera** para aos **10 minutos**. A partir da v2.1.328, no Manual e no `acceptEdits`, o tempo no prompt de permissão não conta nesse limite.
- Em **background** pode rodar até **2 horas** enquanto você continua conversando. A sessão precisa ter começado em auto ou `bypassPermissions`.
- No **auto mode**, o classificador revê cada pedaço de código, não cada tool call, e **não vê** valores calculados em tempo de execução (por exemplo um caminho vindo de uma busca). Mantenha regras `deny`/`ask` e hooks `PreToolUse` no nome usual da ferramenta (`Bash`, ferramenta MCP, etc.). Para inspecionar o JavaScript, hook em `REPL` lendo `tool_input.code`.
- Chamadas MCP e web a partir do código existem na doc oficial; o sandbox cobre os comandos de shell, não o JavaScript nem essas chamadas.

## Disponibilidade (siga a sua versão, não só o artigo)

A fonte 002, escrita na semana do lançamento (v2.1.323), dizia “só assinatura ou Console Anthropic” e listava OTEL/`DISABLE_TELEMETRY` como bloqueio. O oficial vigente é outro em pontos importantes:

- **v2.1.331+:** Code Mode também em sessões de terminal no Amazon Bedrock, Google Cloud's Agent Platform, Microsoft Foundry e Claude Platform on AWS. Continua sem gateway e sem Claude for Government.
- **v2.1.329+:** compatível com eventos/métricas OpenTelemetry e com feature flags/`DISABLE_TELEMETRY` desligados. O **tracing** OpenTelemetry e o **API key helper** numa conexão direta com a Anthropic ainda impedem a inicialização.
- Superfície documentada: terminal interativo. A doc oficial exclui explicitamente o painel do VS Code, o app Desktop e sessões na nuvem. Organizações com configuração HIPAA ou zero data retention não usam o recurso.

## Como desligar

Tire `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE` do shell e de `~/.claude/settings.json`, ou ponha o valor `0`, e comece uma sessão nova.

## O que não fazer

- Não trate os números de tokens do artigo (teste de terceiros 11,1k vs 24,6k, ou os 98,7% / 37% de **outros** produtos da Anthropic) como economia oficial do Code Mode do CLI.
- Não coloque a variável no `.claude/settings.json` de um projeto: o Claude Code ignora.
- Não assuma que o classificador do auto mode vê o caminho que o código calcular em tempo de execução.
