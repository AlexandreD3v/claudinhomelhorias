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
metadata:
  fonte: "NNN"
  url: "https://exemplo.invalid/pagina"
  acesso: "AAAA-MM-DD"
---

Você é um especialista em …. Ao ser invocado:

1. …
2. Devolva só um resumo estruturado à conversa principal. Não traga logs ou arquivos inteiros.

O campo `tools` acima é uma lista YAML de nomes de ferramentas (vírgula no mesmo estilo do exemplo oficial também é aceito). `disallowedTools` usa camelCase, diferente das skills.
