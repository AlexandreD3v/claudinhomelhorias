# Guia de análise de um site

Passo a passo operacional para cada link enviado por Alexandre. Siga os passos na ordem. Não pule a checagem de credibilidade, a verificação na documentação oficial nem a deduplicação.

**Escopo (confirmado em 26 de novembro de 2026):** de cada site extrai-se o que se aplica ao **Claude Code** (vai para [`claude/`](claude/)) ou ao **app Claude** — chat e Claude Desktop, Mac e Windows, claude.ai (vai para [`claude-app/`](claude-app/)). Só se descarta o que não serve a nenhum dos dois. Cada fonte recebe um **tema**: `claude-code`, `claude-app` ou `ambos`.

Este guia é a referência de execução. O contrato curto (qualidade, estados do índice, o que não fazer) permanece em [`PROCESSO.md`](PROCESSO.md). As premissas vigentes, confirmadas em 25 de novembro de 2026, estão em [`CONTEXTO.md`](CONTEXTO.md). A skill [`/processar-fonte`](claude/skills/processar-fonte/SKILL.md) e o subagente [`extrator-fonte`](claude/agents/extrator-fonte.md) seguem este mesmo fluxo.

Idioma dos arquivos gerados: **pt-BR**. Datas de acesso e do relatório: fuso **America/Sao_Paulo**, com o fuso explícito.

## 1. Intake — capturar o pedido

1. Anote a URL como o Alexandre enviou e a forma canônica (sem parâmetros de rastreamento: `utm_*`, `fbclid`, `gclid`, etc.). Se a query fizer parte do conteúdo (id de artigo, página), preserve-a.
2. Confira o escopo. Se o material for sobretudo sobre Cursor, outro agente, Xcode ou prompting genérico, extraia **só o que se aplica ao Claude Code ou ao app Claude**. Não recuse o link de cara e não force artefato fora de escopo. Se o artigo for sobre o app Claude (por exemplo Claude Desktop, artifacts, projetos, estilos), o conteúdo também entra, em `claude-app/`. Defina o **tema** (`claude-code`, `claude-app` ou `ambos`) e mencione no relatório o que foi deixado de lado por não servir a nenhum dos dois.
3. Abra [`fontes/INDICE.md`](fontes/INDICE.md). Pegue o **próximo número livre** (`001`, `002`, …) e um **slug** curto em kebab-case ASCII (domínio ou título reduzido, sem acento). Se chegarem vários links no mesmo pedido, reserve um número para cada um, todos com `em andamento`, e trate-os como um lote (um único commit no passo 11).
4. Inclua a linha no índice com status `em andamento`, o tema provisório e a data/hora de hoje (America/Sao_Paulo). Isso reserva o número para outra sessão não reutilizar.
5. Copie [`templates/fonte.md`](templates/fonte.md) para `fontes/NNN-slug.md` e preencha de imediato: URL, título provisório, data de acesso, autor/site se já forem óbvios.

## 2. Buscar e ler (incluindo várias páginas)

1. Leia a página principal por completo (não só o título e o lead).
2. Siga páginas extras **só quando forem necessárias** para entender ou conferir um insight, por exemplo:
   - continuação de uma série (“parte 2”, “next”);
   - documento oficial citado (formato, frontmatter, caminho);
   - README, changelog ou página de versão que datam o conselho;
   - um exemplo ligado ao fluxo (repositório ou Gist apontado pelo autor), se for curto e for o cerne da dica.
3. Não faça um crawler. Uma regra prática: a página principal, mais no máximo um punhado de links essenciais (em geral até 3–5). Anote na nota da fonte o que foi lido e o que foi conscientemente deixado de lado.
4. Se a captura falhar (bloqueio, login, paywall, vídeo sem transcrição, PDF inacessível), **pare**. Registre o bloqueio na nota, deixe o status `parcial` ou `em andamento` e peça ao Alexandre um recorte, export ou outro acesso. **Não invente** o conteúdo que não leu.
5. Você pode delegar a leitura e a extração ao subagente `extrator-fonte`. A classificação final, a verificação oficial, a deduplicação e a gravação continuam com quem conduz o ciclo.

## 3. Checar credibilidade e data

Antes de transformar qualquer ideia em artefato, registre na nota:

