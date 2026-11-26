# Comandos (formato legado)

Um comando é um único arquivo Markdown em `.claude/commands/foo.md`, invocado com `/foo`.

**Para trabalho novo, crie uma skill** em `../skills/`. A documentação oficial ([Skills](https://code.claude.com/docs/en/skills)) unificou os comandos customizados às skills: os arquivos desta pasta continuam válidos, o Claude pode invocá-los sozinho, e uma skill de mesmo nome tem precedência.

**Instalação:** copie o `.md` para `.claude/commands/` ou `~/.claude/commands/`.

**Frontmatter:** os mesmos campos de uma skill, **exceto** `name` e `paths`. O nome do comando é o do arquivo. Para o Claude não disparar sozinho, use `disable-model-invocation: true`. Template: [`templates/comando.md`](../../templates/comando.md).

## Exemplo mínimo válido

Arquivo `.claude/commands/status-repo.md`:

```markdown
---
description: Resume o estado do git deste repositório (branch, status e últimos commits).
disable-model-invocation: true
argument-hint: ""
---

Rode `git status -sb` e `git log -5 --oneline` e resuma em pt-BR: branch atual, arquivos modificados e os cinco últimos commits. Não faça commit.
```

Não há comandos instaláveis neste pacote ainda (a skill `processar-fonte` cobre o fluxo principal).
