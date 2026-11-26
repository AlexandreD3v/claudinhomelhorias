# Práticas oficiais do Claude Code

Síntese consultada em **25 de novembro de 2026** (America/Sao_Paulo), a partir da documentação oficial em [code.claude.com](https://code.claude.com/docs/en/overview). Esta página não substitui os guias; use os links para conferir o formato vigente antes de gravar um artefato.

A documentação viva está em `code.claude.com`. Há também um artigo de engenharia mais antigo da Anthropic sobre o tema; na data desta consulta, o guia [Best practices for Claude Code](https://code.claude.com/docs/en/best-practices) é a referência corrente a seguir.

## Quando usar cada mecanismo

Fonte: [Extend Claude Code](https://code.claude.com/docs/en/features-overview), [Best practices](https://code.claude.com/docs/en/best-practices).

- Instruções que o modelo **lê e decide** se aplica: prompt, `CLAUDE.md`, skills. Não há garantia absoluta de cumprimento.
- Instruções que o **harness aplica sempre**: hooks, regras `deny`, settings gerenciados, sandbox em modo estrito.
- `CLAUDE.md`: contexto persistente de toda sessão. Só o que o Claude não vê no repositório. Curto e concreto (alvo: menos de 200 linhas). Procedimento longo sai daqui e vira skill. Instrução localizada vira regra com `paths`.
- Skill: conhecimento ou fluxo reutilizável; o corpo só carrega quando a skill é usada ou invocada com `/nome`. Prefira skill a comando avulso para trabalho novo.
- Subagente: outro loop, contexto isolado, devolve resumo. Bom para trabalho paralelo, revisão independente ou pesquisa barulhenta — não para “obter uma resposta melhor” da mesma tarefa.
- Hook: efeito colateral ou bloqueio em um evento do ciclo (`PreToolUse`, `PostToolUse`, `Stop`, etc.). Para enforcement de verdade, use hook `command`/`http`/`mcp_tool` (não `prompt`/`agent`) e, se a falha do hook não puder passar, `onFailure: "block"`.
- MCP: ferramentas externas sem CLI confortável. Servidores de projeto em `.mcp.json`; servidores só seus em `~/.claude.json`.
- Plugin: empacota skills, agentes, hooks, MCP, estilos e afins para distribuir.
- Estilo de saída: papel, tom e formato de **todas** as respostas da sessão.

O guia de práticas também recomenda: dê ao Claude um **critério de pronto** (teste, typecheck, spec); não descreva no `CLAUDE.md` a arquitetura que ele já lê no repo; o esforço se controla pelo nível de effort, não por frases como “think hard” (o `ultrathink` ainda pede raciocínio mais fundo naquele turno).

## Onde os arquivos vivem

Fonte: [How Claude remembers your project](https://code.claude.com/docs/en/memory), [Explore the .claude directory](https://code.claude.com/docs/en/claude-directory).

| Artefato | Projeto (compartilhar) | Usuário (todos os projetos) | Observação |
| --- | --- | --- | --- |
| Instruções persistentes | `./CLAUDE.md` ou `./.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` | `./CLAUDE.local.md` é pessoal; coloque no `.gitignore`. `AGENTS.md` pode ser lido no lugar ou ao lado, conforme a config |
| Regras por caminho | `.claude/rules/*.md` | `~/.claude/rules/` | Único campo de frontmatter lido: `paths` |
| Settings / hooks / permissões | `.claude/settings.json` | `~/.claude/settings.json` | `.claude/settings.local.json` é pessoal e costuma ser gitignored. Settings **valem** mesmo se o modelo ignorar o `CLAUDE.md` |
| Skills | `.claude/skills/<nome>/SKILL.md` | `~/.claude/skills/<nome>/SKILL.md` | Preferir este formato para trabalho novo |
| Comandos (legado) | `.claude/commands/<nome>.md` | `~/.claude/commands/<nome>.md` | Ainda funcionam; se o nome colidir com uma skill, a skill vence |
| Subagentes | `.claude/agents/<nome>.md` | `~/.claude/agents/<nome>.md` | Prioridade: managed > flag `--agents` > projeto > usuário > plugin |
| Estilos de saída | `.claude/output-styles/<nome>.md` | `~/.claude/output-styles/<nome>.md` | Ative com `outputStyle` no settings ou `/output-style` |
| MCP de projeto | `.mcp.json` na raiz | `~/.claude.json` (servidores pessoais) | — |
| Auto memory | (por repositório, gerida pelo Claude) | — | O modelo anota aprendizados; não substitui o `CLAUDE.md` que você escreve |

Precedência típica de settings (do mais específico): flag `--settings` e settings gerenciados > `.claude/settings.local.json` > `.claude/settings.json` > `~/.claude/settings.json`. Listas como `permissions.allow` em geral se mesclam.

## Frontmatter (campos oficiais na data da consulta)

O YAML precisa começar na primeira linha do arquivo (`---`). Campo desconhecido é ignorado sem erro; YAML inválido carrega o arquivo como se não houvesse frontmatter.

**Skill** (`SKILL.md`) — [referência](https://code.claude.com/docs/en/skills): `name`, `description` (recomendado), `when_to_use`, `argument-hint`, `arguments`, `disable-model-invocation`, `user-invocable`, `allowed-tools`, `disallowed-tools`, `model`, `effort`, `context`, `agent`, `background`, `hooks`, `paths`, `shell`, `metadata`, `license`, `compatibility`.

**Comando** (`.claude/commands/*.md`): os mesmos da skill, **exceto** `name` e `paths`. O nome do comando vem do arquivo.

**Subagente** — [referência](https://code.claude.com/docs/en/sub-agents): `name`, `description`, `tools`, `disallowedTools`, `model`, `permissionMode`, `maxTurns`, `autoCompactWindow`, `skills`, `mcpServers`, `hooks`, `memory`, `background`, `effort`, `isolation`, `color`, `initialPrompt`, `omitClaudeMd`, `experimental`.

**Estilo de saída**: `name`, `description`, `keep-coding-instructions`, `force-for-plugin`.

**Regra**: apenas `paths`.

## Hooks e settings

Fontes: [Hooks guide](https://code.claude.com/docs/en/hooks-guide), [Hooks reference](https://code.claude.com/docs/en/hooks).

A configuração fica no objeto `hooks` de um arquivo de settings, por evento (`Notification`, `PostToolUse`, `PreToolUse`, `Stop`, `SessionStart`, …), com `matcher` opcional e uma lista de handlers (`type: command` é o caso usual). Scripts podem viver em qualquer caminho; neste repo a convenção é `claude/hooks/`. Verifique a config com `/hooks` na sessão.

## Skills: detalhes que afetam o pipeline

Fonte: [Skills](https://code.claude.com/docs/en/skills).

- A combinação `description` + `when_to_use` é truncada em 1.536 caracteres no listing.
- `disable-model-invocation: true` impede o Claude de disparar a skill sozinho (use em fluxos com efeito colateral, como um release).
- `user-invocable: false` esconde a skill do menu `/`.
- Para carregar skills deste repositório numa sessão de outro projeto: `--add-dir` / `/add-dir` no diretório que contém `.claude/skills/`.
- Em colisão de nomes, a ordem típica é enterprise > pessoal (`~/.claude`) > projeto; uma skill vence um comando de mesmo nome.

## Como instalar (resumo)

- Projeto: copiar para `.claude/…` e, nos trechos de orientação permanente, editar `./CLAUDE.md` ou `./.claude/CLAUDE.md` com critério. Não versionar `CLAUDE.local.md` nem `settings.local.json`.
- Usuário: copiar para `~/.claude/…`.
- Conferir o que carregou: `/context`, `/doctor`, `/hooks`, `/mcp`.

## App Claude (chat e Claude Desktop)

Escopo acrescentado em 26 de novembro de 2026. Estas páginas são onde se confere um recurso do app antes de gravar em [`claude-app/`](../claude-app/). Em beta, o conteúdo muda rápido: reabra a página vigente a cada fonte.

- [Claude by Anthropic: recursos e artigos](https://claude.com/resources) — anúncios de recursos, como [Turn artifacts into Mac and Windows apps](https://claude.com/resources/articles/install-as-app).
- [Help Center](https://support.claude.com) — passo a passo, requisitos, planos e limites; por exemplo [Install an artifact as an app](https://support.claude.com/en/articles/18516354-install-an-artifact-as-an-app) e o [guia de admin de artifacts](https://support.claude.com/en/articles/16994751-artifacts-admin-guide-for-team-and-enterprise-plans).
- [Notas de versão do Claude](https://support.claude.com/en/articles/12138966-release-notes) e [changelog do Claude Desktop](https://claude.com/docs/cowork/changelog) — datam o recurso e a versão mínima.
- [Notícias da Anthropic](https://www.anthropic.com/news).
- Pontos de contato com o Claude Code: [artifacts do Claude Code](https://code.claude.com/docs/en/artifacts) e [app desktop](https://code.claude.com/docs/en/desktop-quickstart).

Destinos dos artefatos do app: `app-claude`, `projeto-claudeai` e `configuracoes`. Não há instalação por cópia de arquivo; veja [`claude-app/README.md`](../claude-app/README.md).
