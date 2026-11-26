---
name: processar-fonte
description: >
  Lê um site sobre Claude ou Claude Code, extrai insights acionáveis e
  grava artefatos neste repositório (claudinhomelhorias) seguindo
  GUIA-ANALISE-SITE.md. Use quando o usuário enviar um link, pedir para
  processar uma fonte, ou transformar um artigo em skill, CLAUDE.md,
  hook, agente ou setting.
when_to_use: >
  O usuário cola uma URL de artigo, guia ou post sobre Claude Code,
  ou diz “processa esta fonte”, “transforma este site em instruções”.
argument-hint: "[url]"
arguments: [url]
allowed-tools: Read Grep Glob WebFetch WebSearch Bash
metadata:
  destino: usuario
  fonte: setup-inicial
  origem: "Processo inicial do repositório claudinhomelhorias"
  acesso: "2026-11-25"
---

# Processar fonte

**Destino de instalação:** `usuario` (`~/.claude/skills/processar-fonte/`). A cópia em `.claude/skills/` deste repositório é só ponte para o pipeline local, não substitui essa instalação.

Canonical: siga `GUIA-ANALISE-SITE.md` na raiz do repositório **claudinhomelhorias** (https://github.com/AlexandreD3v/claudinhomelhorias). `PROCESSO.md` é só o contrato de qualidade e estados do índice; `CONTEXTO.md` traz as premissas confirmadas em 25 de novembro de 2026. Este texto resume o fluxo para a skill funcionar mesmo com `--add-dir`. Trabalhe no checkout desse repositório; não grave os artefatos no projeto errado.

Idioma dos arquivos gerados: **pt-BR**. Nomes de skill/agente/comando: kebab-case ASCII. Datas: fuso America/Sao_Paulo.

## Entrada

A URL é `$url` (ou `$ARGUMENTS` se vier solta). Se faltar o link, peça antes de inventar uma fonte. Se chegarem várias URLs no mesmo pedido, processe todas no mesmo ciclo e faça **um único commit para o lote**.

## Passos

Siga os doze passos do guia, neste resumo:

1. Intake: URL canônica; se for link vizinho (Cursor, outro agente, prompting genérico), extraia só o que se aplica ao Claude Code. Próximo número em `fontes/INDICE.md`, slug, linha `em andamento`, nota a partir de `templates/fonte.md`.
2. Leia a página principal e só as extras necessárias (série, doc oficial citada, versão). Sem crawler. Se houver paywall, login ou bloqueio, registre e pare — não invente o conteúdo. A leitura pode ir ao subagente `extrator-fonte`.
3. Anote credibilidade e data (autor, veículo, recência, versão citada). Se houver conflito com outra fonte, descreva os dois lados na nota e no relatório, sem escolher silenciosamente.
4. Extraia só insights acionáveis para o uso do Claude Code. Descarte marketing, o que não se aplica ao Claude Code e o que já está em `claude/` ou em `referencias/praticas-oficiais.md`.
5. Confira caminho e frontmatter na documentação oficial vigente. Se o site divergir, o artefato segue o oficial; os dois lados vão para a nota. Atualize a síntese do repo se a doc oficial tiver mudado.
6. Deduplique em `claude/` e no índice; prefira editar artefato existente.
7. Classifique com a tabela do guia (trecho de CLAUDE.md, regra, skill, comando legado, subagente, estilo, hook/settings, MCP, plugin, ou nenhum).
8. Grave em `claude/` com o template de `templates/`, citação da fonte, **destino** (`projeto` ou `usuario`) no lugar certo do tipo, exemplos válidos. Atualize a cópia em `.claude/` se o pipeline deste repo depender do artefato.
9. Valide: frontmatter na primeira linha, `python3 -m json.tool` em JSON, `bash -n` em hooks, destino declarado. Teste no Claude Code (`/doctor` ou invocação). Sem esse teste, a fonte permanece `parcial`.
10. Feche a nota e o índice. `publicado` só depois do teste no Claude Code **e** do push no GitHub. Fonte `descartada` ainda assim tem nota, índice e commit. Atualize o diário de `CONTEXTO.md` se nascer uma decisão nova.
11. Commit em `main` com mensagem clara em pt-BR: um por fonte isolada, ou um só para o lote. Depois faça o push; sem push, não marque `publicado`.
12. Entregue o relatório no formato da seção 12 do guia (incluindo destino, conflitos com os dois lados, teste e push).

## Critérios de pronto

O trabalho só termina quando a nota, o índice e os artefatos passam nos critérios de `PROCESSO.md`, o checklist do guia está completo e o relatório foi emitido. `publicado` exige teste no Claude Code e push no GitHub.
