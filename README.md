# Claudinho Melhorias

Repositório pessoal de **Alexandre Jackson Correa** para transformar artigos e guias sobre o [Claude Code](https://code.claude.com/docs/en/overview) e sobre o app Claude (chat e Claude Desktop, Mac e Windows), da Anthropic, em instruções úteis. O que serve ao Claude Code vai para `claude/`; o que serve ao app Claude vai para [`claude-app/`](claude-app/).

O fluxo é simples: chega um link, o conteúdo é lido, os insights acionáveis são classificados no tipo certo de artefato (trecho de `CLAUDE.md`, skill, comando, subagente, hook, setting, regra, estilo de saída ou MCP) e o resultado fica versionado aqui. Cada artefato declara o destino: no Claude Code, `projeto` (`.claude/` do projeto) ou `usuario` (`~/.claude`); no app Claude, `app-claude`, `projeto-claudeai` ou `configuracoes`. Cada fonte tem um tema (`claude-code`, `claude-app` ou `ambos`) no índice.

Todo o material deste repositório é escrito em **pt-BR**. Nomes de skills, comandos e agentes usam kebab-case ASCII, porque o Claude Code pode recusar caracteres especiais no nome.

## Como usar

1. Abra este repositório no Claude Code (ou peça a um assistente para seguir [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md)).
2. Envie o link do site.
3. O assistente segue o guia: captura a fonte em `fontes/`, lê e avalia credibilidade, extrai o que serve ao Claude Code ou ao app Claude, confere na [documentação oficial](https://code.claude.com/docs/en/overview) (e, para o app, em claude.com/resources e support.claude.com), grava o artefato em `claude/` ou em `claude-app/`, valida e atualiza o índice.
4. Você instala cada artefato do Claude Code no destino que ele declara (`projeto` ou `usuario`). Os de `claude-app/` você lê e segue no app, ou cola onde o destino indica (veja o README da pasta).

Antes de processar um site, leia [`CONTEXTO.md`](CONTEXTO.md) (premissas e contexto persistente) e [`GUIA-ANALISE-SITE.md`](GUIA-ANALISE-SITE.md) (passo a passo). [`PROCESSO.md`](PROCESSO.md) é o contrato curto de qualidade e aponta para o guia.

## Instalar os artefatos

Esta seção vale para o Claude Code (`claude/`). Os artefatos do app Claude ficam em [`claude-app/`](claude-app/) e **não** se instalam por cópia: o app não lê este repositório. Leia o artefato e siga o passo a passo, ou cole o texto no lugar que o destino indica (`app-claude`, `projeto-claudeai` ou `configuracoes`).

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
| [`fontes/INDICE.md`](fontes/INDICE.md) | Tabela de sites processados, com tema, artefatos e status |
| [`fontes/`](fontes/) | Notas por site (`NNN-slug.md`) |
| [`claude/`](claude/) | Pacote instalável do Claude Code (espelho de `.claude/`) |
| [`claude-app/`](claude-app/) | Pacote do app Claude: guias, instruções de projeto, estilos, prompts e configurações (sem instalação por cópia) |
| [`templates/`](templates/) | Modelos de nota e de cada tipo de artefato |
| [`referencias/praticas-oficiais.md`](referencias/praticas-oficiais.md) | Síntese das práticas oficiais consultadas na montagem inicial |
| [`CLAUDE.md`](CLAUDE.md) | Instruções deste repositório para o Claude Code |
| [`.claude/`](.claude/) | Ponte para o Claude Code carregar as skills e agentes daqui |

## Convenções rápidas

- Escopo: Claude Code (`claude/`) e app Claude (`claude-app/`). Descarta-se só o que não serve a nenhum dos dois.

- Qualidade: curto, acionável, conferido na documentação oficial, sem duplicar o que já existe, com a fonte citada.
- Não cole trechos longos de artigos com direitos autorais; extraia o que dá para aplicar e cite a URL.
- Artefatos novos preferem **skills** a comandos avulsos (os comandos em `.claude/commands/` ainda funcionam, mas a documentação oficial recomenda skills para trabalho novo).
- Regras que não podem ter exceção viram hook, regra de permissão (`deny`) ou setting — não linha de `CLAUDE.md`.

## Documentação oficial (consulta)

App Claude: [Help Center](https://support.claude.com), [claude.com/resources](https://claude.com/resources), [notícias da Anthropic](https://www.anthropic.com/news) e as [notas de versão](https://support.claude.com/en/articles/12138966-release-notes).

Claude Code:

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