- autor e veículo (Anthropic / `code.claude.com` / `claude.com` / `support.claude.com`, engenharia da Anthropic, comunidade, newsletter, marketing);
- data de publicação e, se houver, a de atualização;
- versão do Claude Code, do app Claude (Desktop) ou do modelo mencionada, se aparecer;
- se o texto é um relato de uso, uma especulação ou um tutorial com passos reproduzíveis.

Interpretação:

- Documentação oficial vigente prevalece em caminhos, frontmatter, nomes de campos e comportamento do produto.
- Artigo antigo ou que cite versões velhas não é descartado automaticamente: o insight pode continuar válido. Marque-o como possivelmente defasado e confirme na doc oficial **atual** (não só em [`referencias/praticas-oficiais.md`](referencias/praticas-oficiais.md), que é um snapshot).
- Marketing, “10 dicas milagrosas” e repetição do óbvio já coberto no starter ou na síntese oficial saem da lista de artefatos, salvo um detalhe concreto de formato ou um fluxo que ainda não temos.
- Se esta página discordar de outra fonte (oficial ou não), descreva **os dois lados** na nota e no relatório, **sem escolher silenciosamente**. Uma recomendação (por exemplo, seguir a doc oficial vigente) pode aparecer, mas os dois lados permanecem visíveis.

## 4. Extrair insights acionáveis

Para cada ideia, faça a pergunta-filtro: **isso muda, de forma concreta, como o Alexandre usa o Claude Code ou o app Claude?**

Descarte: marketing, generalidade, o que ele já faria lendo o próprio repositório de destino, o que não serve nem ao Claude Code nem ao app Claude, e o que já está coberto de forma equivalente em `claude/`, em `claude-app/` ou em `referencias/praticas-oficiais.md`. Um recurso do app Claude não é descartado só por não ser do Claude Code: vira artefato em `claude-app/`. Se o mesmo insight serve aos dois, o tema é `ambos`, com um artefato em cada pasta e referência cruzada.

Para cada insight que passar, anote na nota da fonte:

- a **ação** (o que fazer);
- **quando** isso importa;
- o **tipo** provável de artefato;
- o **tema** (`claude-code`, `claude-app` ou `ambos`);
- o **destino de instalação** provável (`projeto` ou `usuario` para o Claude Code; `app-claude`, `projeto-claudeai` ou `configuracoes` para o app Claude);
- a **seção de origem** (nome da seção ou âncora, não um recorte longo);
- se exige conferência na doc oficial (sim/não).

## 5. Verificar na documentação oficial

1. Identifique o guia oficial do tipo (atalhos em `referencias/praticas-oficiais.md`). Para o Claude Code, `code.claude.com/docs`; para o app Claude, `claude.com/resources`, o Help Center (`support.claude.com`) e `anthropic.com/news`. Se a síntese do repositório puder estar velha, reabra a página oficial vigente e, se ela mudou, atualize a síntese e o diário de `CONTEXTO.md` **antes** de gravar artefato com formato novo.
2. Confira caminho, frontmatter e nomes de campos (hífens nas skills; camelCase em agentes, como `disallowedTools`). Não invente chaves.
3. Se o site contradisser o oficial em formato ou comportamento do produto, o artefato **segue o oficial**. A divergência — os dois lados — vai para a nota da fonte e para o relatório.
4. Um fluxo extraoficial que **não** contradiz o oficial e é acionável pode virar artefato, com a atribuição da fonte e a data. Não o apresente como se fosse documentação da Anthropic.

## 6. Deduplicar

Busque em `claude/`, `claude-app/`, `fontes/INDICE.md`, `claude/CLAUDE.md` e `claude/snippets/`.

- Se o conselho já existe e o texto novo não acrescenta nada de útil: cite a sobreposição na nota e não crie arquivo novo.
- Se acrescenta (exceção, exemplo melhor, restrição de versão): edite o artefato existente, registre a fonte adicional (`NNN` + URL) e explique o que mudou.
- Não mantenha dois artefatos que ensinam a mesma coisa com nomes diferentes.

## 7. Classificar o tipo de artefato

