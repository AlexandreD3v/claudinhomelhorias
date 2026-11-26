# Subagentes

Cada subagente é um Markdown com frontmatter em `.claude/agents/nome.md` (projeto) ou `~/.claude/agents/` (usuário). Ele roda num contexto isolado e devolve um resumo. A `description` precisa deixar claro **quando** delegar — ela entra no contexto da sessão principal, então mantenha-a curta.

**Instalação:** copie o arquivo para `.claude/agents/` ou `~/.claude/agents/`. Reinicie a sessão se o Claude não enxergar o agente novo. Lista e lembrete: `/agents`.

**Formato oficial:** [Create custom subagents](https://code.claude.com/docs/en/sub-agents). Campos comuns: `name`, `description`, `tools`, `disallowedTools` (camelCase), `model`, `effort`, `permissionMode`, `isolation`, `omitClaudeMd`. Lista completa em [`referencias/praticas-oficiais.md`](../../referencias/praticas-oficiais.md). Template: [`templates/agente.md`](../../templates/agente.md).

Prioridade se o mesmo `name` existir em vários lugares: settings gerenciados > flag `--agents` > projeto > usuário > plugin.

Subagente incluído neste pacote: [`extrator-fonte.md`](extrator-fonte.md).
