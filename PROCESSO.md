# Processo por site

Pipeline repetível para cada link enviado por Alexandre. Execute os passos na ordem. Não pule a verificação oficial nem a checagem de duplicata.

A skill [`claude/skills/processar-fonte/SKILL.md`](claude/skills/processar-fonte/SKILL.md) é a versão invocável deste processo (`/processar-fonte`). O subagente [`claude/agents/extrator-fonte.md`](claude/agents/extrator-fonte.md) isola a leitura e a extração.

## Pré-requisitos

- Ter lido [`CONTEXTO.md`](CONTEXTO.md) nesta sessão.
- Ter à mão a documentação oficial relevante (atalhos em [`referencias/praticas-oficiais.md`](referencias/praticas-oficiais.md)). Se o material da fonte contradisser a documentação oficial sobre caminhos ou frontmatter, **prevalece a documentação oficial**; anote a divergência na nota da fonte.

## Passos

### 1. Capturar o link

Anote a URL canônica (sem rastreadores de query, se possível). Defina:

- o próximo número livre em [`fontes/INDICE.md`](fontes/INDICE.md) (`001`, `002`, …);
- um slug curto em kebab-case ASCII (domínio ou título reduzido).

### 2. Registrar no índice (status inicial)

Adicione uma linha em `fontes/INDICE.md` com status `em andamento` e a data de hoje no fuso America/Sao_Paulo. Assim outra sessão não pega o mesmo número.

### 3. Criar a nota da fonte

Copie [`templates/fonte.md`](templates/fonte.md) para `fontes/NNN-slug.md` e preencha metadados (URL, título, data de acesso, autor se houver).

### 4. Buscar e ler

Leia a página (e só as páginas extras realmente necessárias: um guia pai, um README oficial citado). Não siga uma trilha infinita de links. Se o site bloquear a captura, registre o bloqueio na nota e peça a Alexandre um recorte ou outro acesso — não invente o conteúdo.

### 5. Extrair insights acionáveis

Pergunte, para cada ideia: **isso muda como Alexandre usa o Claude Code de forma concreta?** Descarte marketing, repetição do óbvio e o que já está coberto em `claude/` ou em `referencias/praticas-oficiais.md`.

Para cada insight, anote na nota da fonte:

- o que fazer (ação);
- quando faz diferença;
- o tipo de artefato provável;
- a passagem de origem (parágrafo ou seção, não um recorte longo).

### 6. Classificar o tipo de artefato

Use esta tabela (baseada em [Extend Claude Code](https://code.claude.com/docs/en/features-overview) e nas [melhores práticas](https://code.claude.com/docs/en/best-practices)):

| Se o insight é… | Grave como… | Destino |
| --- | --- | --- |
| Fato ou regra curta que deve valer em **toda** sessão (comando de build, convenção, “sempre faça X”) e que o Claude **não** descobre lendo o repo | Trecho de `CLAUDE.md` | `claude/snippets/` e, se for do starter, candidato a `claude/CLAUDE.md` |
| Instrução que vale só para certos caminhos ou tipos de arquivo | Regra | `claude/rules/<nome>.md` com frontmatter `paths` |
| Procedimento de vários passos, checklist, material de referência longo ou fluxo que se invoca com `/nome` | Skill | `claude/skills/<nome>/SKILL.md` |
| Atalho antigo de um único arquivo Markdown (evitar para trabalho novo) | Comando | `claude/commands/<nome>.md` |
| Trabalho que deve rodar isolado (pesquisa, revisão, extração) e devolver um resumo | Subagente | `claude/agents/<nome>.md` |
| Tom, papel ou formato de **todas** as respostas da sessão | Estilo de saída | `claude/output-styles/<nome>.md` |
| Algo que **precisa** acontecer ou ser bloqueado sempre, sem depender do modelo | Hook e/ou `permissions.deny` | script em `claude/hooks/` + bloco em `claude/settings/` |
| Conexão com ferramenta externa (issue tracker, browser, API) | MCP | `templates/mcp.json` adaptado em `claude/settings/` ou nota de instalação |
| Conjunto reutilizável de vários dos itens acima para distribuir | Plugin (só se realmente houver pacote) | documentar no índice; não inventar manifesto sem necessidade |

Na dúvida entre `CLAUDE.md` e skill: se for procedimento ou só importar em alguns momentos, vire skill (o corpo só entra no contexto quando usado). Na dúvida entre skill e hook: se “quase sempre” não for suficiente, vire hook ou `deny`.

### 7. Verificar na documentação oficial

Confira caminho, frontmatter e formato no guia oficial do tipo (veja os modelos em `templates/` e a síntese em `referencias/praticas-oficiais.md`). Corrija nomes de campos (hífens, camelCase de agentes como `disallowedTools`, etc.). Não invente chaves.

### 8. Evitar duplicação

Busque em `claude/`, `fontes/INDICE.md` e no `CLAUDE.md` starter. Se já existir o mesmo conselho, una as fontes na nota e, se o artefato melhorar, edite-o no lugar em vez de criar outro.

### 9. Escrever o artefato

- Use o template do tipo em `templates/`.
- Seja curto e verificável (“rode `npm test` antes do commit”, não “teste suas mudanças”).
- Cite a fonte (`NNN`, URL, data de acesso) no arquivo.
- Exemplos devem ser mínimos e válidos (o Claude Code carrega frontmatter inválido como se os campos não existissem).

### 10. Registrar e fechar a fonte

- Complete `fontes/NNN-slug.md` (insights, artefatos gerados, divergências, status).
- Atualize a linha em `fontes/INDICE.md` (resumo, artefatos, status `publicado` ou `parcial`).
- Se nasceu uma convenção ou decisão nova, acrescente o diário em `CONTEXTO.md`.

### 11. Commit

Na branch `main`, com mensagem em pt-BR, por exemplo:

```text
Adiciona fonte 003 (título curto) e skill foo

Lê <url> e extrai o fluxo de /foo como skill, conferido na doc de skills.
```

Um commit por fonte é o padrão. Se a fonte só gerar uma correção mínima num artefato já existente, a mensagem deve dizer isso.

## Critérios de qualidade

Um artefato só entra no repositório se atender a todos:

1. **Conciso** — sem preâmbulo inútil; `CLAUDE.md` e descrições de skill/agente curtos (a `description` entra no contexto de toda sessão).
2. **Acionável** — dá para executar ou verificar; não é opinião vaga.
3. **Conferido** — caminhos e frontmatter batem com a documentação oficial vigente.
4. **Sem duplicata** — não repete outro artefato nem o starter, salvo união explícita de fontes.
5. **Com atribuição** — URL e data de acesso rastreadas no índice e na nota.
6. **Sem cópia substancial** — não reproduz o artigo; resume e aponta.
7. **Instalável** — o README do tipo em `claude/` explica para onde copiar.

## Estados no índice

| Status | Significado |
| --- | --- |
| `em andamento` | Número reservado; leitura ou redação em curso |
| `publicado` | Nota e artefatos gravados e commitados |
| `parcial` | Algo útil foi gravado, mas ficou pendência (página incompleta, dúvida de classificação) |
| `descartado` | O site não rendeu artefato; a nota explica o porquê |

## O que não fazer

- Não gravar artefato “para ter um arquivo” se não houver insight acionável.
- Não colocar procedimento longo no `CLAUDE.md` starter.
- Não tratar dica de blog como formato oficial quando a documentação da Anthropic disser outra coisa.
- Não apagar conteúdo existente do repositório para “começar de novo”.