Use as tabelas abaixo (a primeira é baseada em [Extend Claude Code](https://code.claude.com/docs/en/features-overview) e nas [melhores práticas](https://code.claude.com/docs/en/best-practices)). A coluna “Onde gravar no pacote” é o caminho **neste repositório**. O destino de instalação é um campo à parte, obrigatório, declarado no próprio artefato.

**Claude Code** (pasta `claude/`; destino `projeto` ou `usuario`):

| Se o insight é… | Grave como… | Onde gravar no pacote |
| --- | --- | --- |
| Fato ou regra curta que deve valer em **toda** sessão (comando de build, convenção, “sempre faça X”) e que o Claude **não** descobre lendo o repo | Trecho de `CLAUDE.md` | `claude/snippets/` e, se for do starter, candidato a `claude/CLAUDE.md` |
| Instrução que vale só para certos caminhos ou tipos de arquivo | Regra | `claude/rules/<nome>.md` com frontmatter `paths` |
| Procedimento de vários passos, checklist, material de referência longo ou fluxo que se invoca com `/nome` | Skill | `claude/skills/<nome>/SKILL.md` |
| Atalho antigo de um único arquivo Markdown (evitar para trabalho novo) | Comando | `claude/commands/<nome>.md` |
| Trabalho que deve rodar isolado (pesquisa, revisão, extração) e devolver um resumo | Subagente | `claude/agents/<nome>.md` |
| Tom, papel ou formato de **todas** as respostas da sessão | Estilo de saída | `claude/output-styles/<nome>.md` |
| Algo que **precisa** acontecer ou ser bloqueado sempre, sem depender do modelo | Hook e/ou `permissions.deny` | script em `claude/hooks/` + bloco em `claude/settings/` |
| Conexão com ferramenta externa (issue tracker, browser, API) | MCP | adaptar [`templates/mcp.json`](templates/mcp.json); a config de projeto vai em `.mcp.json` (documente a instalação; não misture com `settings.json` no escuro) |
| Conjunto reutilizável de vários dos itens acima para distribuir | Plugin (só se realmente houver pacote) | documentar no índice; não inventar manifesto sem necessidade |
| Não é acionável, é duplicata ou não serve nem ao Claude Code nem ao app Claude | Nenhum | só o registro na nota, com o motivo |

**App Claude** (pasta `claude-app/`; destino `app-claude`, `projeto-claudeai` ou `configuracoes`; modelo [`templates/artefato-claude-app.md`](templates/artefato-claude-app.md)):

| Se o insight é… | Grave como… | Onde gravar no pacote | Destino |
| --- | --- | --- | --- |
| Como usar um recurso do app: requisitos, versão, planos, passo a passo, permissões, limites, boas práticas | Guia de uso | `claude-app/guias/<nome>.md` | `app-claude` |
| Contexto fixo ou regras de resposta para as conversas de um Projeto do claude.ai | Instrução de projeto | `claude-app/projetos/<nome>.md` | `projeto-claudeai` |
| Tom, estilo ou preferência de resposta para todas as conversas da conta | Estilo ou preferência | `claude-app/estilos/<nome>.md` | `configuracoes` |
| Texto reutilizável para colar numa conversa | Prompt | `claude-app/prompts/<nome>.md` | `app-claude` |
| Ajuste de configuração do app (ligar recurso, permissões, conectores; ou controle de owner em Team/Enterprise) | Configuração | `claude-app/configuracoes/<nome>.md` | `configuracoes` |

Desempates:

- Na dúvida entre `CLAUDE.md` e skill: procedimento ou material que só importa às vezes vira skill (o corpo só entra no contexto quando usado).
- Na dúvida entre skill e hook: se “quase sempre” não for suficiente, vire hook ou `deny`.
- Preferir skill a comando avulso para trabalho novo.
- Preferências pessoais (tom, atalhos, MCP só dele) tendem a `usuario`; convenções e hooks de um repositório tendem a `projeto`.
- Recurso que existe só no app (Claude Desktop, artifacts, Projetos do claude.ai) vai para `claude-app/`; recurso do CLI, do IDE ou da aba Code vai para `claude/`. Se a doc oficial de um produto não cobrir o outro (por exemplo, instalar como app um artifact publicado pelo Claude Code), registre a lacuna na nota e não afirme que dá nem que não dá.
- Não grave artefato “para ter um arquivo”.

## 8. Escrever o artefato

1. Comece pelo template do tipo em [`templates/`](templates/).
2. Grave em `claude/` (Claude Code) ou em `claude-app/` (app Claude), no subdiretório certo. Nomes em kebab-case ASCII.
3. Declare o **destino de instalação** (`projeto` ou `usuario` em `claude/`; `app-claude`, `projeto-claudeai` ou `configuracoes` em `claude-app/`, numa linha logo abaixo do título) no lugar certo do tipo — ver a tabela em [`templates/README.md`](templates/README.md). Não invente chave de frontmatter que o Claude Code ignore ou recuse (em regras, só `paths`; em subagentes, o destino vai no corpo, não num `metadata` extraoficial).
4. Seja curto e verificável (“rode `npm test` antes de commitar”, não “teste suas mudanças”).
5. Cite a fonte no arquivo: número `NNN`, URL e data de acesso. Em skills e comandos, use o frontmatter `metadata` (campo oficial). Em agentes, coloque a citação no corpo. Em `claude-app/`, use o comentário HTML do template (fonte, URL, acesso, páginas oficiais conferidas e se foi testado).
6. Exemplos devem ser mínimos e válidos. Frontmatter YAML precisa começar na primeira linha (`---`). YAML inválido ou chave desconhecida faz o Claude Code ignorar campos.
7. Artefatos de `claude-app/` não têm cópia em `.claude/`: o app Claude não lê este repositório. Se o artefato do Claude Code também deve carregar neste repositório (skill, agente, estilo usados no próprio pipeline), atualize a cópia correspondente em `.claude/` e mantenha as duas iguais. O pacote instalável canônico é sempre `claude/`. Isso **não** substitui o campo `destino`: a ponte `.claude/` daqui não é a instalação no projeto do Alexandre.
8. Não substitua, no projeto de destino, um `CLAUDE.md` ou `settings.json` já afiado: aqui só preparamos o pacote para cópia ou mescla seletiva. O README de cada tipo em `claude/` deve continuar explicando para onde copiar.
9. Não cole texto substancial de artigo com direitos autorais.

## 9. Validar

Validação mecânica (obrigatória antes de fechar a fonte):

- Markdown com frontmatter: a primeira linha é `---`; os nomes dos campos batem com a tabela oficial do tipo (veja `referencias/praticas-oficiais.md`).
- O destino de instalação está declarado e é `projeto` ou `usuario` (em `claude/`), ou `app-claude`, `projeto-claudeai` ou `configuracoes` (em `claude-app/`).
- Em `claude-app/`, os links relativos e as URLs oficiais citadas abrem (confira um por um) e o cabeçalho traz a data da conferência oficial e se foi testado.
- JSON (`settings`, blocos de hook, MCP): `python3 -m json.tool caminho/arquivo.json` deve sair sem erro.
- Script de hook: `bash -n caminho/script.sh` (ou equivalente) e bit de execução (`chmod +x`) no macOS/Linux.
- Nomes de pasta/arquivo em kebab-case ASCII, sem colidir com skill ou agente já existente.
- Trechos de `CLAUDE.md`: continue cabendo no espírito do alvo oficial (arquivo final curto, de preferência abaixo de 200 linhas).

Validação no Claude Code: copie ou use `--add-dir` / `/add-dir` neste repositório, confira com `/context`, `/doctor`, `/hooks` ou `/mcp` conforme o tipo, e tente invocar a skill ou o agente. **Se o artefato ainda não foi testado numa sessão do Claude Code, a fonte permanece `parcial` até o teste.** A checagem mecânica sozinha não autoriza `publicado`.

Validação no app Claude (artefatos de `claude-app/`): siga o passo a passo do próprio artefato no app, na versão e no plano que ele exige, e registre como e em que versão foi testado. **Sem esse teste, a fonte permanece `parcial`.** Fonte de tema `ambos` só chega a `publicado` com os dois testes.

## 10. Registrar e fechar a fonte

1. Complete `fontes/NNN-slug.md`: insights, artefatos (com destino), duplicatas, divergências, conflitos com os dois lados visíveis, pendências e status.
2. Atualize a linha em `fontes/INDICE.md` (tema, resumo, artefatos gerados, status).
3. Se nasceu uma convenção ou premissa nova, atualize o diário — e, se for o caso, a seção Premissas — em `CONTEXTO.md`.
4. Escolha o status:
   - `publicado` — nota e artefatos (se houver) gravados, testados no Claude Code ou no app Claude (conforme o tema), commitados em `main` e **já enviados (push) ao GitHub**;
   - `parcial` — algo útil foi gravado, mas ficou pendência (página incompleta, teste no Claude Code ou no app Claude ainda não feito, push pendente, dúvida de classificação);
   - `descartado` — o site não rendeu artefato nem para o Claude Code nem para o app Claude; a nota explica o porquê. Reserve o número e **commit a nota e o índice** mesmo assim.

## 11. Commit

Na branch `main`, mensagem em **pt-BR**.

- Uma fonte isolada: um commit.
- Vários links no mesmo pedido: **um único commit para o lote**.
- Fonte descartada: entra no commit (do lote ou sozinha), com a nota e o índice.

Exemplos:

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

Se a fonte só gera uma correção mínima num artefato existente, a mensagem deve dizer isso. O modo de trabalho combinado é commit direto em `main`, seguido de push. **Sem o push no GitHub, nenhuma fonte vai para `publicado`.** Se o push ficar pendente, o status permanece `parcial` (ou `descartado`, se for o caso) e o relatório deixa o push explícito.

## 12. Relatório final para o Alexandre

Feche o ciclo com um relatório curto neste formato (no caso de lote, um bloco por fonte, mais uma linha no topo listando o lote e o commit):

```text
Fonte NNN — <título>
URL: <canônica>
Tema: claude-code | claude-app | ambos
Acesso: AAAA-MM-DD HH:MM (America/Sao_Paulo)
Credibilidade: <oficial | comunidade | marketing>, publicado/atualizado em <data ou “sem data”>, versão citada <se houver>

O que rendeu:
- <caminho do artefato> — destino: projeto | usuario | app-claude | projeto-claudeai | configuracoes — <uma linha do que faz e como instalar ou usar>

O que não rendeu (e por quê):
- <insight descartado, trecho de Cursor/outro agente ignorado que não serve nem ao Claude Code nem ao app Claude, ou página não lida>

Conferência oficial: <ok / divergência (resumo dos dois lados) / síntese do repo atualizada>
Conflitos entre fontes: <nenhum / os dois lados, em 2–4 linhas, sem escolha silenciosa>
Duplicatas: <nenhuma / unido ao artefato X>
Teste (Claude Code e/ou app Claude): <feito (como, em que versão) | não feito — fonte permanece parcial>
Push no GitHub: <feito (SHA/link) | pendente — fonte não vai para publicado>
Status no índice: publicado | parcial | descartado
Pendências: <nenhuma, ou teste, push, paywall, etc.>

Como usar: <uma ou duas linhas com o destino e o caminho de instalação ou de uso>
```

Não antecipe o próximo pedido. Se o lote ainda tiver fonte em `parcial`, diga o que falta para cada uma.

## Checklist de fechamento

- [ ] URL canônica, número e slug reservados no índice (`em andamento` no início); lote com um número por link
- [ ] Nota `fontes/NNN-slug.md` criada a partir do template
- [ ] Página principal lida; extras justificados e listados; bloqueios registrados sem invenção
- [ ] Tema definido (`claude-code`, `claude-app` ou `ambos`); de links vizinhos, só o que serve ao Claude Code ou ao app Claude foi extraído
- [ ] Credibilidade e data (autor, veículo, recência, versão) anotadas
- [ ] Insights filtrados pela pergunta “muda o uso do Claude Code ou do app Claude?”
- [ ] Caminho e frontmatter conferidos na documentação oficial vigente
- [ ] Conflitos entre fontes descritos com os dois lados visíveis (nota e relatório)
- [ ] Duplicata buscada em `claude/`, em `claude-app/` e no índice; união registrada se houver
- [ ] Tipo escolhido pela tabela de classificação; template usado
- [ ] Destino de instalação declarado no artefato (`projeto` ou `usuario` em `claude/`; `app-claude`, `projeto-claudeai` ou `configuracoes` em `claude-app/`)
- [ ] Citação da fonte no artefato; cópia em `.claude/` atualizada se o pipeline daqui depender dela
- [ ] JSON / frontmatter / hook validados mecanicamente
- [ ] Teste feito no Claude Code (`claude/`) ou no app Claude (`claude-app/`); se não, status `parcial`
- [ ] Índice (com a coluna `Tema`) e nota fechados com o status correto; diário de `CONTEXTO.md` atualizado se couber
- [ ] Commit em `main` (um por fonte isolada, ou um só para o lote), incluindo descartes
- [ ] Push no GitHub feito antes de marcar `publicado`
- [ ] Relatório no formato da seção 12 enviado ao Alexandre
