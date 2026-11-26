# Contexto de trabalho

Este arquivo é o contexto persistente do repositório. Qualquer sessão futura deve lê-lo **antes** de processar um site novo, e atualizá-lo quando uma decisão ou convenção mudar.

Última atualização: 25 de novembro de 2026, 21:00 (America/Sao_Paulo).

## Objetivo

Ler sites (links enviados por Alexandre) sobre Claude e Claude Code da Anthropic e transformá-los em instruções úteis para **aperfeiçoar o uso do Claude Code**. O passo a passo e todos os arquivos gerados vivem neste repositório: [AlexandreD3v/claudinhomelhorias](https://github.com/AlexandreD3v/claudinhomelhorias).

Ainda não processamos o primeiro site. Esta montagem inicial só prepara o processo, o contexto e o esqueleto de artefatos.

## Perfil relevante

- Nome: Alexandre Jackson Correa.
- Idioma de trabalho neste repo: pt-BR.
- GitHub: [AlexandreD3v](https://github.com/AlexandreD3v).
- Contexto profissional útil para exemplos futuros (não inventar artefatos NetSuite sem fonte): desenvolvimento NetSuite / SuiteScript, atua na Qlik, mantém o SuiteScript Toolkit, transição para PJ.
- Uso pretendido dos artefatos: um projeto específico ou `~/.claude` (todos os projetos), conforme fizer sentido.

## Convenções

- Textos em português brasileiro. Nomes de arquivos, skills, comandos e agentes em kebab-case ASCII (`processar-fonte`, não `processarFonte` nem `processar_fonte`).
- Numeração de fontes: `001`, `002`, … (três dígitos). Slug curto derivado do título ou do domínio, sem acento.
- Arquivo de notas: `fontes/NNN-slug.md`, criado a partir de `templates/fonte.md`.
- Artefatos instaláveis: sempre em `claude/`, no subdiretório do tipo. Cada artefato cita a fonte (`NNN` + URL) no próprio arquivo ou no frontmatter `metadata`.
- Preferir skill a comando avulso para trabalho novo. Manter `.claude/commands/` só quando o usuário já tiver esse hábito ou o material da fonte for claramente um atalho de uma linha.
- `CLAUDE.md` (projeto ou usuário) fica curto, concreto e só com o que o Claude não descobre lendo o repositório. Alvo oficial: menos de 200 linhas por arquivo. Procedimento de vários passos vai para skill. Instrução que vale só para certos arquivos vai para `.claude/rules/` com `paths`.
- O que não pode falhar (nunca ler `.env`, sempre formatar, nunca editar pasta gerada) vira hook, `permissions.deny` ou setting gerenciado — não uma linha de `CLAUDE.md`.
- Não duplicar artefato existente: antes de gravar, procurar em `claude/` e no índice. Se for aprimoramento, edite o artefato e registre a fonte adicional.
- Não colar texto substancial de artigos protegidos. Resumir, extrair o acionável e citar a URL.
- Conferir caminhos, frontmatter e formato na documentação oficial vigente (links em `referencias/praticas-oficiais.md`) antes de gravar.
- Commits na branch padrão `main`, com mensagens claras em pt-BR. Este é um repositório pessoal; commits diretos são o modo de trabalho combinado.
- Datas neste repo, quando forem locais, usam o fuso **America/Sao_Paulo** e deixam o fuso explícito.

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

## Como retomar uma sessão

1. Ler este arquivo e a última seção do diário.
2. Abrir [`fontes/INDICE.md`](fontes/INDICE.md) e ver o que já foi processado ou ficou em andamento.
3. Seguir [`PROCESSO.md`](PROCESSO.md) para o próximo link.
4. Se a documentação oficial tiver mudado, atualizar `referencias/praticas-oficiais.md` e o diário antes de gravar artefatos com formato novo.
