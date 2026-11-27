# Fonte 009 — Checkpointing (`/rewind`)

- **URL:** https://code.claude.com/docs/en/checkpointing
- **Acesso:** 2026-11-27 11:24 (America/Sao_Paulo)
- **Autor / site:** Documentação oficial do Claude Code (Anthropic). Página “Checkpointing”, conferida de novo nesta data. Aliases e entrada do menu também em [commands](https://code.claude.com/docs/en/commands) (`/rewind`, `/checkpoint`, `/undo`). Sem autor individual.
- **Tema:** claude-code
- **Status:** parcial

## Resumo

O Claude Code grava sozinho a árvore de arquivos antes de cada prompt que começa um turno, nas edições feitas pelas tools de arquivo. `/rewind` (aliases `/undo` e `/checkpoint`; ou `Esc` duas vezes com o prompt vazio) abre um menu: restaurar código e conversa, só conversa, só código, ou resumir a partir de/até aquele ponto. Há até 100 checkpoints por sessão; os snapshots saem no sweep (por padrão uns 30 dias; `cleanupPeriodDays` alonga). Depois de retomar a sessão, o `/rewind` continua valendo. Não substitui o Git: arquivo mudado **só** no Bash (e que o Claude ainda não tinha editado com as tools), a maior parte das edições de subagente, mudanças externas, links simbólicos/rígidos e mensagens no meio do turno ficam de fora ou só em parte. A fonte 007 já ensina que `/rewind` (cortar o fim) preserva o prompt cache e `/compact` não; esta fonte aprofunda o menu e os limites.

## O que foi lido

- A página canônica de [checkpointing](https://code.claude.com/docs/en/checkpointing), coletada em 27 de novembro de 2026.
- A entrada de `/rewind` em [commands](https://code.claude.com/docs/en/commands), já usada nas fontes 007 e 008.

## Insights acionáveis

### Insight 1 — Usar `/rewind` para desfazer ou resumir no ponto certo

- **Ação:** rode `/rewind` (ou `/undo`, ou `Esc` duas vezes com o input vazio; no vim, `Esc` duas vezes no modo NORMAL). Escolha o prompt e a ação: código e conversa, só conversa, só código, “Summarize from here” ou “Summarize up to here”. As opções de restaurar código só aparecem se aquele checkpoint tiver edições rastreadas. Ao restaurar a conversa ou resumir “from here”, o prompt original volta no input para reenviar ou editar. Se você sair **antes** do próximo prompt, as mensagens rebobinadas podem voltar: mande um prompt ainda nesta sessão para o Claude Code gravar o estado, ou rode `/rewind` de novo. Depois de um `/clear` no mesmo processo, o menu ganha `/resume (previous session)` até você sair ou retomar outra sessão. Resumir não muda arquivos no disco; para ramificar a sessão, a doc aponta `/branch` ou `claude --continue --fork-session`, não o rewind.
- **Quando importa:** tentar um caminho, desfazer um erro, ou enxugar contexto no meio da sessão sem perder o começo.
- **Tipo de artefato:** skill
- **Destino de instalação:** usuario
- **Seção de origem:** “Rewind and summarize” e “Common use cases”
- **Conferido na doc oficial:** sim — a própria página de checkpointing e [commands](https://code.claude.com/docs/en/commands)

### Insight 2 — Saber o que o rewind não restaura (use Git)

- **Ação:** trate o checkpoint como recuperação rápida da sessão, não como histórico permanente. Use Git (ou outro VCS) para: arquivo que só o Bash mudou e o Claude ainda não tinha editado com as tools; edições de subagente que não sejam skill em foreground com `context: fork`; mudanças manuais ou de outra sessão; arquivos symlink ou hard link (o restore avisa `Restored the code, but skipped N files`). No rewind, uma mensagem enviada no meio do turno pode aparecer como “No code restore”; para desfazer as edições daquele turno, escolha o prompt que **começou** o turno. Snapshots somem no sweep (~30 dias): um rewind depois disso pode falhar com `No files were restored`.
- **Quando importa:** sessão que usou Bash, subagente, ou arquivos ligados por symlink (dotfiles, pnpm).
- **Tipo de artefato:** skill
- **Destino de instalação:** usuario
- **Seção de origem:** “Limitations”
- **Conferido na doc oficial:** sim — seção “Limitations” da mesma página

## Artefatos gerados

- `claude/skills/usar-rewind/SKILL.md` — destino: `usuario` (`~/.claude/skills/usar-rewind/`) — menu, atalhos, limites oficiais e o cruzamento com a fonte 007 (cache).

## Duplicatas e reuso

A fonte 007 já usa `/rewind` como o jeito barato de descartar as últimas rodadas, em oposição ao `/compact`, e aponta a página de checkpointing para os limites. Esta fonte não substitui a 007: ela aprofunda o menu, os atalhos, o sweep, o `/resume` depois do `/clear` e o que **não** volta. A fonte 008 lembra que `/clear` não é o modo de desfazer rodadas; o detalhe do menu passa a ser esta skill.

## Divergências com a documentação oficial

Nenhuma: a fonte é a própria doc. A página de commands só confirma os aliases (`/rewind`, `/checkpoint`, `/undo`).

## Conflitos entre fontes

- **Fonte 007.** As duas concordam: `/rewind` corta o fim e preserva o cache; `/compact` reescreve a conversa e sempre custa. O “Summarize” do menu de rewind, segundo a doc de checkpointing, comprime o contexto na mesma sessão, “like a targeted `/compact`”. Não há contradição: para só desfazer, restaure; para resumir, o summarize do menu (ou `/compact`, de preferência com o cache quente, como na 007). Os dois lados ficam nesta nota e na 007.
- Sem conflito com a 008: depois de `/clear`, o menu pode oferecer `/resume (previous session)` no mesmo processo — é um complemento, não uma inversão do “zere a conversa”.

## Pendências

- **Teste no Claude Code ainda não feito.** Permanece `parcial`. Para fechar: instalar a skill; numa sessão, editar um arquivo com o Claude, rodar `/rewind` e conferir as opções; em seguida, mudar o mesmo arquivo só no Bash (sem o Claude tê-lo editado antes) e confirmar que o rewind não o restaura (o Git sim). Não foi testado aqui.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
