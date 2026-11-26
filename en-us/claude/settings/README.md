# Settings

**Install destination of [`settings.example.json`](settings.example.json):** the example keys are split when copying — `permissions.deny` for `.env` goes to `project` (`.claude/settings.json`); `outputStyle: concise-en-us` goes to `user` (`~/.claude/settings.json`), because the style is a personal preference. Do not copy the whole file to both places. The JSON carries no unofficial key.

JSON files that Claude Code **enforces** (permissions, hooks, `outputStyle`, environment variables, model). Unlike `CLAUDE.md`, this is not just guidance for the model.

**Where it lives:**

| File | Scope |
| --- | --- |
| `.claude/settings.json` | Project, shared in git |
| `.claude/settings.local.json` | Only you, in this project (do not commit) |
| `~/.claude/settings.json` | Only you, in every project |

Precedence, highest first: managed settings and the `--settings` flag > `settings.local.json` > project settings > user settings. Simple values (such as `model`) use the highest-precedence one; lists such as `permissions.allow` usually merge.

**Install:** merge the keys of [`settings.example.json`](settings.example.json) into the target file. Do not copy it over a `settings.json` already in use.

Docs: [Explore the .claude directory](https://code.claude.com/docs/en/claude-directory) and the [settings reference](https://code.claude.com/docs/en/settings-reference). Project MCP servers live in `.mcp.json` at the root, not in this file.

## Fragment `opusplan.example.json`

**Install destination:** `user` (merge the `model` key into `~/.claude/settings.json`, do not replace the whole file). Optional: use it only if you want `opusplan` as the default for new sessions. Picking `opusplan` only in `/model` does not save the default, according to the official model docs. Details and caveats: skill [`use-opusplan`](../skills/use-opusplan/SKILL.md) (source 001).

## Fragment `code-mode.example.json`

**Install destination:** `user` (merge the `env` block into `~/.claude/settings.json`, do not replace the file and **do not** put it in a project's settings). The official docs ignore `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE` in repository settings. Permanent, experimental opt-in; details and restrictions in the skill [`use-code-mode`](../skills/use-code-mode/SKILL.md) (source 002).
