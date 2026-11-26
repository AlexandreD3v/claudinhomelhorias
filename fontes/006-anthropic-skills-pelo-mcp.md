# Fonte 006 — MCP servers can now ship skills, run tasks, and more with Claude

- **URL:** https://claude.com/resources/articles/skills-over-mcp-tasks-and-more
- **Acesso:** 2026-11-26 17:55 (America/Sao_Paulo)
- **Autor / site:** Anthropic, artigo oficial em claude.com/resources. Publicado em 24 de novembro de 2026 (`datePublished`). Sem autor individual.
- **Tema:** ambos
- **Status:** parcial

## Resumo

Artigo oficial da Anthropic: o servidor MCP passa a trabalhar com o Claude mais como outro agente — ensina, recebe trabalho longo e pede input no meio do caminho. **Skills over MCP** (beta pública no Claude e no Claude Code): o servidor publica skills junto das tools; o Claude carrega a skill só quando precisa; ela atualiza com o servidor, sem instalação à parte. Exemplos citados (Shopify, HubSpot, Atlassian; Carta em breve). **Tasks** (disponibilidade geral): o servidor roda a operação (ou um loop de agente) em segundo plano e o Claude segue trabalhando até o resultado chegar. **Elicitation** (disponibilidade geral): o servidor pausa para pedir input numa ficha ou num link (Supabase, Railway e GitHub como exemplos). **File Uploads** (em rollout): enviar PDF, planilha e imagem ao servidor sem passar pelo contexto. O texto também lista bases do MCP (tool search, spec stateless, Enterprise Managed Auth, MCP Apps) e aponta a documentação para quem vai implementar.

## O que foi lido

