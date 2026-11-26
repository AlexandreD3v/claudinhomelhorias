#!/usr/bin/env bash
# Exemplo mínimo de hook command.
# Não bloqueia nada: lê o JSON de stdin e sai 0.
# Fonte: formato oficial (hooks-guide), montagem inicial de 2026-11-25.
set -euo pipefail
# stdin chega mesmo se você não for usar: consome para não quebrar o pipe
cat >/dev/null
exit 0
