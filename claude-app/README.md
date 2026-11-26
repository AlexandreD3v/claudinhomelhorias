# Pacote do app Claude (`claude-app/`)

Material guardado para o **app Claude** (chat e Claude Desktop, no Mac e no Windows, e o claude.ai no navegador): guias de uso, instruções de projeto, estilos, prompts e configurações. É o par de [`claude/`](../claude/), que continua sendo o pacote do **Claude Code**. As duas pastas ficam lado a lado, no `main`.

Esta pasta vem da mudança de escopo confirmada por Alexandre em 26 de novembro de 2026 (America/Sao_Paulo). A regra completa está em [`CONTEXTO.md`](../CONTEXTO.md): de cada site, extrai-se o que serve ao Claude Code (vai para `claude/`) ou ao app Claude (vai para `claude-app/`). Só se descarta o que não serve a nenhum dos dois.

## O que entra aqui

| Subpasta | O que guarda | Destino de instalação |
| --- | --- | --- |
| [`guias/`](guias/) | Guia de uso de um recurso do app: requisitos, versão, planos, passo a passo, permissões, limites, boas práticas | `app-claude` |
| `projetos/` | Instruções de projeto: texto para colar nas instruções de um Projeto do claude.ai | `projeto-claudeai` |
| `estilos/` | Estilo e preferências de resposta, para colar nas preferências ou num estilo do app | `configuracoes` |
| `prompts/` | Prompt reutilizável para colar numa conversa | `app-claude` |
| `configuracoes/` | Ajustes do app, como ligar um recurso, permissões e conectores (inclusive o que um owner de Team/Enterprise controla) | `configuracoes` |

Só existe `guias/` hoje. As outras subpastas nascem com o primeiro artefato do tipo, em kebab-case ASCII, como em `claude/`.

## Destino de instalação

Todo artefato daqui declara o destino numa linha logo abaixo do título (`**Destino de instalação:** …`), com um destes valores:

- `app-claude` — o app Claude para Mac ou Windows (e, quando o recurso existir lá, o claude.ai no navegador). O artefato é para ler e seguir no app ou para colar numa conversa.
- `projeto-claudeai` — um Projeto do claude.ai (instruções do projeto e arquivos de conhecimento). Vale só para as conversas daquele projeto.
- `configuracoes` — as Configurações do app ou da organização (preferências do perfil, estilos, recursos e conectores). Vale para todas as conversas da conta, ou da organização quando o artefato é para owner.

Diferente de `claude/`, aqui **não há instalação por cópia de arquivo**: o Claude Code lê `.claude/`, mas o app Claude não lê esta pasta. O artefato é um texto para ler, seguir ou colar no lugar que o destino indica.

## Como usar

1. Abra o [`USO.md`](../USO.md) ou o [`fontes/INDICE.md`](../fontes/INDICE.md) e procure as fontes com tema `claude-app` ou `ambos`. A versão en-US desta pasta está em [`en-us/claude-app/`](../en-us/claude-app/).
2. Abra o artefato e leia o destino logo no começo.
3. Siga o passo a passo no app, ou cole o texto onde o destino manda (instruções do projeto, preferências, conversa).
4. Confira a versão e o plano que o artefato exige. Recursos do app estão em beta e mudam rápido; a data de conferência de cada artefato está no cabeçalho.

## Como cada artefato nasce

Mesmo pipeline de [`GUIA-ANALISE-SITE.md`](../GUIA-ANALISE-SITE.md): nota em `fontes/NNN-slug.md`, conferência na documentação oficial (claude.com/resources, support.claude.com, anthropic.com/news), deduplicação, template [`templates/artefato-claude-app.md`](../templates/artefato-claude-app.md), citação da fonte no próprio artefato. O que não foi testado no app Claude deixa a fonte em `parcial`. O status `publicado` exige teste e push no GitHub.

## Guias hoje

- [`guias/instalar-artifact-como-app.md`](guias/instalar-artifact-como-app.md) — instalar um artifact como app no Claude para Mac e Windows, com permissões, limites e cota (fonte 003, não testado).
- [`guias/skills-pelo-mcp.md`](guias/skills-pelo-mcp.md) — skills, Tasks e Elicitation enviados pelo conector MCP, com planos, o que o artigo e o oficial divergem, e File Uploads ainda em rollout (fonte 006, não testado).
