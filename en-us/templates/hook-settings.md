# Hook block template

- **Install destination:** `project` (merge into `.claude/settings.json` and save the script in `.claude/hooks/`) or `user` (merge into `~/.claude/settings.json` and save the script in `~/.claude/hooks/`). Pick **one** value when instantiating.
- The JSON to merge is in [`hook-settings.json`](hook-settings.json). It has no unofficial keys, so it can be merged directly. Do not replace a `settings.json` already in use: merge only the `hooks` object.

Source: NNN — URL — accessed YYYY-MM-DD (America/Sao_Paulo)
