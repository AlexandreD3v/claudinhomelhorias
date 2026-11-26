---
name: use-code-mode
description: >
  Turns on and uses Claude Code's experimental Code Mode, where Claude
  writes JavaScript that chains several tool calls in one step.
  Use when talking about Code Mode, CLAUDE_CODE_EXPERIMENTAL_CODE_MODE,
  batched tool calls, or tasks with many related calls.
when_to_use: >
  The user wants to turn on Code Mode, asks whether it is worth it, mentions
  JavaScript chaining Bash/Read/Edit/MCP, or is about to make a change
  repeated across many files, a filtered search, or parallel commands.
argument-hint: ""
allowed-tools: Read Grep Glob
metadata:
  destination: user
  source: "002"
  url: "https://www.marktechpost.com/2026/11/17/anthropic-claude-code-code-mode-javascript-tool-calls/"
  accessed: "2026-11-25"
  mirror-of: usar-code-mode
---

# Use Code Mode (experimental)

**Install destination:** `user` (`~/.claude/skills/use-code-mode/`). US English mirror of `usar-code-mode`.

Code Mode is **experimental**, comes **off** by default and may change or disappear in any release. Procedure checked against the current official docs ([Code Mode](https://code.claude.com/docs/en/code-mode), [changelog](https://code.claude.com/docs/en/changelog)). Source 002 (MarkTechPost, November 17, 2026) summarizes the launch; where the article and the official docs diverge (cloud providers and telemetry), **follow the official docs for your version**.

## When to use

Tasks with many related tool calls, for example:

- a change repeated across several files;
- a search whose results need filtering before Claude reads the content;
- several independent commands that can run at the same time.

Do not turn it on just "to save tokens": Anthropic does **not** publish an official savings figure for Code Mode in the CLI.

## How to turn it on

Minimum requirements: Claude Code **v2.1.323** or later, **native build**, **interactive terminal** session. On Windows, Git for Windows is required. Models: Opus 5.5, Sonnet 5.5, Haiku 5.5 or Fable 5.2. Check `claude --version` and, if needed, `claude update`.

**In this session** (macOS, Linux, WSL):

```bash
CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1 claude
```

In PowerShell: `$env:CLAUDE_CODE_EXPERIMENTAL_CODE_MODE = "1"` and then `claude`.

**Personal default** (every new session): merge the `env` block into `~/.claude/settings.json` — see `en-us/claude/settings/code-mode.example.json`. The official docs say this variable **is ignored** in a project's settings: a cloned repository cannot turn Code Mode on for you.

The first time, confirm "Yes, turn on Code Mode". The session should show `Code Mode (experimental) is on`. To resume (`--continue` / `--resume`), the variable must still be `1`; with it at `0` or missing, Claude Code refuses to resume a Code Mode session.

A `0` anywhere (shell, user settings, `--settings` or managed settings) **turns it off**, even with `1` elsewhere. Admins can block it with `0` in managed settings; they cannot force it on.

If a subagent has a `tools:` list, include `REPL` so it can use Code Mode.

## How to follow it and the limits

- In the chat you see the tool calls (for example the diff), not the JavaScript. To read the code: `Ctrl+O`, expand the Code line, `Ctrl+O` again to go back.
- Code that Claude **waits on** stops at **10 minutes**. From v2.1.328, in Manual and `acceptEdits`, time spent at the permission prompt does not count toward that limit.
- In the **background** it can run up to **2 hours** while you keep chatting. The session must have started in auto or `bypassPermissions`.
- In **auto mode**, the classifier reviews each piece of code, not each tool call, and **does not see** values computed at run time (for example a path coming from a search). Keep `deny`/`ask` rules and `PreToolUse` hooks on the usual tool name (`Bash`, MCP tool, etc.). To inspect the JavaScript, hook on `REPL` reading `tool_input.code`.
- MCP and web calls from the code exist in the official docs; the sandbox covers shell commands, not the JavaScript nor those calls.

## Availability (follow your version, not only the article)

Source 002, written in the launch week (v2.1.323), said "subscription or Anthropic Console only" and listed OTEL/`DISABLE_TELEMETRY` as blockers. The current official docs differ on important points:

- **v2.1.331+:** Code Mode also in terminal sessions on Amazon Bedrock, Google Cloud's Agent Platform, Microsoft Foundry and Claude Platform on AWS. Still no gateway and no Claude for Government.
- **v2.1.329+:** works with OpenTelemetry events/metrics and with feature flags/`DISABLE_TELEMETRY` off. OpenTelemetry **tracing** and the **API key helper** on a direct Anthropic connection still prevent startup.
- Documented surface: interactive terminal. The official docs explicitly exclude the VS Code panel, the Desktop app and cloud sessions. Organizations with a HIPAA or zero-data-retention setup cannot use the feature.

## How to turn it off

Remove `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE` from the shell and from `~/.claude/settings.json`, or set it to `0`, and start a new session.

## What not to do

- Do not treat the article's token numbers (third-party test 11.1k vs 24.6k, or the 98.7% / 37% from **other** Anthropic products) as official CLI Code Mode savings.
- Do not put the variable in a project's `.claude/settings.json`: Claude Code ignores it.
- Do not assume the auto-mode classifier sees a path the code computes at run time.
