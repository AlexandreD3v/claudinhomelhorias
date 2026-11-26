# Processo por site

Pipeline de cada link enviado por Alexandre. Desde 26 de novembro de 2026 o escopo cobre o **Claude Code** (pacote `claude/`) e o **app Claude** — chat e Desktop, Mac e Windows (pacote `claude-app/`). Cada fonte tem um tema: `claude-code`, `claude-app` ou `ambos`. O passo a passo operacional completo — da captura ao relatório — está em [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md). Use esse guia em toda análise; não mantenha um fluxo paralelo.

A skill [`claude/skills/processar-fonte/SKILL.md`](claude/skills/processar-fonte/SKILL.md) (`/processar-fonte`) e o subagente [`claude/agents/extrator-fonte.md`](claude/agents/extrator-fonte.md) seguem o guia. As premissas vigentes (confirmadas em 25 de novembro de 2026) estão em [`CONTEXTO.md`](CONTEXTO.md).

## Pré-requisitos

- Ter lido `CONTEXTO.md` nesta sessão, inclusive a seção Premissas.
- Ter à mão a documentação oficial relevante (atalhos em [`referencias/praticas-oficiais.md`](referencias/praticas-oficiais.md)). Se o material da fonte contradisser a documentação oficial sobre caminhos, frontmatter ou comportamento do produto, **prevalece a documentação oficial**; anote a divergência na nota da fonte. Se duas fontes não oficiais discordarem, mostre os **dois lados** na nota e no relatório, sem escolher silenciosamente.

## Contrato: critérios de qualidade

Um artefato só entra no repositório se atender a todos:

1. **Conciso** — sem preâmbulo inútil; `CLAUDE.md` e descrições de skill/agente curtos (a `description` entra no contexto de toda sessão).
2. **Acionável** — dá para executar ou verificar; não é opinião vaga.
3. **Conferido** — caminhos e frontmatter batem com a documentação oficial vigente.
4. **Sem duplicata** — não repete outro artefato nem o starter, salvo união explícita de fontes.
5. **Com atribuição** — URL e data de acesso rastreadas no índice e na nota.
6. **Sem cópia substancial** — não reproduz o artigo; resume e aponta.
7. **Instalável ou utilizável** — declara o destino: `projeto` ou `usuario` em `claude/` (o README do tipo explica para onde copiar); `app-claude`, `projeto-claudeai` ou `configuracoes` em `claude-app/` (o README da pasta explica onde ler ou colar).
8. **Bilíngue e com “como usar”** — sai em pt-BR e em en-US (espelho em `en-us/`, com `name` em inglês diferente) e tem a seção da fonte em `USO.md` e `en-us/USAGE.md` (passos 8 a 10 do guia). A nota da fonte, a linha do índice e qualquer arquivo de processo alterado também ganham a versão en-US em `en-us/`.

A validação mecânica é obrigatória. O teste é obrigatório para fechar como `publicado` — no Claude Code para artefatos de `claude/`, no app Claude para artefatos de `claude-app/`; sem esse teste, a fonte permanece `parcial` (passo 9 do guia).

## Estados no índice

| Status | Significado |
| --- | --- |
| `em andamento` | Número reservado; leitura ou redação em curso |
| `publicado` | Nota e artefatos gravados, testados (Claude Code ou app Claude, conforme o tema), commitados em `main` e **já enviados (push) ao GitHub** |
| `parcial` | Algo útil foi gravado, mas ficou pendência (página incompleta, teste no Claude Code ou no app Claude ainda não feito, push pendente, dúvida de classificação) |
| `descartado` | O site não rendeu artefato nem para o Claude Code nem para o app Claude; a nota explica o porquê. A nota e o índice **são commitados** mesmo assim |

Vários links no mesmo pedido entram num **único commit de lote**. Uma fonte isolada gera um commit. Fonte descartada também entra nesse commit (ou num commit só dela, se vier sozinha).

## O que não fazer

- Não gravar artefato “para ter um arquivo” se não houver insight acionável.
- Não colocar procedimento longo no `CLAUDE.md` starter.
- Não tratar dica de blog como formato oficial quando a documentação da Anthropic disser outra coisa.
- Não escolher silenciosamente um lado num conflito entre fontes; mostre os dois na nota e no relatório.
- Não omitir o destino de instalação (`projeto` ou `usuario`; no app, `app-claude`, `projeto-claudeai` ou `configuracoes`).
- Não descartar um recurso do app Claude só porque ele não é do Claude Code: ele vai para `claude-app/`.
- Não marcar `publicado` antes do push no GitHub, nem enquanto o artefato não tiver sido testado no Claude Code (`claude/`) ou no app Claude (`claude-app/`).
- Não inventar conteúdo de página que não foi possível ler (paywall, bloqueio, vídeo sem transcrição).
- Não apagar conteúdo existente do repositório para “começar de novo”.
