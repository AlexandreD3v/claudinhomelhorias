---
name: limpar-sessao
description: >
  Limpa e inspeciona a sessão do Claude Code: /clear entre tarefas não
  relacionadas, /context no início para ver o que já está carregado, e
  @arquivo na mensagem para anexar um arquivo conhecido. Use ao mudar de
  tarefa, ao abrir uma sessão nova, ou ao citar um arquivo pelo nome.
when_to_use: >
  O usuário termina uma tarefa e começa outra, pergunta o que está
  consumindo contexto, cita um arquivo sem anexá-lo, ou confunde /clear
  com /compact ou /rewind.
argument-hint: ""
metadata:
  destino: usuario
  fonte: "008"
  url: "https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions"
  acesso: "2026-11-27"
---

# Limpar a sessão

**Destino de instalação:** `usuario` (`~/.claude/skills/limpar-sessao/`).

Hábitos do artigo oficial da fonte 008 (Anthropic, 14 de agosto de 2026; o mesmo artigo da fonte 007, fatia de `/clear`, `/context` e `@` na mensagem), conferidos em 27 de novembro de 2026. Não foi testado neste checkout. Comandos: [commands](https://code.claude.com/docs/en/commands).

## Regras

1. Ao **mudar de tarefa** que não compartilha contexto útil, rode `/clear`. A conversa zera; `CLAUDE.md`, skills e o projeto permanecem. Não use `/clear` para desfazer as últimas rodadas — isso é `/rewind` (fonte 007, skill `cuidar-cache-da-sessao`). Não use `/compact` no lugar de `/clear` quando a tarefa mudou.
2. Numa **sessão nova**, rode `/context` uma vez (ou `/context all` para a lista de arquivos de memória) e veja o que já entra. Se o peso for `CLAUDE.md`, imports ou regras sempre carregadas, use `/enxugar-contexto` (fonte 004). Se for tools MCP, veja a fonte 006 e a doc de tool search.
3. Quando o pedido for sobre um arquivo que você já conhece, escreva `@caminho` **na mensagem** para anexá-lo naquele turno, em vez de só citar o nome. Isso pode poupar um Read ou uma busca.
4. Comando barulhento: peça flags quietas (`-q`, `--quiet`) ou deixe a saída pesada num subagente — o output entra na conversa e fica até o fim da sessão (princípio da fonte 004; não é artefato novo).
5. Depois de um `/clear`, se precisar de um modelo ou esforço específico, fixe-os aí (fonte 007): é o momento barato para o cache.

## `@` na mensagem versus `@` import (fonte 004)

Um `@caminho` **no `CLAUDE.md`** (import) carrega o arquivo em toda sessão e **não** economiza contexto — a skill `enxugar-contexto` já avisa isso. Um `@caminho` **na mensagem** vale só daquele turno e serve para o Claude não ter que achar o arquivo. Não troque um pelo outro.

## O que esta skill não cobre

Proteger o prompt cache (`/model` no início, `/rewind` vs `/compact`, compactar antes da pausa) é a fonte 007. Triar o `CLAUDE.md` é a fonte 004.
