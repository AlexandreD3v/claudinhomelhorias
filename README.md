# Claudinho Melhorias

Repositório pessoal de **Alexandre Jackson Correa** para transformar artigos e guias sobre [Claude Code](https://code.claude.com/docs/en/overview) (Anthropic) em instruções úteis e instaláveis.

O fluxo é simples: chega um link, o conteúdo é lido, os insights acionáveis são classificados no tipo certo de artefato (trecho de `CLAUDE.md`, skill, comando, subagente, hook, setting, regra, estilo de saída ou MCP) e o resultado fica versionado aqui. Cada artefato declara o destino de instalação (`projeto` = `.claude/` do projeto, ou `usuario` = `~/.claude`).

Todo o material deste repositório é escrito em **pt-BR**. Nomes de skills, comandos e agentes usam kebab-case ASCII, porque o Claude Code pode recusar caracteres especiais no nome.

## Como usar

1. Abra este repositório no Claude Code (ou peça a um assistente para seguir [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md)).
2. Envie o link do site.
3. O assistente segue o guia: captura a fonte em `fontes/`, lê e avalia credibilidade, extrai o que dá para aplicar, confere o formato na [documentação oficial](https://code.claude.com/docs/en/overview), grava o artefato em `claude/`, valida e atualiza o índice.
4. Você instala cada artefato no destino que ele declara (`projeto` ou `usuario`).

Antes de processar o primeiro site, leia [`CONTEXTO.md`](CONTEXTO.md) (premissas e contexto persistente) e [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md) (passo a passo). [`PROCESSO.md`](PROCESSO.md) é o contrato curto de qualidade e aponta para o guia.

## Instalar os artefatos

Os arquivos em `claude/` espelham o layout de `.claude/`, com um `CLAUDE.md` inicial à parte. O Claude Code **não** lê a pasta `claude/` automaticamente. Copie (ou faça um symlink) para o destino declarado no artefato (`projeto` ou `usuario`).

### Em um projeto (compartilhável via git)

```bash
# Na raiz do projeto
mkdir -p .claude/skills .claude/agents .claude/commands .claude/rules .claude/output-styles

# Skills, agentes, comandos, regras e estilos
cp -R caminho/para/claudinhomelhorias/claude/skills/* .claude/skills/
cp -R caminho/para/claudinhomelhorias/claude/agents/* .claude/agents/
# Copie só o que for usar: commands/, rules/, output-styles/

# Hooks e permissões entram em .claude/settings.json (mescle, não substitua no escuro)
# Use claude/settings/settings.exemplo.json e claude/hooks/ como referência
```

Para o `CLAUDE.md` do projeto, **não substitua** um arquivo existente. Incorporação seletiva: copie só os trechos novos de `claude/CLAUDE.md` ou de `claude/snippets/` (quando houver) para `./CLAUDE.md` ou `./.claude/CLAUDE.md`. Preferências só suas vão em `./CLAUDE.local.md` (já no `.gitignore`).

### Em todos os seus projetos (`~/.claude`)

```bash
mkdir -p ~/.claude/skills ~/.claude/agents ~/.claude/commands ~/.claude/rules ~/.claude/output-styles
cp -R caminho/para/claudinhomelhorias/claude/skills/* ~/.claude/skills/
cp -R caminho/para/claudinhomelhorias/claude/agents/* ~/.claude/agents/
```

Instruções pessoais permanentes: anexe trechos em `~/.claude/CLAUDE.md`. Settings e hooks pessoais: mescle em `~/.claude/settings.json`.

No Windows, `~/.claude` é `%USERPROFILE%\.claude`. Se `CLAUDE_CONFIG_DIR` estiver definido, use esse diretório no lugar de `~/.claude`.

### Carregar este repositório numa sessão (`--add-dir` / `/add-dir`)

O Claude Code só carrega skills, comandos e agentes de um diretório extra se existir uma pasta **`.claude/`** nele. Este repositório já traz um `.claude/` fino que aponta para o pacote em `claude/` (veja o `README` de `.claude/`). Na sessão:

```bash
claude --add-dir /caminho/para/claudinhomelhorias
```

Ou, já dentro do Claude Code: `/add-dir /caminho/para/claudinhomelhorias`.

## Estrutura

| Caminho | Função |
| --- | --- |
| [`CONTEXTO.md`](CONTEXTO.md) | Contexto persistente: objetivo, perfil, premissas, convenções, diário de decisões |
| [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md) | Passo a passo operacional para analisar um site (da captura ao relatório) |
| [`PROCESSO.md`](PROCESSO.md) | Contrato curto (qualidade, estados do índice); aponta para o guia |
| [`fontes/INDICE.md`](fontes/INDICE.md) | Tabela de sites processados |
| [`fontes/`](fontes/) | Notas por site (`NNN-slug.md`) |
| [`claude/`](claude/) | Pacote instalável (espelho de `.claude/`) |
| [`templates/`](templates/) | Modelos de nota e de cada tipo de artefato |
| [`referencias/praticas-oficiais.md`](referencias/praticas-oficiais.md) | Síntese das práticas oficiais consultadas na montagem inicial |
| [`CLAUDE.md`](CLAUDE.md) | Instruções deste repositório para o Claude Code |
| [`.claude/`](.claude/) | Ponte para o Claude Code carregar as skills e agentes daqui |

## Convenções rápidas

- Qualidade: curto, acionável, conferido na documentação oficial, sem duplicar o que já existe, com a fonte citada.
- Não cole trechos longos de artigos com direitos autorais; extraia o que dá para aplicar e cite a URL.
- Artefatos novos preferem **skills** a comandos avulsos (os comandos em `.claude/commands/` ainda funcionam, mas a documentação oficial recomenda skills para trabalho novo).
- Regras que não podem ter exceção viram hook, regra de permissão (`deny`) ou setting — não linha de `CLAUDE.md`.

## Documentação oficial (consulta)

- [Visão geral](https://code.claude.com/docs/en/overview)
- [Melhores práticas](https://code.claude.com/docs/en/best-practices)
- [Memória e CLAUDE.md](https://code.claude.com/docs/en/memory)
- [Diretório .claude](https://code.claude.com/docs/en/claude-directory)
- [Estender: quando usar cada mecanismo](https://code.claude.com/docs/en/features-overview)
- [Skills](https://code.claude.com/docs/en/skills)
- [Subagentes](https://code.claude.com/docs/en/sub-agents)
- [Hooks (guia)](https://code.claude.com/docs/en/hooks-guide) e [referência](https://code.claude.com/docs/en/hooks)
- [Settings](https://code.claude.com/docs/en/settings-reference)
- [Estilos de saída](https://code.claude.com/docs/en/output-styles)
- [MCP](https://code.claude.com/docs/en/mcp)
- [Plugins](https://code.claude.com/docs/en/plugins/overview)
