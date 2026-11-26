---
name: nome-do-agente
description: >
  O que o subagente faz e quando o Claude deve delegar a ele.
  Mantenha a description curta: ela entra no contexto da sessão principal.
tools: Read, Grep, Glob
# disallowedTools: Write, Edit
model: inherit
# effort: medium
# permissionMode: default
# isolation: worktree
# omitClaudeMd: true
# memory: user
---

**Destino de instalação:** projeto

<!-- Valores: projeto = .claude/agents/  |  usuario = ~/.claude/agents/
     Não use um campo `metadata` no frontmatter: ele não é oficial em subagentes.
     Fonte: NNN — URL — acesso AAAA-MM-DD (America/Sao_Paulo) -->

Você é um especialista em …. Ao ser invocado:

1. …
2. Devolva só um resumo estruturado à conversa principal. Não traga logs ou arquivos inteiros.

O campo `tools` acima é uma lista YAML de nomes de ferramentas (vírgula no mesmo estilo do exemplo oficial também é aceito). `disallowedTools` usa camelCase, diferente das skills.
