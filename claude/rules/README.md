# Regras (`.claude/rules/`)

Arquivos Markdown cuja única chave de frontmatter lida pelo Claude Code é `paths`. Sem `paths`, a regra se comporta como instrução geral; com `paths`, ela só entra no contexto quando os arquivos em trabalho combinam com os globs.

**Instalação:** copie o `.md` para `.claude/rules/` (projeto) ou `~/.claude/rules/` (usuário).

**Exemplo mínimo válido:**

```markdown
---
paths:
  - "**/*.ts"
  - "**/*.tsx"
---

- Use 2 espaços de indentação nestes arquivos.
- Não exporte símbolos mortos; remova o código em vez de comentar em bloco.
```

Template: [`templates/regra.md`](../../templates/regra.md). Documentação: [How Claude remembers your project](https://code.claude.com/docs/en/memory) (seção de `.claude/rules/`).

Ainda não há regras provenientes de fontes externas.
