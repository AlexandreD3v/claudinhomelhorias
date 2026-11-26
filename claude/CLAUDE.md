<!--
Destino de instalação: escolha ao copiar.
  - projeto: convenções do repositório de destino em ./CLAUDE.md ou ./.claude/CLAUDE.md
  - usuario: preferências pessoais em ~/.claude/CLAUDE.md
Este starter mistura os dois tipos de orientação; não copie o arquivo inteiro
para os dois lugares. Separe os trechos na hora de instalar.
-->

# Starter de CLAUDE.md

Instruções curtas para colar (com critério) no `CLAUDE.md` de um projeto ou em `~/.claude/CLAUDE.md`. Não substitua um arquivo já afiado: incorpore só o que ainda não está lá.

Origem: práticas oficiais da Anthropic consultadas em 25 de novembro de 2026 — [melhores práticas](https://code.claude.com/docs/en/best-practices) e [memória / CLAUDE.md](https://code.claude.com/docs/en/memory). Os dois acréscimos sobre `CLAUDE.md` de subpasta e `@` imports vêm da fonte 004 (XDA), conferidos na mesma documentação em 26 de novembro de 2026. O resto não veio de artigo de terceiro.

## Como escrever instruções que ficam neste arquivo

- Só registre o que o Claude **não** descobre lendo o repositório (comandos de build e teste, convenções invisíveis, “sempre faça X”).
- Seja concreto e verificável: “use indentação de 2 espaços”, “rode `npm test` antes de commitar”. Evite “formate direito” ou “teste suas mudanças”.
- Mantenha o arquivo curto (alvo oficial: menos de 200 linhas). Se duas regras se contradisserem, o modelo pode escolher uma delas.
- Procedimento de vários passos ou material de referência longo vai para uma **skill** (`.claude/skills/<nome>/SKILL.md`), não para cá. O corpo da skill só entra no contexto quando é usada.
- Instrução que vale só para certos arquivos vai para `.claude/rules/` com frontmatter `paths`. Se vale para uma pasta inteira (frontend, backend), um `CLAUDE.md` dentro dela só carrega quando o Claude lê ou edita um arquivo ali.
- `@arquivo` (import) organiza, mas **não economiza contexto**: o arquivo importado carrega junto com o `CLAUDE.md` no início da sessão. Para economizar, use skill, regra com `paths` ou `CLAUDE.md` de subpasta. A skill `enxugar-contexto` faz essa triagem.
- Preferências só suas e só deste projeto: `CLAUDE.local.md` (não versionar). Preferências suas em todos os projetos: `~/.claude/CLAUDE.md`.
- O que não pode ter exceção (nunca ler `.env`, sempre rodar o formatador, nunca editar `src/gen/`) vira hook, `permissions.deny` ou setting — não uma linha neste arquivo. `CLAUDE.md` é contexto, não configuração imposta.
- Dê um critério de pronto quando pedir uma mudança: o comando de teste, o typecheck ou a especificação que precisa passar.
- Depois de `/compact`, só o `CLAUDE.md` da raiz do projeto é recolocido automaticamente. Instruções ditas só no chat se perdem.

## Comandos deste projeto

Preencha com o que vale no repositório de destino (exemplos — troque pelos reais):

- Instalar: `…`
- Testar: `…`
- Typecheck / lint: `…`
- Build: `…`

## Convenções que o código não deixa óbvias

- …
