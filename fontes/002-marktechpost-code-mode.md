# Fonte 002 — Anthropic Adds Code Mode to Claude Code: Claude Now Chains Tool Calls in JavaScript

- **URL:** https://www.marktechpost.com/2026/11/17/anthropic-claude-code-code-mode-javascript-tool-calls/
- **Acesso:** 2026-11-25 23:16 (America/Sao_Paulo)
- **Autor / site:** Michal Sutter, MarkTechPost. Publicado em 17 de novembro de 2026. O link enviado vinha com `?amp=1`; a URL canônica (sem AMP) é a registrada acima.
- **Tema:** claude-code
- **Status:** parcial

## Resumo

Artigo de divulgação sobre o Code Mode do Claude Code, lançado como recurso experimental e opt-in na v2.1.323. Em vez de cada Bash/Read/Edit ser um passo separado, o Claude escreve um JavaScript que encadeia várias tool calls, pode filtrar resultados antes de devolvê-los e rodar comandos em paralelo. O texto resume como ligar (`CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1`), quando usar, permissões (no auto mode o classificador revê o código, não cada chamada), limites de tempo (10 minutos à espera, 2 horas em background) e restrições de superfície. A Anthropic não publica número oficial de economia de tokens para o Code Mode do CLI; o artigo cita um teste de terceiros (11,1k vs 24,6k) e compara com outros produtos (MCP code execution e Programmatic Tool Calling da API).

## O que foi lido

