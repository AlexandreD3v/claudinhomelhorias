---
name: processar-fonte
description: >
  Lê um site sobre Claude ou Claude Code, extrai insights acionáveis e
  grava artefatos neste repositório (claudinhomelhorias) seguindo PROCESSO.md.
  Use quando o usuário enviar um link, pedir para processar uma fonte,
  ou transformar um artigo em skill, CLAUDE.md, hook, agente ou setting.
when_to_use: >
  O usuário cola uma URL de artigo, guia ou post sobre Claude Code,
  ou diz “processa esta fonte”, “transforma este site em instruções”.
argument-hint: "[url]"
arguments: [url]
allowed-tools: Read Grep Glob WebFetch WebSearch Bash
metadata:
  fonte: setup-inicial
  origem: "Processo inicial do repositório claudinhomelhorias"
  acesso: "2026-11-25"
---

# Processar fonte

Canonical: siga `PROCESSO.md` na raiz do repositório **claudinhomelhorias** (https://github.com/AlexandreD3v/claudinhomelhorias). Este texto é o mesmo pipeline, para a skill funcionar mesmo se você estiver numa sessão com `--add-dir`. Trabalhe no checkout desse repositório; não grave os artefatos no projeto errado.

Idioma dos arquivos gerados: **pt-BR**. Nomes de skill/agente/comando: kebab-case ASCII.

## Entrada

A URL é `$url` (ou `$ARGUMENTS` se vier solta). Se faltar o link, peça antes de inventar uma fonte.

## Passos

1. Leia `CONTEXTO.md` e `fontes/INDICE.md`. Reserve o próximo número livre (`001`, `002`, …) e um slug. Coloque a linha no índice com status `em andamento`.
2. Crie `fontes/NNN-slug.md` a partir de `templates/fonte.md`.
3. Busque e leia a página (e só as páginas extras realmente necessárias). Se a captura falhar, registre o bloqueio e pare — não invente o conteúdo.
4. Extraia só insights **acionáveis** para o uso do Claude Code. Descarte marketing e o que já está em `claude/` ou em `referencias/praticas-oficiais.md`. Pode delegar a leitura e a extração ao subagente `extrator-fonte`.
5. Classifique cada insight com a tabela de `PROCESSO.md` (trecho de CLAUDE.md, regra, skill, comando legado, subagente, estilo, hook/settings, MCP, plugin).
6. Confira caminho e frontmatter na documentação oficial vigente (atalhos em `referencias/praticas-oficiais.md`). Se o site divergir do oficial, o artefato segue o oficial e a divergência vai para a nota.
7. Evite duplicata: busque em `claude/` e no índice. Prefira editar um artefato existente a criar outro equivalente.
8. Grave os arquivos em `claude/` usando os templates de `templates/`. Seja curto, verificável, com citação da fonte (número, URL, data de acesso no fuso America/Sao_Paulo). Não cole texto substancial de artigo com direitos autorais.
9. Feche a nota e o índice (`publicado`, `parcial` ou `descartado`). Atualize o diário de `CONTEXTO.md` se nascer uma decisão nova.
10. Faça o commit em `main` com mensagem clara em pt-BR, em geral um commit por fonte.

## Critérios de pronto

O trabalho só termina quando a nota, o índice e os artefatos passam nos critérios de qualidade de `PROCESSO.md` (conciso, acionável, conferido, sem duplicata, com atribuição, sem cópia substancial, instalável) e o commit foi tentado.
