# Instruções deste repositório

Este repositório guarda o processo e os artefatos de customização do Claude Code do Alexandre. Idioma: **pt-BR**.

## Antes de qualquer site novo

1. Leia `CONTEXTO.md` (premissas, decisões e convenções vigentes).
2. Consulte `fontes/INDICE.md` para numeração e duplicatas.
3. Siga `GUIA-ANALISE-SITE.md` à risca (`PROCESSO.md` só resume o contrato de qualidade). Respeite as premissas confirmadas em `CONTEXTO.md` (destino no artefato, `publicado` só após push, fonte `parcial` até o teste no Claude Code, um commit por lote, conflitos com os dois lados visíveis). A skill `/processar-fonte` é a versão invocável; o subagente `extrator-fonte` isola a leitura.

## O que não fazer

- Não invente frontmatter, caminhos ou nomes de campos. Confira em `referencias/praticas-oficiais.md` e na documentação oficial ligada lá.
- Não substitua um `CLAUDE.md` ou `settings.json` de outro projeto. Artefatos em `claude/` são para cópia seletiva.
- Não cole texto substancial de artigos com direitos autorais.
- Não apague conteúdo existente para recomeçar.
- Não descreva neste arquivo a árvore do repositório: ela já está no `README.md`. Só anote aqui o que não está óbvio no código.

## Gravação

- Notas em `fontes/NNN-slug.md` a partir de `templates/fonte.md`.
- Artefatos instaláveis em `claude/`, com citação da fonte.
- Ponte para o Claude Code carregar skills/agentes desta pasta: `.claude/`.
- Commits diretos em `main`, mensagem em pt-BR: um por fonte isolada, ou um só para o lote. `publicado` só depois do push no GitHub.
