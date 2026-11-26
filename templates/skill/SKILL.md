---
name: nome-da-skill
description: >
  O que faz e quando usar. Comece pelo caso principal.
  A combinação description + when_to_use é truncada em 1.536 caracteres.
when_to_use: "Frases que o usuário diria e que devem disparar esta skill."
argument-hint: "[url]"
# arguments: [url]
# disable-model-invocation: true   # use em fluxos com efeito colateral que só o usuário deve disparar
# user-invocable: false            # só o Claude invoca; some do menu /
# allowed-tools: Read Grep Glob WebFetch
# paths:
#   - "src/**/*.ts"
metadata:
  destino: projeto
  fonte: "NNN"
  url: "https://exemplo.invalid/pagina"
  acesso: "AAAA-MM-DD"
---

<!-- destino: projeto = .claude/skills/  |  usuario = ~/.claude/skills/ -->

# Nome da skill

Passos numerados, curtos e verificáveis. Material de apoio longo vai em arquivos ao lado deste `SKILL.md`, não no `CLAUDE.md`.

1. …
2. …

## Argumentos

Se a skill aceitar argumentos: `$ARGUMENTS` (todos), `$0` / `$ARGUMENTS[0]` (primeiro), ou `$nome` se você declarou `arguments`.
