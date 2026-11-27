# Fonte 008 — Maximizing the value of your Claude Code sessions (hábitos de sessão)

- **URL:** https://claude.com/resources/articles/maximizing-the-value-of-your-claude-code-sessions
- **Acesso:** 2026-11-27 10:50 (America/Sao_Paulo)
- **Autor / site:** Anthropic, artigo oficial em claude.com/resources. Publicado em 14 de agosto de 2026 (`datePublished`). Sem autor individual. Mesmo artigo da fonte 007; esta fonte cobre só o TL;DR de `/clear`, `/context` e `@` na mensagem.
- **Tema:** claude-code
- **Status:** parcial

## Resumo

A segunda fatia do artigo oficial sobre o valor da sessão. Entre tarefas não relacionadas, `/clear` evita reenviar o histórico irrelevante (o `CLAUDE.md` e o projeto permanecem). Numa sessão nova, `/context` uma vez mostra o que já está carregado (`CLAUDE.md`, definições de tools MCP) para você cortar o excesso. Num pedido, `@arquivo` anexa o arquivo à mensagem e pode poupar um Read ou uma busca — isso **não** é o `@` import no `CLAUDE.md`, que a fonte 004 já documentou como sem economia de contexto. Comando barulhento: flags quietas, ou a saída pesada num subagente (estende a 004; não vira artefato novo). Depois de um `/clear`, o momento de (re)fixar modelo e esforço é o da fonte 007.

## O que foi lido

- A página canônica do artigo (conteúdo já coletado na pesquisa das 10 dicas e na fonte 007; sem nova coleta integral).
- A referência de [comandos](https://code.claude.com/docs/en/commands) (`/clear`, `/context`), já usada em fontes anteriores, e o que a fonte 001 já citava da doc de custos: `/clear` ao mudar de tarefa, `/compact` para continuar a mesma.

## Insights acionáveis

### Insight 1 — `/clear` ao mudar de tarefa

- **Ação:** termine a tarefa e rode `/clear` antes da seguinte, se elas não compartilham contexto útil. A conversa zera; `CLAUDE.md`, skills e o projeto continuam. Não use `/clear` só para desfazer as últimas rodadas — isso é `/rewind` (fonte 007). Não use `/compact` no lugar de `/clear` quando a tarefa mudou: compactar resume o irrelevante e ainda custa.
- **Quando importa:** várias tarefas no mesmo dia, no mesmo checkout.
- **Tipo de artefato:** skill
- **Destino de instalação:** usuario
- **Seção de origem:** TL;DR “Run `/clear` between tasks”
- **Conferido na doc oficial:** sim — artigo oficial e [commands](https://code.claude.com/docs/en/commands); alinhado ao que a fonte 001 já apontava na doc de custos

### Insight 2 — `/context` uma vez numa sessão nova

- **Ação:** no início, rode `/context` (ou `/context all` se quiser a lista de arquivos de memória) e veja o que já entra antes de qualquer pedido. Se o que pesa é um `CLAUDE.md` inchado, imports ou regras sempre carregadas, a triagem é a da fonte 004 (`/enxugar-contexto`). Se o que pesa são tools MCP, a conversa é a da fonte 006 e da doc de tool search — esta skill só manda olhar o número e agir.
- **Quando importa:** projeto com `CLAUDE.md` grande, vários servidores MCP, ou a cota subindo “sem trabalho”.
- **Tipo de artefato:** skill
- **Destino de instalação:** usuario
- **Seção de origem:** TL;DR “Run `/context` once in a fresh session”
- **Conferido na doc oficial:** sim — artigo oficial e [commands](https://code.claude.com/docs/en/commands)

### Insight 3 — `@arquivo` na mensagem, não no `CLAUDE.md`

- **Ação:** quando o pedido é sobre um arquivo que você já sabe, use `@caminho` na mensagem para anexá-lo naquele turno, em vez de só citar o nome e esperar um Read ou uma busca. Isso não substitui o `CLAUDE.md` enxuto da fonte 004: um `@` *import* no `CLAUDE.md` carrega o arquivo em **toda** sessão, sem economizar contexto.
- **Quando importa:** pedido pontual (“corrija este teste”, “revise este diff”).
- **Tipo de artefato:** skill
- **Destino de instalação:** usuario
- **Seção de origem:** TL;DR “@-mention files instead of naming them”
- **Conferido na doc oficial:** sim — artigo oficial; a distinção com o import é a da fonte 004 e da doc de memória já citada lá

## Artefatos gerados

- `claude/skills/limpar-sessao/SKILL.md` — destino: `usuario` (`~/.claude/skills/limpar-sessao/`) — quando usar `/clear`, `/context` e `@` na mensagem, com as distinções das fontes 004 e 007.

## Duplicatas e reuso

A fonte 007 deixou estes três hábitos de fora, de propósito. A fonte 001 já apontava `/clear` como hábito oficial que o artigo da XDA não ensina; esta fonte o transforma em skill, no contexto do artigo oficial. A fonte 004 já ensina `/context` para *medir e triar* o sempre carregado, e avisa que `@` import não economiza; esta fonte acrescenta `/context` como hábito de início de sessão e o `@` *na mensagem*. O subagente para saída barulhenta só estende a 004 — não há artefato novo só por isso.

## Divergências com a documentação oficial

Nenhuma de fato: o artigo é da Anthropic e alinha com a página de comandos e com a doc de custos já citada na 001. Esta fonte não inventa cifra de economia para o `/clear` nem para o `@` na mensagem.

## Conflitos entre fontes

- **Fonte 004 versus o `@` desta fonte.** 004: `@` import no `CLAUDE.md` **não** reduz contexto (o arquivo importado carrega junto no início). 008: `@arquivo` *numa mensagem* anexa o arquivo àquele turno e pode evitar um Read ou uma busca. Não se contradizem — são mecanismos diferentes. Os dois lados ficam nesta nota, na 004 e no `USO.md`.
- **Fonte 007.** Depois de `/clear`, (re)fixe modelo e esforço se precisar (007). Para desfazer as últimas rodadas, `/rewind`, não `/clear`. Para resumir a *mesma* tarefa antes de uma pausa, `/compact` (007), não `/clear`. Sem contradição.

## Pendências

- **Teste no Claude Code ainda não feito.** Permanece `parcial`. Para fechar: instalar a skill; numa sessão com histórico de outra tarefa, `/clear` e confirmar que o histórico saiu e o `CLAUDE.md` ficou; numa sessão nova, `/context` uma vez; num pedido, `@` um arquivo conhecido e ver se o Claude não precisa procurá-lo. Não foi testado aqui.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
