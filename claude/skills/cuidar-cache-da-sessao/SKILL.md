---
name: cuidar-cache-da-sessao
description: >
  Protege o prompt cache da sessão no Claude Code: fixa modelo, esforço e
  Fast mode no início, usa /rewind (não /compact) para desfazer as últimas
  rodadas e compacta antes de uma pausa. Use ao falar de cache, prefill,
  /rewind versus /compact, trocar de modelo no meio da conversa ou opusplan
  no meio da sessão.
when_to_use: >
  O usuário pergunta por que a cota subiu depois de um /model, quer desfazer
  as últimas rodadas, vai pausar uma sessão longa, ou pensa em ligar
  opusplan no meio do trabalho.
argument-hint: ""
metadata:
  destino: usuario
  fonte: "007"
  url: "https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions"
  acesso: "2026-11-27"
---

# Cuidar do cache da sessão

**Destino de instalação:** `usuario` (`~/.claude/skills/cuidar-cache-da-sessao/`).

Hábitos do artigo oficial da fonte 007 (Anthropic, 14 de agosto de 2026), conferidos de novo em 27 de novembro de 2026. O cache é automático; no plano você não vê o preço, mas as mesmas requisições consomem a cota. Não foi testado neste checkout. Página relacionada: [prompt caching](https://code.claude.com/docs/en/prompt-caching).

## Regras

1. Escolha `/model`, `/effort` e, se for usar, o Fast mode **no começo** da sessão, ou logo após um `/clear`. Trocar no meio quebra o cache e o próximo turno relê a conversa toda (prefill a preço cheio). Ligar o Fast mode no meio ainda prefills a preço do Fast mode; desligá-lo, para o cache, é de graça.
2. Se as últimas rodadas não servem, use `/rewind` (ou `/undo`) até antes delas — só o fim sai, o que veio antes continua em cache, sem custo extra. Não use `/compact` só para desfazer: ele reescreve a conversa e sempre custa. O menu completo e os limites (Bash só, subagente; use Git) estão na fonte 009, skill `usar-rewind`.
3. Se você quer mesmo resumir, rode `/compact` **antes** de uma pausa, enquanto o cache ainda vale: 1 hora no plano; 5 minutos numa API key (`ENABLE_PROMPT_CACHING_1H=1` sobe para 1 hora). Diga o que manter, ou cole o snippet `instrucoes-de-compact.md` no `CLAUDE.md`. Em modelo de 1M, `/autocompact 200k` devolve o auto-compact antigo (v2.1.221+).
4. Retomar uma sessão antiga quase sempre é cache miss (o cache já expirou e o system prompt é remontado na abertura).

## Conflito com a fonte 001 (`opusplan`)

Cada ida ou volta do plan mode com `opusplan` é uma troca de modelo e quebra o cache — a fonte 001 já registra isso. O momento barato de ligar `/model opusplan` é o **início** da sessão ou logo após `/clear`, não o meio de uma conversa já longa. A skill `usar-opusplan` continua válida; esta só acrescenta quando ligá-la.

## O que esta skill não cobre

O menu de `/rewind` e o que o checkpoint não restaura: fonte 009 (skill `usar-rewind`). `/clear` entre tarefas, `@` numa mensagem e `/context` também estão no mesmo artigo e agora estão na fonte 008 (skill `limpar-sessao`). Não misture o `@` de mensagem com o `@` import no `CLAUDE.md` (fonte 004: import não economiza contexto).
