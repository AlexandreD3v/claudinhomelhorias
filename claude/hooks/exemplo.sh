#!/usr/bin/env bash
# Destino de instalação: projeto (./.claude/hooks/exemplo.sh, com o bloco
# mesclado em .claude/settings.json). Para uso pessoal em todos os projetos,
# seria usuario (~/.claude/hooks/ + ~/.claude/settings.json); este exemplo
# didático fica em projeto.
# Exemplo mínimo de hook command.
# Não bloqueia nada: lê o JSON de stdin e sai 0.
# Fonte: formato oficial (hooks-guide), montagem inicial de 2026-11-25.
set -euo pipefail
# stdin chega mesmo se você não for usar: consome para não quebrar o pipe
cat >/dev/null
exit 0