- A página canônica do artigo (uma única coleta, 26 de novembro de 2026).
- Documentação oficial, na mesma data: [skills do Claude Code](https://code.claude.com/docs/en/skills#skills-from-mcp-servers), [MCP](https://code.claude.com/docs/en/mcp#use-skills-from-mcp-servers) (skills, aprovações, Tasks, Elicitation, tool search), [changelog](https://code.claude.com/docs/en/changelog) (2.1.332, 25 de novembro de 2026), [disponibilidade por plano](https://code.claude.com/docs/en/feature-availability), [File Uploads](https://claude.com/docs/connectors/building/files) e as extensões abertas ligadas no artigo ([Skills](https://modelcontextprotocol.io/extensions/skills/overview), [Tasks](https://modelcontextprotocol.io/extensions/tasks/overview), [Elicitation](https://modelcontextprotocol.io/specification/2026-07-28/client/elicitation)).
- Deixado de fora dos artefatos (é guia de implementação, não de uso): detalhes de protocolo para autores de servidor (`ttlMs`, `pollIntervalMs`, `tasks/get`, declaração de elicitation, hosts aprovados de File Uploads). Ficam apontados na pendência e nos links oficiais.

## Insights acionáveis

### Insight 1 — Usar as skills que o próprio servidor MCP envia

- **Ação:** com um servidor ou conector que publica skills, não copie a skill para `~/.claude/skills/`. No Claude Code (v2.1.331+ segundo a doc de skills/MCP; o changelog anuncia o recurso na **2.1.332**), ache-a em `/` ou `/skills` e invoque `/servidor:skill` (conectores: `claude_ai_Nome:skill`; plugins: `plugin_plugin_servidor:skill`). O Claude também pode carregá-la sozinho. Skills locais e skills do servidor convivem; várias propriedades de skill local (`allowed-tools`, hooks, `!`, `@`, substituições) **não valem** numa skill MCP. Planos: Pro, Max e Ultra ligadas com `/login`; Team e Enterprise desligadas até o admin ligar (Owner em Organization settings > Connectors, e `disableDirectMcpSkills: false` nos managed settings para servidores que não são conector).
- **Quando importa:** o conector ou o servidor já ensina o fluxo (loja, CRM, contexto da empresa) e você não quer manter uma cópia local que envelhece.
- **Tipo de artefato:** skill (Claude Code) e guia-app (app Claude)
- **Destino de instalação:** `usuario` (skill) e `app-claude` (guia)
- **Seção de origem:** “Ship expertise alongside tools with Skills over MCP”
- **Conferido na doc oficial:** sim — skills (“Skills from MCP servers”), MCP (“Use skills from MCP servers”, aprovações, disponibilidade) e feature availability

### Insight 2 — Tasks: trabalho longo no servidor, Claude segue na sessão

- **Ação:** quando o servidor aceita um MCP task, a tool call devolve logo e o Claude continua. No terminal, o rodapé mostra `N MCP task`; em `/tasks` dá para ver, parar (`x`) ou reabrir uma pergunta. O resultado vai para o Claude, não para o transcript: peça o resultado (se ele estiver ocioso, começa sozinho). Task de servidor remoto sobrevive ao sair da sessão; retome a mesma sessão para acompanhar de novo. Tasks no servidor exigem Claude Code v2.1.304+. Não confundir com o background automático de uma tool call lenta (2 minutos, não sobrevive ao exit).
- **Quando importa:** pesquisa, export ou build que antes prendia a sessão em várias prompts.
- **Tipo de artefato:** mesmo par skill + guia
- **Destino de instalação:** `usuario` / `app-claude`
- **Seção de origem:** “Hand off long-running work with Tasks”
- **Conferido na doc oficial:** sim — MCP (“MCP tasks that run on the server”)

### Insight 3 — Elicitation: responder no meio da chamada, não no chat

- **Ação:** se o servidor pedir input (gasto, SQL destrutivo, nome de repositório para apagar), aparece um diálogo. Modo form: preencha a ficha. Modo URL: abra o link (login, fluxo fora do cliente). Recusar é uma resposta; o servidor decide se segue. Com `/tasks` aberto o diálogo fica escondido: feche `/tasks` para responder. Para responder depois (v2.1.324+): `Esc` no diálogo e reabra pelo detalhe da task em `/tasks`.
- **Quando importa:** ação irreversível ou dado que o servidor não tem.
- **Tipo de artefato:** mesmo par skill + guia
- **Destino de instalação:** `usuario` / `app-claude`
- **Seção de origem:** “Ask for input mid-call with Elicitation”
- **Conferido na doc oficial:** sim — MCP (“Respond to MCP elicitation requests”)

## Artefatos gerados

- `claude/skills/usar-skills-pelo-mcp/SKILL.md` — destino: `usuario` (`~/.claude/skills/usar-skills-pelo-mcp/`) — como achar e invocar skills do servidor, aprovações, limites, Tasks e Elicitation no Claude Code.
- `claude-app/guias/skills-pelo-mcp.md` — destino: `app-claude` — o mesmo conjunto no app Claude (conectores, planos, o que esperar de Tasks, Elicitation e File Uploads).

## Duplicatas e reuso

Nada em `claude/` ou `claude-app/` cobria Skills over MCP, Tasks ou Elicitation. A skill `enxugar-contexto` (fonte 004) é complementar: ela trata do contexto sempre carregado (`CLAUDE.md`, regras, imports); o tool search do MCP adia *definições de tools* e não substitui aquele enxugamento. O artigo cita “mais de 85%” de corte de contexto das tools em setups com vários servidores; a doc oficial do Claude Code descreve o mecanismo (“só nomes e instruções do servidor no início”) **sem essa cifra**. A skill desta fonte não promete economia percentual.

## Divergências com a documentação oficial

- **Enterprise nas skills.** Artigo: Skills over MCP “em breve no Enterprise”. Oficial (feature availability e a página de MCP, 26/11): Team **e** Enterprise ficam em *Admin-enabled* — o Owner liga em Organization settings > Connectors, e a setting de Skills da organização também precisa estar ligada. Recomendação (sem esconder o artigo): no Claude Code, siga a tabela oficial da sua organização; o artigo está atrasado neste ponto.
- **Versão mínima no Claude Code.** Doc de skills e de MCP: v2.1.331 ou posterior. Changelog: o recurso “Added skills from MCP servers (beta)” entra na **2.1.332** (25 de novembro de 2026), com o formato `server:skill` no menu `/`. Recomendação: trate 2.1.332 como a release em que o recurso foi anunciado e confira `claude --version`; se estiver em 2.1.331, teste antes de depender.
- **File Uploads.** Artigo: “rolling out soon”. A doc de conectores já descreve a extensão em beta (`io.modelcontextprotocol/files`), com requisitos estreitos (conector do Directory com URL exata, revisão MCP 2026-07-28, hosts aprovados, limites em Team/Enterprise). Não está “ausente da doc”; está em rollout com restrições. A skill e o guia avisam que ainda não é uso geral.
- **Tasks e Elicitation por plano.** Artigo: disponibilidade geral no Claude e no Claude Code para Pro, Max e Ultra, em rollout para Team e Enterprise. A doc de MCP detalha versão, tipo de sessão e feature flags, **sem** repetir essa divisão por plano. Os artefatos citam os dois lados e mandam conferir o plano e a doc da sua versão.
- **Onde as skills MCP não valem (oficial, o artigo não lista):** sessões na nuvem, `claude -p`, Agent SDK, GitHub Actions, modo servidor do Remote Control, conectores/extensões da app Desktop e `claude_desktop_config.json`, provedores de nuvem, `ANTHROPIC_BASE_URL` customizado, organizações com HIPAA ou zero data retention. Modelos: Fable, ou Opus 4.8, Sonnet 5, Haiku 5.5 ou posterior, com conexão direta à Anthropic e feature flags. VS Code está em rollout.

## Conflitos entre fontes

- **Enterprise: “em breve” (artigo) versus Admin-enabled (oficial).** Ver divergências. Não há outra fonte do repositório sobre isso.
- **Cifra de 85% no tool search.** Artigo: “can cut the context they use by over 85% in multi-server setups”, com link para a doc da API. Oficial do Claude Code: descreve o adiamento das definições, sem percentual. A fonte 004 já ensina a não repetir cifra não medida; aqui a cifra fica só no artigo.
- Nenhuma fonte anterior (001–005) contradiz o restante: 002 (Code Mode) e o tool search convivem; 004 continua valendo para instruções sempre carregadas.

## Pendências

- **Teste ainda não feito** no Claude Code nem no app Claude (não há os dois nesta sessão). Permanece `parcial` mesmo depois do push. Para fechar no Claude Code v2.1.332+ (Pro/Max/Ultra, `/login`): conectar um servidor ou conector que publique skills; `/skills` deve listar `servidor:skill`; invocar uma skill inofensiva e conferir a aprovação. Se o servidor oferecer Tasks ou Elicitation, acompanhar em `/tasks` e responder o diálogo (fechando `/tasks` se estiver aberto). No app Claude: o mesmo fluxo pelos conectores, no plano da conta.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
