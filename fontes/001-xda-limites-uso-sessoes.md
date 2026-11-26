# Fonte 001 — I stopped hitting Claude's usage limits after changing one habit in how I start sessions

- **URL:** https://www.xda-developers.com/i-stopped-hitting-claudes-usage-limits-after-changing-one-habit-in-how-i-start-sessions/
- **Acesso:** 2026-11-25 22:03 (America/Sao_Paulo)
- **Autor / site:** Abhinav Raj, XDA Developers. Publicado em 21 de novembro de 2026, 10:30 (EST) — 12:30 (America/Sao_Paulo).
- **Status:** parcial

## Resumo

Relato de um usuário Pro que batia nos limites de 5 horas e no limite semanal (e chegou a gastar mais de US$ 300 em créditos extras num mês ruim). O “hábito” que ele adota não é começar a sessão com `/clear`, apesar do título: é usar o alias `opusplan` do Claude Code, para o Opus planejar e o Sonnet executar depois da aprovação do plano. Ele descreve um teste próprio (dois Tetris em HTML, esforço médio, no mesmo intervalo de 5 horas) em que o `opusplan` saiu 16% mais barato na estimativa a preço de API do `/usage` (US$ 0,34 contra US$ 0,40), com um cache miss na troca de modelo (19,3k tokens relidos). Os dois runs teriam somado dois pontos na barra da sessão e nada na semanal.

## O que foi lido

