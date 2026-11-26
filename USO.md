# Como usar os artefatos (pt-BR)

Guia curto para quem só quer instalar e usar, sem ler as notas de análise. Uma seção por fonte: o que faz, onde instalar (com o comando de cópia), como invocar e como testar. A versão em inglês, com os mesmos artefatos traduzidos, está em [`en-us/USAGE.md`](en-us/USAGE.md).

Nada aqui foi testado ainda no Claude Code nem no app Claude: todas as fontes estão `parcial` no [índice](fontes/INDICE.md). Se um passo não funcionar como descrito, anote a versão (`claude --version`) e avise.

Os comandos supõem o repositório clonado em `~/claudinhomelhorias`:

```bash
REPO=~/claudinhomelhorias
```

Destino `usuario` = `~/.claude/` (todos os seus projetos). Destino `projeto` = `.claude/` na raiz do projeto (vai para o git). No Windows, `~/.claude` é `%USERPROFILE%\.claude`.

## Tabela de nomes pt-BR ↔ en-US

Os nomes em inglês são diferentes de propósito: as duas versões podem ficar instaladas juntas em `~/.claude/` sem colisão. Para comparar o uso, porém, veja a seção [Como comparar pt-BR e en-US](#como-comparar-pt-br-e-en-us).

| Fonte | Tipo | pt-BR (`claude/`, `claude-app/`) | en-US (`en-us/claude/`, `en-us/claude-app/`) |
| --- | --- | --- | --- |
| 001 | skill | `usar-opusplan` | `use-opusplan` |
| 001 | settings | `settings/opusplan.exemplo.json` | `settings/opusplan.example.json` |
| 002 | skill | `usar-code-mode` | `use-code-mode` |
| 002 | settings | `settings/code-mode.exemplo.json` | `settings/code-mode.example.json` |
| 003 | guia do app | `guias/instalar-artifact-como-app.md` | `guides/install-artifact-as-app.md` |
| 004 | skill | `enxugar-contexto` | `trim-context` |
| 004 | starter | `CLAUDE.md` (acréscimos) | `CLAUDE.md` |
| 005 | snippet | `snippets/compartilhar-agents-md.md` | `snippets/share-agents-md.md` |
| 005 | skill | `registrar-handoff` (+ `modelos.md`) | `write-handoff` (+ `templates.md`) |
| 006 | skill | `usar-skills-pelo-mcp` | `use-mcp-skills` |
| 006 | guia do app | `guias/skills-pelo-mcp.md` | `guides/skills-over-mcp.md` |
| repo | skill | `processar-fonte` | `process-source` |
| repo | subagente | `extrator-fonte` | `source-extractor` |
| repo | estilo de saída | `conciso-ptbr` | `concise-en-us` |
| repo | settings | `settings/settings.exemplo.json` | `settings/settings.example.json` |
| repo | hook | `hooks/exemplo.sh`, `hooks/bloco-exemplo.json` | `hooks/example.sh`, `hooks/example-block.json` |

## Fonte 001 — opusplan para esticar a cota

- **O que faz:** a skill `usar-opusplan` ensina a usar o alias `opusplan`: o Opus planeja no plan mode e o Sonnet executa depois da aprovação, com as ressalvas oficiais (cache, limites compartilhados).
- **Instalar (usuario):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/claude/skills/usar-opusplan" ~/.claude/skills/
  ```
  Opcional, para `opusplan` virar o padrão: mescle `claude/settings/opusplan.exemplo.json` em `~/.claude/settings.json` (não substitua o arquivo).
- **Invocar:** `/usar-opusplan`, ou o Claude carrega sozinho quando você fala de cota, limites ou plan mode. Para usar o modo em si: `/model opusplan`.
- **Testar:** numa sessão nova, digite `/` e confira que `usar-opusplan` aparece. Rode `/model opusplan`, entre no plan mode, peça um plano, aprove e confira em `/status` que a execução passou para o Sonnet.

## Fonte 002 — Code Mode experimental

- **O que faz:** a skill `usar-code-mode` explica como ligar o Code Mode (o Claude escreve JavaScript que encadeia várias tool calls), os requisitos de versão, os limites e como desligar.
- **Instalar (usuario):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/claude/skills/usar-code-mode" ~/.claude/skills/
  ```
  Opcional: mescle `claude/settings/code-mode.exemplo.json` em `~/.claude/settings.json`. Nunca no settings de um projeto, que ignora a variável.
- **Invocar:** `/usar-code-mode`, ou automático ao falar de Code Mode. Para ligar só numa sessão: `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1 claude` (v2.1.323+, build nativo, terminal).
- **Testar:** a sessão deve mostrar `Code Mode (experimental) is on`. Peça uma mudança repetida em vários arquivos e use `Ctrl+O` para ver o JavaScript.

## Fonte 003 — instalar um artifact como app (app Claude)

- **O que faz:** o guia `claude-app/guias/instalar-artifact-como-app.md` explica o “Install as app” do Claude para Mac e Windows: requisitos, passo a passo, permissões, limites do beta e cota.
- **Instalar (app-claude):** não há cópia. Abra o guia e siga no Claude Desktop 6.28899.0 ou posterior.
- **Invocar:** no app, abra o artifact e escolha Install as app (menu do título ou Share).
- **Testar:** seção “Como testar este guia”, no fim do próprio guia.

## Fonte 004 — enxugar o contexto sempre carregado

- **O que faz:** a skill `enxugar-contexto` mede o contexto (`/context`, `/usage`, `/doctor prompt-audit`) e decide o que sai do `CLAUDE.md` para skill, regra com `paths`, `CLAUDE.md` de subpasta, hook ou subagente. O starter `claude/CLAUDE.md` ganhou dois lembretes sobre isso.
- **Instalar (usuario):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/claude/skills/enxugar-contexto" ~/.claude/skills/
  ```
  Do starter, copie só os trechos que faltam no seu `CLAUDE.md`.
- **Invocar:** só manual: `/enxugar-contexto` (a skill tem `disable-model-invocation: true`).
- **Testar:** num projeto com `CLAUDE.md` grande, anote o `/context`, rode `/enxugar-contexto`, aplique a triagem aprovada e rode `/context` de novo. Crie um `CLAUDE.md` numa subpasta e confira que ele só carrega quando o Claude lê um arquivo ali.

## Fonte 005 — pasta compartilhada e handoff entre agentes

- **O que faz:** o snippet `compartilhar-agents-md` põe `@AGENTS.md` no `CLAUDE.md` para o Claude Code ler as regras que os outros agentes leem. A skill `registrar-handoff` escreve a nota de fim de sessão no topo de `HANDOFF.md` e respeita `DECISIONS.md`.
- **Instalar (projeto)**, na raiz do projeto compartilhado:
  ```bash
  mkdir -p .claude/skills && cp -R "$REPO/claude/skills/registrar-handoff" .claude/skills/
  ```
  Crie `HANDOFF.md` e `DECISIONS.md` com os modelos de `registrar-handoff/modelos.md` e cole o bloco “Handoff entre agentes” no `AGENTS.md`. Se o projeto tem `CLAUDE.md`, cole o corpo de `claude/snippets/compartilhar-agents-md.md` no topo dele. Sem `CLAUDE.md`, o Claude Code v2.1.277+ já lê o `AGENTS.md` sozinho.
- **Invocar:** só manual: `/registrar-handoff` ao encerrar a sessão.
- **Testar:** numa sessão nova, `/context all` deve listar o `CLAUDE.md` em Memory files. Rode `/registrar-handoff`, abra outra sessão e peça “continue do último handoff”.


## Fonte 006 — skills, Tasks e Elicitation pelo MCP

- **O que faz:** a skill `usar-skills-pelo-mcp` ensina a achar e invocar skills que o próprio servidor ou conector MCP envia (`/servidor:skill`), a acompanhar um MCP task em `/tasks` e a responder o diálogo de Elicitation, com os limites oficiais (versão, planos, o que não vale). O guia `guias/skills-pelo-mcp.md` cobre o mesmo no app Claude. File Uploads fica só como aviso: ainda em rollout.
- **Instalar a skill (usuario):**
  ```bash
  mkdir -p ~/.claude/skills && cp -R "$REPO/claude/skills/usar-skills-pelo-mcp" ~/.claude/skills/
  ```
  O guia do app não se instala por cópia: abra `claude-app/guias/skills-pelo-mcp.md` e siga no app (destino `app-claude`).
- **Invocar:** `/usar-skills-pelo-mcp` quando for ligar um servidor que publica skills, ou deixe o Claude carregar a skill se a descrição combinar. A skill *do servidor* se invoca com `/servidor:skill`, não com este nome.
- **Testar:** no Claude Code v2.1.332+ (Pro/Max/Ultra, `/login`), conecte um servidor ou conector que publique skills; `/skills` deve listar `servidor:skill`; invoque uma skill inofensiva. Se houver Tasks ou Elicitation, acompanhe em `/tasks` (feche `/tasks` para ver o diálogo). No app, o fluxo é pelo conector. Ainda não testado; a fonte está `parcial`.

## Ferramentas do próprio repositório

Não vêm de fonte externa; servem ao pipeline. `processar-fonte` (skill, usuario) e `extrator-fonte` (subagente, usuario) processam um link novo seguindo o [guia](GUIA-ANALISE-SITE.md): instale com `cp -R "$REPO/claude/skills/processar-fonte" ~/.claude/skills/` e `cp "$REPO/claude/agents/extrator-fonte.md" ~/.claude/agents/`, e invoque com `/processar-fonte <url>` no checkout deste repositório. O estilo `conciso-ptbr` (usuario) vai para `~/.claude/output-styles/` e se liga com `/output-style` ou `"outputStyle": "conciso-ptbr"` no settings.

## Como comparar pt-BR e en-US

Objetivo: ver, no seu uso, se a versão em inglês gasta menos contexto ou é seguida melhor que a em português. Não há número oficial sobre isso; é preciso medir.

**Isole as duas versões.** Com as duas instaladas juntas, as descrições das skills automáticas (`usar-opusplan`/`use-opusplan`, `usar-code-mode`/`use-code-mode`, `usar-skills-pelo-mcp`/`use-mcp-skills`, `processar-fonte`/`process-source`) entram duas vezes na lista de skills, e o Claude pode escolher qualquer uma. Para comparar, instale um idioma por vez, ou use um diretório de configuração para cada um (pode pedir login de novo):

```bash
CLAUDE_CONFIG_DIR=~/.claude-ptbr claude   # só os artefatos pt-BR instalados aqui
CLAUDE_CONFIG_DIR=~/.claude-enus claude   # só os artefatos en-US instalados aqui
```

**Mantenha o resto igual:** mesmo projeto, mesmo modelo (`/model`), mesma versão do Claude Code, sessão nova (ou `/clear`) a cada rodada e o mesmo pedido. O idioma do pedido também influencia: compare pt-BR com pedido em português e en-US com pedido em inglês e, se quiser isolar o efeito do artefato, rode também en-US com pedido em português.

**O que observar:**

| Critério | Como medir |
| --- | --- |
| Tokens | `/context` no início da sessão (lista de skills e Memory files) e depois de invocar a skill; `/usage` para a atribuição aproximada por skill. Compare o mesmo artefato nos dois idiomas. |
| Aderência | A skill automática disparou no pedido certo? Seguiu os passos (por exemplo, `enxugar-contexto`/`trim-context` mediu antes de propor; `registrar-handoff`/`write-handoff` escreveu no topo e não fez commit)? Respeitou as ressalvas (não prometeu economia)? |
| Qualidade | Comandos e caminhos corretos, idioma da resposta como esperado, clareza, quantas correções você precisou pedir. |

Registre cada rodada numa linha: data, `claude --version`, modelo, idioma do artefato, idioma do pedido, tarefa, tokens no `/context` (antes e depois), aderência (sim, parcial, não), qualidade (1 a 5) e observações. Duas ou três rodadas por artefato já mostram a tendência; uma só pode enganar.
