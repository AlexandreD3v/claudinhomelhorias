# Contexto de trabalho

Este arquivo é o contexto persistente do repositório. Qualquer sessão futura deve lê-lo **antes** de processar um site novo, e atualizá-lo quando uma decisão ou convenção mudar.

Última atualização: 26 de novembro de 2026, 08:35 (America/Sao_Paulo).

## Objetivo

Ler sites (links enviados por Alexandre) sobre Claude e Claude Code da Anthropic e transformá-los em instruções úteis para **aperfeiçoar o uso do Claude Code** (pacote `claude/`) **e do app Claude** — chat, Claude Desktop no Mac e no Windows, claude.ai (pacote `claude-app/`). O passo a passo e todos os arquivos gerados vivem neste repositório: [AlexandreD3v/claudinhomelhorias](https://github.com/AlexandreD3v/claudinhomelhorias).

O escopo do app Claude entrou em 26 de novembro de 2026 (veja Premissas). O que já foi processado está em [`fontes/INDICE.md`](fontes/INDICE.md).

## Perfil relevante

- Nome: Alexandre Jackson Correa.
- Idioma de trabalho neste repo: pt-BR.
- GitHub: [AlexandreD3v](https://github.com/AlexandreD3v).
- Contexto profissional útil para exemplos futuros (não inventar artefatos NetSuite sem fonte): desenvolvimento NetSuite / SuiteScript, atua na Qlik, mantém o SuiteScript Toolkit, transição para PJ.
- Uso pretendido dos artefatos: no Claude Code, um projeto (`.claude/`) ou `~/.claude` (todos os projetos); no app Claude, o app, um Projeto do claude.ai ou as Configurações. Cada artefato declara o destino explicitamente (`projeto` ou `usuario` em `claude/`; `app-claude`, `projeto-claudeai` ou `configuracoes` em `claude-app/`).

## Convenções

- Textos em português brasileiro. Nomes de arquivos, skills, comandos e agentes em kebab-case ASCII (`processar-fonte`, não `processarFonte` nem `processar_fonte`).
- Numeração de fontes: `001`, `002`, … (três dígitos). Slug curto derivado do título ou do domínio, sem acento. Cada fonte tem um **tema** (`claude-code`, `claude-app` ou `ambos`), na nota e na coluna `Tema` do índice.
- Arquivo de notas: `fontes/NNN-slug.md`, criado a partir de `templates/fonte.md`.
- Artefatos do Claude Code: em `claude/`, no subdiretório do tipo. Artefatos do app Claude (guias, instruções de projeto, estilos, prompts, configurações): em `claude-app/`, no subdiretório do tipo. As duas pastas ficam lado a lado no `main`. Cada artefato cita a fonte (`NNN` + URL) e declara o **destino de instalação**: `projeto` (`.claude/` do projeto, ou `./CLAUDE.md` / `./.mcp.json` na raiz) ou `usuario` (`~/.claude/`, ou `~/.claude.json` para MCP pessoal). Convenção do campo: `templates/README.md`.
- Preferir skill a comando avulso para trabalho novo. Manter `.claude/commands/` só quando o usuário já tiver esse hábito ou o material da fonte for claramente um atalho de uma linha.
- `CLAUDE.md` (projeto ou usuário) fica curto, concreto e só com o que o Claude não descobre lendo o repositório. Alvo oficial: menos de 200 linhas por arquivo. Procedimento de vários passos vai para skill. Instrução que vale só para certos arquivos vai para `.claude/rules/` com `paths`.
- O que não pode falhar (nunca ler `.env`, sempre formatar, nunca editar pasta gerada) vira hook, `permissions.deny` ou setting gerenciado — não uma linha de `CLAUDE.md`.
- Não duplicar artefato existente: antes de gravar, procurar em `claude/`, em `claude-app/` e no índice. Se for aprimoramento, edite o artefato e registre a fonte adicional.
- Não colar texto substancial de artigos protegidos. Resumir, extrair o acionável e citar a URL.
- Conferir caminhos, frontmatter e formato na documentação oficial vigente (links em `referencias/praticas-oficiais.md`) antes de gravar.
- Commits na branch padrão `main`, com mensagens claras em pt-BR. Uma fonte isolada gera um commit; vários links de uma vez geram **um único commit para o lote**. Este é um repositório pessoal; commits diretos são o modo de trabalho combinado. O status `publicado` só vale depois do push no GitHub.
- Datas neste repo, quando forem locais, usam o fuso **America/Sao_Paulo** e deixam o fuso explícito.

## Premissas

Premissas vigentes, confirmadas por Alexandre em **25 de novembro de 2026** (America/Sao_Paulo), inclusive as que estavam em aberto. Qualquer mudança futura entra no diário e nesta seção.

### Combinadas

- **Objetivo.** Transformar sites indicados por Alexandre sobre Claude e Claude Code (Anthropic) em instruções úteis para aperfeiçoar o uso do Claude Code. O processo e todos os arquivos gerados vivem em [AlexandreD3v/claudinhomelhorias](https://github.com/AlexandreD3v/claudinhomelhorias).
- **Público.** Alexandre Jackson Correa. Os artefatos servem ao uso dele no Claude Code. Cada um declara se a instalação é no projeto (`.claude/`) ou em `~/.claude`. O contexto profissional (NetSuite / SuiteScript, Qlik, SuiteScript Toolkit, transição para PJ) informa exemplos futuros; não se inventa artefato NetSuite sem fonte.
- **Idioma.** Textos do repositório em pt-BR. Nomes de arquivos, skills, comandos e agentes em kebab-case ASCII.
- **Onde os artefatos vivem.** Pacote instalável do Claude Code canônico em `claude/`, no subdiretório do tipo. Pacote do app Claude em `claude-app/` (sem instalação por cópia: o app não lê o repositório). A pasta `.claude/` deste repo é só ponte para carregar skills/agentes/estilos daqui (e via `--add-dir`). A instalação em outro lugar segue o campo `destino` do artefato e o README de instalação.
- **Tipos de artefato.** Claude Code: trecho de `CLAUDE.md`, regra (`paths`), skill (preferida para trabalho novo), comando legado, subagente, estilo de saída, hook e/ou `permissions.deny`/settings, MCP, plugin (só se houver pacote de verdade). App Claude: guia de uso, instrução de projeto, estilo ou preferência, prompt, configuração. Classificação e destinos: tabelas em [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md).
- **Oficial prevalece no formato.** Caminhos, frontmatter e comportamento do produto seguem a documentação oficial vigente (`code.claude.com` para o Claude Code; `claude.com/resources`, `support.claude.com` e `anthropic.com/news` para o app Claude; atalhos em `referencias/praticas-oficiais.md`). Dica de blog que contradisser o oficial não dita o artefato; a divergência vai para a nota. Fluxo extraoficial acionável que não contradiz o oficial pode ser gravado, com atribuição, sem ser apresentado como doc da Anthropic.
- **Citação e direitos autorais.** Cada artefato e a nota da fonte citam `NNN`, URL e data de acesso (America/Sao_Paulo). Não se cola texto substancial de artigo protegido: resume-se, extrai-se o acionável e aponta-se a seção.
- **Deduplicação.** Antes de gravar, busca-se em `claude/` e no índice. Aprimoramento edita o artefato existente e registra a fonte adicional.
- **Qualidade.** Artefato só entra se for conciso, acionável, conferido no oficial, sem duplicata, com atribuição, sem cópia substancial e instalável (critérios em [`PROCESSO.md`](PROCESSO.md)).
- **Captura incompleta.** Paywall, login, bloqueio, vídeo sem transcrição ou PDF inacessível: não se inventa o conteúdo; pede-se recorte ou outro acesso ao Alexandre.
- **Versionamento.** Repositório pessoal; commits diretos em `main`, mensagens em pt-BR. Uma fonte isolada gera um commit; vários links enviados de uma vez geram um único commit para o lote. Datas locais com fuso America/Sao_Paulo explícito.
- **“Pronto” para uma fonte.** Nota completa, índice atualizado, artefatos (se houver) com destino declarado e validados, relatório no formato do guia, commit em `main` e, para status `publicado`, **push no GitHub**. Sem teste no Claude Code (artefato de `claude/`) ou no app Claude (artefato de `claude-app/`), a fonte permanece `parcial`. Fonte `descartada` ainda assim ganha commit (nota + índice).

### Confirmadas por Alexandre em 25 de novembro de 2026

- **Links vizinhos.** Se o site for sobretudo sobre Cursor, outro agente ou prompting genérico, extrair **só o que se aplica ao Claude Code** — e, desde 26 de novembro de 2026, também ao app Claude (veja a seção abaixo). Não recusar o link de cara e não forçar artefato fora de escopo.
- **Destino de instalação.** Cada artefato indica explicitamente se vai no projeto (`.claude/`, ou `./CLAUDE.md` / `./.mcp.json` na raiz) ou em `~/.claude` (ou `~/.claude.json` para MCP pessoal). O campo é obrigatório nos templates e nos artefatos; valores: `projeto` ou `usuario`.
- **Status `publicado`.** Só depois do push no GitHub. Commit local não basta. Enquanto o push estiver pendente, a fonte não vai para `publicado` (fica `parcial` se o restante já estiver pronto).
- **Conflito entre fontes.** Mostrar os dois lados no relatório e na nota da fonte, **sem escolher silenciosamente**. Pode-se recomendar o alinhamento com a documentação oficial vigente, mas os dois lados permanecem visíveis.
- **Artefato não testado.** A checagem mecânica (frontmatter, JSON, `bash -n`, links) é sempre obrigatória. Se o artefato ainda não foi testado numa sessão do Claude Code (`claude/`) ou no app Claude (`claude-app/`), a fonte fica `parcial` até o teste.
- **Vários links de uma vez.** Um commit só para o lote (todas as fontes daquele pedido), não um commit por link.
- **Fonte descartada.** Reservar o número e commitar a nota e o índice mesmo assim, para o motivo do descarte não se perder. Desde 26 de novembro de 2026, só se descarta o que não serve nem ao Claude Code nem ao app Claude.

### Confirmadas por Alexandre em 26 de novembro de 2026

- **Escopo ampliado ao app Claude.** O conteúdo do app Claude (chat e Claude Desktop, Mac e Windows, claude.ai) também passa a ser guardado, numa pasta nova `claude-app/` no `main`, ao lado de `claude/`, que continua sendo o pacote do Claude Code. Sem branch.
- **Regra de extração.** De cada site, extrair o que se aplica ao Claude Code (vai para `claude/`) ou ao app Claude (vai para `claude-app/`). Descartar só o que não serve a nenhum dos dois. Isso ampliou a premissa dos links vizinhos de 25 de novembro, que falava só do Claude Code.
- **Artefatos do app.** Guias de uso, instruções de projeto ou estilo, prompts e configurações do app. Cada um indica o destino: `app-claude` (app Claude Mac/Windows), `projeto-claudeai` (Projeto do claude.ai) ou `configuracoes` (Configurações). O README de [`claude-app/`](claude-app/) explica o que entra e como usar.
- **Tema no índice.** A tabela de [`fontes/INDICE.md`](fontes/INDICE.md) ganha a coluna `Tema` (`claude-code`, `claude-app` ou `ambos`).
- **Demais premissas.** Valem também para o app: destino declarado, conferência na doc oficial, dois lados em conflitos, `publicado` só após push, não testado deixa a fonte `parcial`, um commit por lote.

## Estado do repositório na montagem

- O repositório GitHub foi criado em 25 de novembro de 2026, 20:57 (America/Sao_Paulo) (`2026-11-25T23:57:13Z`). Estava **vazio**: sem commits, sem arquivos, branch padrão `main`, visibilidade privada.
- Nada foi apagado. A estrutura abaixo é a primeira população.

## Diário de decisões

### 2026-11-25 — Estrutura inicial e práticas oficiais

- Fontes oficiais consultadas (docs em inglês, síntese em pt-BR): `code.claude.com` — melhores práticas, memória/CLAUDE.md, skills, subagentes, hooks, diretório `.claude`, visão de extensões, estilos de saída, MCP e plugins. Detalhe e URLs: [`referencias/praticas-oficiais.md`](referencias/praticas-oficiais.md).
- O desenho pedido (`README`, `CONTEXTO`, `PROCESSO`, `fontes/`, `claude/`, `templates/`) foi mantido e **ampliado** com `claude/rules/`, `claude/output-styles/`, `templates/mcp.json` e `referencias/`, porque a documentação oficial trata esses mecanismos no mesmo conjunto de customização.
- Hooks não têm uma pasta mágica lida pelo Claude Code. A configuração vive em `settings.json` (projeto, local ou usuário); os scripts podem ficar em `claude/hooks/` e são referenciados pelo campo `command`.
- Comandos customizados foram fundidos em skills. Arquivos em `.claude/commands/` continuam válidos; para artefato novo, gravar skill em `claude/skills/<nome>/SKILL.md`. Para impedir invocação automática, usar `disable-model-invocation: true`.
- A pasta `claude/` é o pacote portátil (visível no GitHub). A pasta `.claude/` deste repo é uma ponte fina para o Claude Code carregar skills e agentes quando a sessão abre aqui ou quando se usa `--add-dir`.
- Foi incluída a skill `processar-fonte` e o subagente `extrator-fonte` para o próprio pipeline — não vêm de um site externo, vêm deste processo.
- O `CLAUDE.md` de `claude/` é um starter curto inspirado nas práticas oficiais, para copiar com critério para um projeto ou para `~/.claude/CLAUDE.md`. O `CLAUDE.md` da raiz vale só para trabalhar **neste** repositório.

### 2026-11-25 — Premissas e guia de análise (antes do primeiro link)

- Alexandre pediu para confirmar as premissas e ter um artefato com o passo a passo de análise de um site, ainda antes do primeiro link.
- As premissas foram extraídas de `CONTEXTO.md`, `PROCESSO.md` e da pesquisa oficial de 25 de novembro de 2026, e listadas na seção Premissas deste arquivo. Ainda nesta data, Alexandre confirmou as que estavam em aberto (entrada seguinte do diário).
- O passo a passo operacional passou a viver em [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md). `PROCESSO.md` ficou como contrato curto e aponta para o guia, para não haver dois fluxos divergentes.
- O conteúdo da montagem inicial foi publicado no GitHub em `aac9603` (sobre um commit de README do dono). O histórico git deste checkout local diverge; o conteúdo dos arquivos é o mesmo.

### 2026-11-25 — Premissas em aberto confirmadas por Alexandre

- Links vizinhos: extrair só o que se aplica ao Claude Code.
- Destino de instalação: campo obrigatório em todo artefato e template (`projeto` = `.claude/` do projeto; `usuario` = `~/.claude`).
- Status `publicado` só depois do push no GitHub; commit local não basta.
- Conflito entre fontes: mostrar os dois lados na nota e no relatório, sem escolher silenciosamente.
- Artefato não testado no Claude Code: a fonte fica `parcial` até o teste.
- Vários links de uma vez: um único commit para o lote.
- Fonte descartada: commitar nota e índice mesmo assim.
- O guia, o processo, os templates e a skill `processar-fonte` foram alinhados a essas decisões.

### 2026-11-26 — Escopo ampliado ao app Claude

- Alexandre confirmou que o conteúdo do app Claude (chat/Desktop, Mac e Windows) também passa a ser guardado, na pasta nova `claude-app/`, no `main`, ao lado de `claude/`. Sem branch.
- Regra nova: de cada site, extrair o que se aplica ao Claude Code (`claude/`) ou ao app Claude (`claude-app/`); descartar só o que não serve a nenhum dos dois. Ela substitui a regra de 25 de novembro de “só o que se aplica ao Claude Code”.
- Destinos do app: `app-claude`, `projeto-claudeai`, `configuracoes`. Sem instalação por cópia de arquivo.
- Índice com a coluna `Tema`. Preenchido: 001 `claude-code`, 002 `claude-code`, 003 `claude-app`.
- Fonte 003 (9to5Mac, Install as app), antes `descartado`, foi reprocessada: virou guia em `claude-app/guias/` e passou a `parcial`, porque não foi testada no app Claude.
- O guia de análise, o processo, os templates, a skill `processar-fonte` e o subagente `extrator-fonte` foram alinhados ao escopo novo.
## Como retomar uma sessão

1. Ler este arquivo (incluindo a seção Premissas) e a última entrada do diário.
2. Abrir [`fontes/INDICE.md`](fontes/INDICE.md) e ver o que já foi processado ou ficou em andamento.
3. Seguir [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md) para o próximo link. [`PROCESSO.md`](PROCESSO.md) é o contrato curto (qualidade e estados) e aponta para o guia.
4. Se a documentação oficial tiver mudado, atualizar `referencias/praticas-oficiais.md` e o diário antes de gravar artefatos com formato novo.