- A página principal do artigo (incluindo comentários no final; nada de acionável para o Claude Code ali).
- Para conferência oficial (não são “páginas extras” do artigo): [model configuration](https://code.claude.com/docs/en/model-config) (`opusplan`), [prompt caching](https://code.claude.com/docs/en/prompt-caching) (troca de modelo), [manage costs](https://code.claude.com/docs/en/costs) (`/usage`), [limites de uso](https://support.claude.com/en/articles/11647753-how-do-usage-and-length-limits-work), [Claude Code no Pro/Max/Ultra](https://support.claude.com/en/articles/11145838-use-claude-code-with-your-pro-max-or-ultra-plan), [models, usage, and limits](https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code), [preços](https://claude.com/pricing).

## Insights acionáveis

### Insight 1 — Usar `opusplan` para planejar com Opus e executar com Sonnet

- **Ação:** No Claude Code, selecionar o alias `opusplan` (`/model opusplan` ou o campo `model` no settings), entrar no plan mode, aprovar o plano e deixar o Sonnet executar.
- **Quando importa:** Trabalho com uma fase clara de planejamento seguida de implementação, quando se quer esticar o limite do plano (Pro/Max) sem abrir mão do Opus no raciocínio.
- **Tipo de artefato:** skill (procedimento) + fragmento opcional de settings
- **Destino de instalação:** usuario
- **Seção de origem:** “Anthropic's advice is to plan with Opus, and execute with Sonnet” e “Opusplan wrote better code for 16% less”
- **Conferido na doc oficial:** sim — https://code.claude.com/docs/en/model-config e https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code

### Insight 2 — Acompanhar o consumo com `/usage` (e Settings > Usage)

- **Ação:** Usar `/usage` no Claude Code e a página Settings > Usage no site; as barras são percentuais, não contagem de mensagens. O custo em dólares do bloco Session é estimativa a preço de API, não a fatura do assinante.
- **Quando importa:** Sempre que se estiver gerindo limite de 5 horas ou semanal.
- **Tipo de artefato:** incorporado na skill (não justifica artefato separado)
- **Destino de instalação:** usuario
- **Seção de origem:** “Claude's limits are still the tightest I've run into”
- **Conferido na doc oficial:** sim — https://code.claude.com/docs/en/costs e https://support.claude.com/en/articles/11647753-how-do-usage-and-length-limits-work

### Insight 3 — Limites de 5 horas e semanal são compartilhados com o app Claude

- **Ação:** Tratar chat no claude.ai / app e o Claude Code como o mesmo saldo.
- **Quando importa:** Ao planejar o dia de uso.
- **Tipo de artefato:** incorporado na skill (fato curto, não merece snippet à parte no starter)
- **Destino de instalação:** usuario
- **Seção de origem:** “Claude's limits are still the tightest I've run into”
- **Conferido na doc oficial:** sim — help center e https://claude.com/pricing

### Insight 4 — A entrega do plano ao Sonnet gera cache miss (custo único por troca)

- **Ação:** Esperar (e aceitar) um relê do histórico na troca de modelo; não interpretar isso como falha do `opusplan`. Evitar alternar plan mode sem necessidade.
- **Quando importa:** Ao usar `opusplan` ou qualquer `/model` no meio da sessão.
- **Tipo de artefato:** incorporado na skill
- **Destino de instalação:** usuario
- **Seção de origem:** o “catch” do teste do Tetris
- **Conferido na doc oficial:** sim — https://code.claude.com/docs/en/prompt-caching

## Artefatos gerados

- `claude/skills/usar-opusplan/SKILL.md` — destino: `usuario` (`~/.claude/skills/usar-opusplan/`) — como ativar e usar `opusplan`, com ressalvas oficiais de cache e de limites.
- `claude/settings/opusplan.exemplo.json` — destino: `usuario` (`~/.claude/settings.json`, mesclar a chave `model`) — default opcional; a skill avisa para não gravar isso no escuro se o Alexandre quiser Opus o tempo todo em alguns projetos.

## Duplicatas e reuso

Não havia skill, snippet ou setting sobre `opusplan`, `/usage` ou limites compartilhados no pacote `claude/`.

## Divergências com a documentação oficial

- **Título do artigo versus corpo (e versus a doc oficial de hábitos).** O título promete um hábito de *como começar sessões*. O corpo ensina `opusplan`. A doc oficial ([models, usage, and limits](https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code) e [manage costs](https://code.claude.com/docs/en/costs)) recomenda `/clear` ao trocar de tarefa não relacionada como a alavanca mais eficaz de custo e qualidade, e `/compact` para continuar a mesma tarefa. Os dois lados: o artigo não descreve `/clear`; a Anthropic, sim. O artefato desta fonte cobre o `opusplan` (o que o texto realmente ensina) e só aponta `/clear` como complemento oficial, sem atribuir esse hábito ao artigo.
- **Economia de 16% e o Tetris.** É um experimento único do autor (dois runs, esforço médio, arquivo HTML único). A documentação oficial confirma o padrão “planejar com Opus, executar com Sonnet” e o cache miss na troca, mas **não** garante 16% nem os valores US$ 0,34 / 0,40. A skill não reproduz esses números como regra.
- **Custo em dólares no `/usage`.** O autor usa a estimativa do Claude Code a preço de API. A doc oficial de custos avisa que, em planos Pro/Max/Ultra, o valor em dólares da sessão **não** é a cobrança da assinatura; o que importa para o limite são as barras do plano.
- **Salvar `opusplan` como padrão.** A doc de [model configuration](https://code.claude.com/docs/en/model-config) diz que escolher `opusplan` (ou Default) no `/model` **não altera** a escolha gravada de modelo. Para default permanente, use o campo `model` no settings (ou `ANTHROPIC_DEFAULT_MODEL`). O artigo não menciona esse detalhe.
- **Preço do Max (US$ 100) e “5× o Pro”.** Conferido em https://claude.com/pricing na data de acesso. Pro “pelo menos 5× o Free por sessão de 5 horas” e Max “5× o Pro a cada 5 horas e a cada semana” também batem com o texto oficial. O gasto de US$ 300 em créditos é só relato pessoal.

## Conflitos entre fontes

- **Artigo XDA:** o caminho prático é `opusplan`; o título sugere hábito de início de sessão, mas o corpo não desenvolve `/clear` / `/compact`.
- **Doc oficial da Anthropic:** confirma o `opusplan` (`/model opusplan`) e, **além disso**, trata `/clear` entre tarefas não relacionadas e `/compact` no meio de uma tarefa longa como hábitos centrais de uso. Também confirma o cache miss em toda troca de modelo, inclusive a cada ida/volta do plan mode com `opusplan`.
- Os dois lados ficam visíveis acima. Recomendação (alinhada ao oficial, sem esconder o artigo): use `opusplan` quando houver fase de plano + execução; use também `/clear` ao mudar de tarefa, como a doc oficial pede — isso não veio do corpo do artigo.

## Pendências

- **Teste no Claude Code ainda não feito** (não há Claude Code nesta sessão). Por isso o status permanece `parcial` mesmo depois do push no GitHub. Para fechar como `publicado`: instalar a skill em `~/.claude/skills/`, rodar `/usar-opusplan` ou seguir o fluxo (`/model opusplan`, plan mode, `/usage`) e anotar o resultado.
- Push no GitHub: a cargo de quem publicar o patch; o status **não** muda para `publicado` só com o push, porque o teste ainda falta.
