# Ponte `.claude/` deste repositório

O Claude Code lê skills, agentes, comandos, regras e estilos a partir de `.claude/` (e de `~/.claude/`). Os artefatos canônicos e portáteis estão em [`claude/`](../claude/). Esta pasta existe para:

- a sessão no checkout deste repositório carregar a skill `processar-fonte` e o subagente `extrator-fonte`;
- `--add-dir` / `/add-dir` apontando para este repositório também enxergar esses artefatos.

Os arquivos aqui são cópias de trabalho das versões em `claude/`. Se você editar um deles, edite o de `claude/` e mantenha os dois iguais (a skill `processar-fonte` e o processo pedem isso implicitamente: o pacote instalável é `claude/`).

Não coloque `settings.local.json` no git.
