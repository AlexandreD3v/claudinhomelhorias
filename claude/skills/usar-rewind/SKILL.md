---
name: usar-rewind
description: >
  Usa /rewind (aliases /undo e /checkpoint) para restaurar código e/ou
  conversa a um checkpoint, ou resumir a partir de um ponto. Inclui o que
  o rewind não restaura (Bash só, a maior parte das edições de subagente;
  use Git). Use ao desfazer uma tentativa, ao recuar a conversa ou ao
  resumir no meio da sessão.
when_to_use: >
  O usuário quer desfazer edições do Claude, voltar a um prompt anterior,
  resumir parte da conversa no menu de rewind, ou pergunta se o rewind
  desfaz um comando Bash ou o trabalho de um subagente.
argument-hint: ""
metadata:
  destino: usuario
  fonte: "009"
  url: "https://code.claude.com/docs/en/checkpointing"
  acesso: "2026-11-27"
---

# Usar o `/rewind`

**Destino de instalação:** `usuario` (`~/.claude/skills/usar-rewind/`).

Fluxo da documentação oficial da fonte 009 ([checkpointing](https://code.claude.com/docs/en/checkpointing), [commands](https://code.claude.com/docs/en/commands)), conferida em 27 de novembro de 2026. Não foi testado neste checkout.

O Claude Code grava um checkpoint automático, nas edições das tools de arquivo, antes de cada prompt que começa um turno (até 100 por sessão; snapshots saem no sweep, uns 30 dias por padrão, configurável com `cleanupPeriodDays`). Depois de retomar a sessão, `/rewind` continua disponível.

## Como usar

1. Rode `/rewind` ou `/undo` (ou `/checkpoint`). Com o prompt vazio, `Esc` duas vezes abre o mesmo menu (no vim: `Esc` duas vezes no modo NORMAL). Se o input tiver texto, `Esc` duas vezes só apaga o texto (recupere com `Up`).
2. Escolha o prompt e a ação: restaurar código e conversa, só conversa, só código, “Summarize from here” ou “Summarize up to here”. Restaurar código só aparece se aquele ponto tiver edições rastreadas.
3. Ao restaurar a conversa ou resumir “from here”, o prompt original volta no input. Se você sair **antes** de mandar o próximo prompt, as mensagens rebobinadas podem voltar: mande um prompt nesta sessão para gravar o estado, ou rode `/rewind` de novo. Os arquivos restaurados permanecem como o rewind os deixou.
4. Depois de um `/clear` no mesmo processo, o topo do menu pode mostrar `/resume (previous session)` até você sair ou retomar outra sessão.
5. Resumir no menu não muda arquivos no disco e funciona como um `/compact` pontual. Para ramificar a sessão sem perder a original, a doc aponta `/branch` ou `claude --continue --fork-session`.

## O que o rewind não restaura — use Git

- Arquivo mudado **só** no Bash, se o Claude ainda não o tinha editado com as tools nesta conversa. (Se o Claude já tinha editado o arquivo, o rewind também desfaz o que o Bash fez depois.)
- Edições de subagente, na maior parte dos casos. Exceção: skill em *foreground* com `context: fork` (`background: false`). Fork em background e `/code-review --fix` em background não voltam pelo rewind.
- Mudanças manuais suas ou de outra sessão simultânea, em arquivos que esta sessão não editou.
- Symlink e hard link: o restore avisa `Restored the code, but skipped N files`. Para ver os caminhos, `/debug` antes de restaurar.
- Mensagem enviada no meio do turno: pode aparecer como “No code restore”. Para desfazer as edições daquele turno, escolha o prompt que **começou** o turno.
- Checkpoint cujo snapshot já saiu no sweep: pode falhar com `No files were restored`.

Checkpoints são recuperação rápida da sessão, não histórico permanente. Para isso, use Git.

## Relação com a fonte 007 (cache)

`/rewind` que só corta o fim da conversa **preserva** o prompt cache; `/compact` reescreve a conversa e sempre custa (skill `cuidar-cache-da-sessao`). Use `/rewind` para desfazer; `/compact` ou o summarize do menu quando o objetivo é resumir (de preferência com o cache ainda quente, como na 007).

## O que esta skill não cobre

Fixar modelo/esforço no início e compactar antes de uma pausa: fonte 007. `/clear` entre tarefas: fonte 008.
