# Fonte 007 — Maximizing the value of your Claude Code sessions

- **URL:** https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions
- **Acesso:** 2026-11-27 10:33 (America/Sao_Paulo)
- **Autor / site:** Anthropic, artigo oficial em claude.com/resources. Publicado em 14 de agosto de 2026 (`datePublished`). Sem autor individual.
- **Tema:** claude-code
- **Status:** parcial

## Resumo

Artigo oficial sobre como tirar mais valor de cada token numa sessão do Claude Code. O prompt cache é automático: reler o prefixo em cache custa 0,1× o input; gravar no cache custa até 2×, uma vez. O que muda o começo da requisição (tools, system prompt, conversa com o `CLAUDE.md` na frente) dispara um prefill inteiro a preço cheio — no plano as mesmas requisições consomem a cota, mesmo sem preço visível. O artigo manda fixar modelo, esforço e Fast mode **no início** (ou logo após um `/clear`); se as últimas rodadas saíram errado, usar `/rewind` (só corta o fim; o que veio antes continua em cache, sem custo extra) e não `/compact` (reescreve a conversa e sempre custa). `/compact` vale **antes de uma pausa**, enquanto o cache ainda está quente (1 hora no plano; 5 minutos numa API key, ou 1 hora com `ENABLE_PROMPT_CACHING_1H=1`). Dá para guiar o resumo com uma seção “Compact instructions” no `CLAUDE.md`. Retomar sessão antiga quase sempre é cache miss. O artigo também trata de `/clear`, `@` em arquivo e `/context`; isso ficou para a dica 2 e hoje está na fonte 008 (`limpar-sessao`).

## O que foi lido

- A página canônica do artigo (conteúdo já coletado na pesquisa das 10 dicas; data de publicação conferida em 27 de novembro de 2026).
- Documentação oficial já usada na fonte 001: [prompt caching](https://code.claude.com/docs/en/prompt-caching) e, para o menu de `/rewind`, [checkpointing](https://code.claude.com/docs/en/checkpointing). Não houve nova varredura ampla da doc.

## Insights acionáveis

### Insight 1 — Fixar modelo, esforço e Fast mode no começo da sessão

- **Ação:** escolha `/model`, `/effort` e, se for usar, o Fast mode **antes** do trabalho (ou logo após `/clear`). Trocar no meio quebra o cache e o próximo turno relê a conversa toda. Ligar o Fast mode no meio ainda prefills a preço do Fast mode; desligá-lo, do ponto de vista do cache, é de graça. Não evite trocar quando precisar — evite trocar no meio de uma conversa longa.
- **Quando importa:** sessão que já acumulou contexto e ainda vai durar.
- **Tipo de artefato:** skill
- **Destino de instalação:** usuario
- **Seção de origem:** “Prompt caching” / TL;DR “Set your model and effort level before you start”
- **Conferido na doc oficial:** sim — o artigo é oficial; a página de [prompt caching](https://code.claude.com/docs/en/prompt-caching) já era a base da fonte 001 sobre cache miss na troca de modelo

### Insight 2 — `/rewind` para desfazer as últimas rodadas; `/compact` antes da pausa

- **Ação:** se as últimas rodadas não servem, `/rewind` até antes delas. Isso só corta o fim, o prefixo continua em cache e não custa o prefill. `/compact` reescreve a conversa (o system prompt na frente sobrevive) e sempre custa alguma coisa; o próprio resumo é mais barato enquanto o cache antigo ainda vale — por isso compacte **antes** de uma pausa longa, não depois. Instruções estáveis de compactação podem ir numa seção “Compact instructions” no `CLAUDE.md`; se você usa modelo de 1M e quer o auto-compact antigo, `/autocompact 200k` (Claude Code v2.1.221+).
- **Quando importa:** conversa que descarrilou, ou pausa de mais de alguns minutos (acima de 1 hora no plano, o cache expira).
- **Tipo de artefato:** skill + trecho-claude-md opcional
- **Destino de instalação:** `usuario` (skill); `usuario` ou `projeto` (trecho)
- **Seção de origem:** “Prompt caching” (dica de `/rewind` vs `/compact`) e a nota sobre `/compact` antes da pausa
- **Conferido na doc oficial:** sim — artigo oficial; o menu de `/rewind` está em [checkpointing](https://code.claude.com/docs/en/checkpointing) (os limites de o que o rewind restaura são daquela página, não deste artigo)

## Artefatos gerados

- `claude/skills/cuidar-cache-da-sessao/SKILL.md` — destino: `usuario` (`~/.claude/skills/cuidar-cache-da-sessao/`) — quando trocar modelo/esforço, `/rewind` vs `/compact`, compactar antes da pausa, e a ressalva do `opusplan` (fonte 001).
- `claude/snippets/instrucoes-de-compact.md` — destino: `usuario` ou `projeto` (colar no `CLAUDE.md`) — seção curta “Instruções de compactação”, opcional.

## Duplicatas e reuso

A fonte 001 já registra o cache miss na troca de modelo (incluindo cada ida/volta do plan mode com `opusplan`) e aponta `/clear` e `/compact` como hábitos oficiais que o artigo da XDA não ensina. Esta fonte não substitui a 001: ela aprofunda o cache (preço 0,1×, o que quebra o prefixo, Fast mode, validade de 1 hora, `/rewind` barato vs `/compact` pago, seção no `CLAUDE.md`). Não havia skill só sobre isso. O `/clear` entre tarefas, o `@` na mensagem e o `/context` do mesmo artigo ficaram de fora desta fonte e estão na 008 (`limpar-sessao`).

## Divergências com a documentação oficial

Nenhuma de fato: o artigo é da própria Anthropic e alinha com a página de prompt caching. Detalhe só no escopo: o artigo cita `/rewind` como jeito de cortar o fim sem quebrar o cache; a página de checkpointing é que lista o que o rewind **não** restaura (Bash só, subagente). A skill aponta os dois e não promete restaurar o que o checkpoint não captura.

## Conflitos entre fontes

- **Fonte 001 (`opusplan`) versus esta fonte.** As duas concordam que cada troca de modelo, inclusive entrar ou sair do plan mode com `opusplan`, gera cache miss. O artigo desta fonte deixa o custo prático mais explícito: reler o histórico no meio de uma conversa longa sai caro; o momento barato de ligar o `opusplan` (ou qualquer `/model`) é o início da sessão ou logo após um `/clear`. Não invalida a 001 — a skill `usar-opusplan` continua válida — mas a 001 ganha uma linha cruzada: não ligue o alias no meio de uma sessão já longa. Os dois lados ficam visíveis nas duas notas e no `USO.md`.
- A fonte 001 ainda recomenda `/compact` no meio de uma tarefa longa, no sentido da doc de custos. Esta fonte não proíbe `/compact`; ela o reserva para quando você quer mesmo resumir (e, de preferência, antes de uma pausa, com o cache quente) e manda usar `/rewind` quando o objetivo é só descartar as últimas rodadas.

## Pendências

- **Teste no Claude Code ainda não feito.** Permanece `parcial`. Para fechar: instalar a skill em `~/.claude/skills/`; numa sessão nova, fixar o modelo no início, rodar duas ou três rodadas, fazer `/rewind` de uma delas e conferir que a conversa recuou; numa outra sessão, observar em `/usage` (ou no que a versão mostrar de cache) o efeito de um `/model` no meio versus no início. Não foi testado aqui.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