- A página canônica do artigo (sem `?amp=1`). Não houve outras páginas do site.
- Para conferência oficial: [Run tool calls from code with Code Mode](https://code.claude.com/docs/en/code-mode) (página vigente em 25 de novembro de 2026) e o [changelog](https://code.claude.com/docs/en/changelog) (entradas 2.1.328–2.1.332, de 19 a 25 de novembro de 2026).

## Insights acionáveis

### Insight 1 — Ligar o Code Mode (opt-in experimental)

- **Ação:** Na v2.1.323 ou posterior (build nativo), definir `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1` no shell ou no bloco `env` de `~/.claude/settings.json`, confirmar “Yes, turn on Code Mode” na primeira sessão e ver a linha “Code Mode (experimental) is on”. A variável em settings de **projeto** é ignorada. Um `0` em qualquer lugar desliga, mesmo com `1` em outro. Admins podem só bloquear (não forçar) via managed settings.
- **Quando importa:** Para experimentar o recurso ou deixá-lo ligado nas sessões pessoais.
- **Tipo de artefato:** skill + fragmento de settings
- **Destino de instalação:** usuario (a doc oficial impede ligar pelo settings do projeto)
- **Seção de origem:** “How do you turn on Code Mode?”
- **Conferido na doc oficial:** sim — https://code.claude.com/docs/en/code-mode

### Insight 2 — Quando vale a pena e como acompanhar o código

- **Ação:** Usar em tarefas com muitas tool calls relacionadas (mudança repetida em vários arquivos, busca que precisa de filtro antes da leitura, comandos independentes em paralelo). No chat aparecem as tool calls (por exemplo o diff), não o JavaScript; para ver o código, `Ctrl+O` e expandir a linha Code.
- **Quando importa:** Depois de ligado, ao escolher a tarefa.
- **Tipo de artefato:** incorporado na skill
- **Destino de instalação:** usuario
- **Seção de origem:** “What is Code Mode” e “When should developers use Code Mode?”
- **Conferido na doc oficial:** sim — mesma página oficial, inclusive o exemplo do `retryPolicy`

### Insight 3 — Permissões, hooks e código longo

- **Ação:** Manter `deny`/`ask` e hooks `PreToolUse` no nome usual da ferramenta (Bash, ferramenta MCP, etc.). No auto mode, o classificador revê o **código**, não cada chamada, e não vê valores calculados em tempo de execução (por exemplo um caminho vindo da busca). Para inspecionar o JavaScript, hook em `REPL` lendo `tool_input.code`. Código em espera para aos 10 minutos (no Manual/`acceptEdits`, o tempo no prompt de permissão não conta a partir da v2.1.328). Em background (sessão iniciada em auto ou `bypassPermissions`) pode rodar até 2 horas enquanto se conversa.
- **Quando importa:** Quem já tem hooks/regras, ou roda builds longos.
- **Tipo de artefato:** incorporado na skill
- **Destino de instalação:** usuario
- **Seção de origem:** “How does Code Mode handle permissions and long-running code?”
- **Conferido na doc oficial:** sim — com o detalhe do tempo de prompt (v2.1.328) que o artigo não traz

## Artefatos gerados

- `claude/skills/usar-code-mode/SKILL.md` — destino: `usuario` (`~/.claude/skills/usar-code-mode/`) — quando e como ligar o Code Mode, limites e divergências com a doc oficial vigente.
- `claude/settings/code-mode.exemplo.json` — destino: `usuario` (mesclar o bloco `env` em `~/.claude/settings.json`; **não** usar settings de projeto) — opt-in permanente opcional.

## Duplicatas e reuso

Não havia skill, snippet ou setting sobre Code Mode no pacote `claude/`.

## Divergências com a documentação oficial

- **Provedores de nuvem.** O artigo (17 de novembro de 2026) afirma “Anthropic API or Claude subscription only” e “No Bedrock, Google Cloud, Foundry”. A doc oficial vigente e o changelog da **v2.1.331** (23 de novembro de 2026) passam a permitir Code Mode em sessões de terminal no Amazon Bedrock, Google Cloud's Agent Platform, Microsoft Foundry e Claude Platform on AWS. Continua **sem** gateway e sem Claude for Government. Os dois lados: o artigo descrevia o estado na v2.1.323; o oficial atual é mais amplo a partir da 2.1.331. O artefato segue o oficial vigente.
- **Telemetria / `DISABLE_TELEMETRY` / OpenTelemetry.** O artigo lista “API key helper, OpenTelemetry export or `DISABLE_TELEMETRY`” como settings que bloqueiam o recurso. A doc oficial ainda bloqueia **API key helper** numa conexão direta com a Anthropic e o **tracing** OpenTelemetry. Já eventos/métricas OTEL e feature flags/`DISABLE_TELEMETRY` desligados passam a ser compatíveis na **v2.1.329** (19 de novembro de 2026), com a ressalva de manter o tracing off. Os dois lados: o artigo refletia a versão de lançamento; o oficial posterior afrouxou parte dessas restrições.
- **Ferramentas orquestradas.** A tabela do artigo diz que o Code Mode do CLI orquestra “Built-in tools (Bash, Read, Edit)”. A doc oficial também trata de chamadas **MCP** e web a partir do código (regras/hooks no nome da ferramenta MCP; essas chamadas rodam fora do sandbox). Os dois lados: o artigo enfatiza as tools nativas do CLI; o oficial inclui MCP/web. A skill menciona MCP.
- **`-p` e Agent SDK.** O artigo os inclui na lista de exclusões. A doc oficial exige “sessão interativa `claude` no terminal” e exclui explicitamente o painel do VS Code, o app Desktop e sessões na nuvem; **não** nomeia `-p` nem o Agent SDK. Os dois lados ficam visíveis; a skill não apresenta essas duas exclusões como texto oficial.
- **Números de tokens.** O artigo acerta ao dizer que a Anthropic não publica cifra oficial para o Code Mode do CLI. Os 98,7% e a média 43.588→27.297 são de **outros** produtos (execução de código com MCP / Programmatic Tool Calling da API), não do Code Mode do Claude Code. O 11,1k vs 24,6k é um teste de terceiros; a skill não os trata como garantia.

## Conflitos entre fontes

- **MarkTechPost (17/11):** disponibilidade só via assinatura/Console Anthropic; OTEL export e `DISABLE_TELEMETRY` bloqueiam; tools = Bash/Read/Edit.
- **Doc oficial + changelog (até 25/11):** Code Mode experimental e opt-in confirmado; a partir da 2.1.331 há suporte em provedores de nuvem no terminal; a partir da 2.1.329 OTEL events/metrics e flags off são compatíveis (tracing continua off); MCP/web também entram no código.
- Recomendação (alinhada ao oficial, sem esconder o artigo): ligar e usar o Code Mode conforme a página oficial vigente; tratar as restrições de nuvem e telemetria do artigo como o estado da semana de lançamento, não como a regra atual se a versão for 2.1.331+.

## Pendências

- **Teste no Claude Code ainda não feito** (não há Claude Code nesta sessão). O status permanece `parcial` mesmo depois do push no GitHub. Para fechar como `publicado`: ter v2.1.323+ (build nativo), ligar o Code Mode, confirmar o aviso, rodar `/usar-code-mode` ou uma tarefa com várias tool calls e conferir a linha “Code Mode (experimental) is on” e o código no `Ctrl+O`.
- Push no GitHub: a cargo de quem publicar o patch; o status **não** muda para `publicado` só com o push.
