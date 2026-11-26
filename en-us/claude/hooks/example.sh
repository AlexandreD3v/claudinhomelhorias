#!/usr/bin/env bash
# Install destination: project (./.claude/hooks/example.sh, with the block
# merged into .claude/settings.json). For personal use in every project it
# would be user (~/.claude/hooks/ + ~/.claude/settings.json); this teaching
# example stays in project.
# Minimal command hook example.
# Blocks nothing: reads the JSON from stdin and exits 0.
# Source: official format (hooks-guide), initial setup of 2026-11-25.
# US English mirror of claude/hooks/exemplo.sh.
set -euo pipefail
# stdin arrives even if you do not use it: consume it so the pipe does not break
cat >/dev/null
exit 0
