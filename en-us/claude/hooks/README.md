# Hooks

**Install destination for the examples in this folder:** `project` (script in `.claude/hooks/` and block merged into `.claude/settings.json`). The value is also in the header of [`example.sh`](example.sh). The JSON in [`example-block.json`](example-block.json) carries no unofficial key, so it can be merged.

Claude Code does **not** load this folder on its own. Hooks are declared in the `hooks` object of a settings file (`.claude/settings.json`, `.claude/settings.local.json` or `~/.claude/settings.json`). The scripts here are the `command` that config points to.

**Official guide:** [Automate actions with hooks](https://code.claude.com/docs/en/hooks-guide) and the [reference](https://code.claude.com/docs/en/hooks). In the session, check with `/hooks`.

**Install:**

1. Copy the script into the project (by convention, `.claude/hooks/`) and make it executable on macOS/Linux (`chmod +x`).
2. Merge the matching JSON block into the target `settings.json`. Do not replace the whole file if it already has other hooks.
3. For rules that must not fail together with the hook, the official reference describes `onFailure: "block"` on the handler.

Typical format (event → list of matchers → handlers):

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/hooks/example.sh"
          }
        ]
      }
    ]
  }
}
```

An empty matcher (`""`) matches every event of that type. The script receives JSON on stdin (fields such as `tool_input`). Exit `0` lets it proceed; exit `2` usually blocks and sends stderr back to Claude.

Files in this package: [`example.sh`](example.sh) and the block in [`example-block.json`](example-block.json). They are teaching examples — install only if you want a starting point.
