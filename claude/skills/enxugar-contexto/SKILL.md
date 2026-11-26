---
name: enxugar-contexto
description: >
  Audita o contexto sempre carregado de um projeto (CLAUDE.md, regras, imports)
  e decide o que vai para skill, regra com paths, CLAUDE.md de subpasta, hook ou
  subagente. Use quando a sessão gasta tokens demais, o CLAUDE.md está grande
  ou o /context mostra memória pesada.
when_to_use: >
  O usuário diz que o Claude Code gasta muita cota, pede para enxugar ou
  reorganizar o CLAUDE.md, ou quer saber o que tirar da sessão principal.
disable-model-invocation: true
allowed-tools: Read Grep Glob
metadata:
  destino: usuario
  fonte: "004"
  url: "https://www.xda-developers.com/cut-claude-token-use-in-half-moving-instructions-out-of-main-session/"
  acesso: "2026-11-26"
---

# Enxugar o contexto sempre carregado

**Destino de instalação:** `usuario` (`~/.claude/skills/enxugar-contexto/`). A skill audita o projeto em que a sessão está aberta. Propõe as mudanças e só altera arquivos do projeto depois da sua aprovação.

Procedimento conferido na documentação oficial de [memória](https://code.claude.com/docs/en/memory), [custos](https://code.claude.com/docs/en/costs) e [subagentes](https://code.claude.com/docs/en/sub-agents) em 26 de novembro de 2026. A fonte 004 (XDA, 29 de outubro de 2026) é um relato de uso; onde diverge, vale o oficial. Não há promessa de economia: nem a Anthropic nem o artigo medem um número que valha para o seu projeto.

## 1. Medir antes de mexer

- `/context` mostra o que enche a janela, inclusive os arquivos de memória, com sugestões para ferramentas e memória pesadas.
- `/usage`, em plano Pro, Max, Ultra, Team ou Enterprise, atribui o uso recente a skills, subagentes, plugins e servidores MCP e traz “Recommendations”, como `Trim ~/code/api/CLAUDE.md · 49k tokens per request`. Os números são aproximados e saem do histórico local desta máquina.
- `/status` avisa quando um arquivo de instruções passa de 200 linhas.
- `/doctor prompt-audit` (v2.1.283 ou posterior) aponta instruções velhas, referências a arquivos que não existem e arquivos que se contradizem. Ele só propõe; nada muda até você pedir.

Anote os números de `/context` (arquivos de memória) para comparar no fim.

## 2. Triar cada bloco do CLAUDE.md

| O bloco é… | Vai para… |
| --- | --- |
| Essencial em toda sessão: o que o projeto faz, comandos de teste e build, restrições importantes | Fica no `CLAUDE.md` da raiz (alvo oficial: menos de 200 linhas) |
| Só vale para uma parte do código (frontend, backend, uma pasta) | `CLAUDE.md` dentro dessa subpasta, que carrega quando o Claude lê, escreve ou edita um arquivo ali; ou uma regra em `.claude/rules/` com `paths` |
| Procedimento de vários passos, usado de vez em quando (revisar PR, investigar um serviço, migrar banco) | Skill: o corpo só entra no contexto quando é usada |
| Não pode falhar (nunca ler `.env`, sempre formatar) | Hook ou `permissions.deny`, não uma linha de `CLAUDE.md` |
| Dá para descobrir lendo o repositório (árvore de pastas, lista de dependências, visão da arquitetura) | Apagar; é o que o `/doctor` costuma cortar |
| Velho ou contraditório | Apagar |

Limite que pega: um `CLAUDE.md` de subpasta, ou uma regra que carrega sob demanda, que passa de 40.000 caracteres (janela de 200K) chega ao Claude só pelo começo, com um aviso para ler o resto com a ferramenta Read. Confira com `wc -m caminho/CLAUDE.md`.

## 3. Armadilha: `@arquivo` não economiza

Quebrar o `CLAUDE.md` em vários arquivos e importá-los com `@caminho` organiza, mas **não reduz o contexto**: o arquivo importado carrega junto com quem importa, no início da sessão. Para economizar de fato, use as opções de carregamento sob demanda da tabela acima. Citar um caminho em texto simples (sem `@`) só ajuda se o Claude decidir abrir o arquivo.

## 4. Mandar operações verbosas para um subagente

Rodar testes, buscar documentação e ler logs grandes enchem a conversa principal. Peça que um subagente faça o trabalho e devolva só o resumo, por exemplo:

```text
Use um subagente para rodar a suíte de testes e relatar só os testes que falham, com a mensagem de erro.
```

Cuidados, segundo a documentação oficial:

- O subagente faz as próprias requisições e elas **contam no mesmo limite de uso** do plano. Ele reduz o contexto da sessão principal, não necessariamente o total de tokens.
- Um subagente próprio carrega a hierarquia de `CLAUDE.md`, inclusive a sua. Só os embutidos Explore e Plan começam sem ela. Num subagente que não precisa das regras do projeto, use `omitClaudeMd: true` (o `extrator-fonte` deste pacote já faz isso).
- Para tarefa simples, escolha um modelo menor no subagente (`model: haiku`).
- Mudança pequena e direta fica na sessão principal. Subagente compensa em investigação grande, com objetivo claro e resultado curto.

## 5. Verificar

1. Rode `/context` de novo e compare os arquivos de memória com o número anotado.
2. Para um `CLAUDE.md` de subpasta ou regra com `paths`, peça ao Claude para ler um arquivo naquela pasta e confira no `/context` que o arquivo carregou, para o ganho ser medido e não suposto.
3. Rode `/doctor prompt-audit` para ver se sobrou instrução contraditória.

Não prometa o ganho ao usuário: informe a diferença que o `/context` mostrou.
