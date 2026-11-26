# Source 002 — Anthropic Adds Code Mode to Claude Code: Claude Now Chains Tool Calls in JavaScript

- **URL:** https://www.marktechpost.com/2026/11/17/anthropic-claude-code-code-mode-javascript-tool-calls/
- **Accessed:** 2026-11-25 23:16 (America/Sao_Paulo)
- **Author / site:** Michal Sutter, MarkTechPost. Published November 17, 2026. The link as sent had `?amp=1`; the canonical (non-AMP) URL is the one recorded above.
- **Tema:** claude-code
- **Status:** parcial
- **pt-BR original:** [`fontes/002-marktechpost-code-mode.md`](../../fontes/002-marktechpost-code-mode.md)

## Summary

News article about Claude Code's Code Mode, launched as an experimental opt-in feature in v2.1.323. Instead of each Bash/Read/Edit being a separate step, Claude writes JavaScript that chains several tool calls, can filter results before returning them and can run commands in parallel. The text summarizes how to turn it on (`CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1`), when to use it, permissions (in auto mode the classifier reviews the code, not each call), time limits (10 minutes waiting, 2 hours in the background) and surface restrictions. Anthropic does not publish an official token-savings number for Code Mode in the CLI; the article cites a third-party test (11.1k vs 24.6k) and compares with other products (MCP code execution and the API's Programmatic Tool Calling).

## What was read

- The article's canonical page (without `?amp=1`). No other pages of the site.
- For the official check: [Run tool calls from code with Code Mode](https://code.claude.com/docs/en/code-mode) (page as of November 25, 2026) and the [changelog](https://code.claude.com/docs/en/changelog) (entries 2.1.328–2.1.332, November 19 to 25, 2026).

## Actionable insights

### Insight 1 — Turn on Code Mode (experimental opt-in)

- **Action:** On v2.1.323 or later (native build), set `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1` in the shell or in the `env` block of `~/.claude/settings.json`, confirm "Yes, turn on Code Mode" in the first session and look for the "Code Mode (experimental) is on" line. The variable in **project** settings is ignored. A `0` anywhere turns it off, even with `1` elsewhere. Admins can only block it (not force it) via managed settings.
- **When it matters:** To try the feature or keep it on in personal sessions.
- **Artifact type:** skill + settings fragment
- **Install destination:** user (`usuario`; the official docs prevent turning it on from project settings)
- **Source section:** "How do you turn on Code Mode?"
- **Checked against official docs:** yes — https://code.claude.com/docs/en/code-mode

### Insight 2 — When it pays off and how to follow the code

- **Action:** Use it for tasks with many related tool calls (a change repeated across several files, a search that needs filtering before reading, independent commands in parallel). The chat shows the tool calls (for example the diff), not the JavaScript; to see the code, `Ctrl+O` and expand the Code line.
- **When it matters:** Once it is on, when choosing the task.
- **Artifact type:** folded into the skill
- **Install destination:** user (`usuario`)
- **Source section:** "What is Code Mode" and "When should developers use Code Mode?"
- **Checked against official docs:** yes — same official page, including the `retryPolicy` example

### Insight 3 — Permissions, hooks and long-running code

- **Action:** Keep `deny`/`ask` and `PreToolUse` hooks on the usual tool name (Bash, MCP tool, etc.). In auto mode, the classifier reviews the **code**, not each call, and does not see values computed at run time (for example a path coming from the search). To inspect the JavaScript, hook on `REPL` reading `tool_input.code`. Code being waited on stops at 10 minutes (in Manual/`acceptEdits`, time at the permission prompt does not count from v2.1.328). In the background (session started in auto or `bypassPermissions`) it can run up to 2 hours while you chat.
- **When it matters:** For people who already have hooks/rules, or run long builds.
- **Artifact type:** folded into the skill
- **Install destination:** user (`usuario`)
- **Source section:** "How does Code Mode handle permissions and long-running code?"
- **Checked against official docs:** yes — including the prompt-time detail (v2.1.328) the article lacks

## Artifacts produced

- `en-us/claude/skills/use-code-mode/SKILL.md` (pt-BR: `claude/skills/usar-code-mode/SKILL.md`) — destination: `user` (`~/.claude/skills/use-code-mode/`) — when and how to turn on Code Mode, limits and divergences from the current official docs.
- `en-us/claude/settings/code-mode.example.json` (pt-BR: `claude/settings/code-mode.exemplo.json`) — destination: `user` (merge the `env` block into `~/.claude/settings.json`; do **not** use project settings) — optional permanent opt-in.

## Duplicates and reuse

There was no skill, snippet or setting about Code Mode in the `claude/` package.

## Divergences from the official docs

- **Cloud providers.** The article (November 17, 2026) states "Anthropic API or Claude subscription only" and "No Bedrock, Google Cloud, Foundry". The current official docs and the **v2.1.331** changelog (November 23, 2026) now allow Code Mode in terminal sessions on Amazon Bedrock, Google Cloud's Agent Platform, Microsoft Foundry and Claude Platform on AWS. Still **no** gateway and no Claude for Government. Both sides: the article described the state at v2.1.323; the current official docs are broader from 2.1.331. The artifact follows the current official docs.
- **Telemetry / `DISABLE_TELEMETRY` / OpenTelemetry.** The article lists "API key helper, OpenTelemetry export or `DISABLE_TELEMETRY`" as settings that block the feature. The official docs still block the **API key helper** on a direct Anthropic connection and OpenTelemetry **tracing**. OTEL events/metrics and feature flags/`DISABLE_TELEMETRY` off became compatible in **v2.1.329** (November 19, 2026), with the caveat of keeping tracing off. Both sides: the article reflected the launch version; later official docs loosened part of those restrictions.
- **Orchestrated tools.** The article's table says the CLI's Code Mode orchestrates "Built-in tools (Bash, Read, Edit)". The official docs also cover **MCP** and web calls from the code (rules/hooks on the MCP tool name; those calls run outside the sandbox). Both sides: the article stresses the CLI's native tools; the official docs include MCP/web. The skill mentions MCP.
- **`-p` and Agent SDK.** The article includes them in the exclusion list. The official docs require "an interactive `claude` session in the terminal" and explicitly exclude the VS Code panel, the Desktop app and cloud sessions; they do **not** name `-p` or the Agent SDK. Both sides stay visible; the skill does not present those two exclusions as official text.
- **Token numbers.** The article is right that Anthropic publishes no official figure for CLI Code Mode. The 98.7% and the 43,588→27,297 average come from **other** products (code execution with MCP / the API's Programmatic Tool Calling), not Claude Code's Code Mode. The 11.1k vs 24.6k is a third-party test; the skill does not treat them as a guarantee.

## Conflicts between sources

- **MarkTechPost (Nov 17):** availability only via subscription/Anthropic Console; OTEL export and `DISABLE_TELEMETRY` block it; tools = Bash/Read/Edit.
- **Official docs + changelog (up to Nov 25):** experimental opt-in Code Mode confirmed; from 2.1.331 there is cloud-provider support in the terminal; from 2.1.329 OTEL events/metrics and flags off are compatible (tracing stays off); MCP/web also run from the code.
- Recommendation (aligned with the official docs, without hiding the article): turn on and use Code Mode per the current official page; treat the article's cloud and telemetry restrictions as the launch-week state, not the current rule if the version is 2.1.331+.

## Open items

- **Test in Claude Code not done yet** (no Claude Code in this session). The status stays `parcial` even after the GitHub push. To close as `publicado`: have v2.1.323+ (native build), turn on Code Mode, confirm the prompt, run `/use-code-mode` (or `/usar-code-mode`) or a task with several tool calls and check the "Code Mode (experimental) is on" line and the code in `Ctrl+O`.
- GitHub push: up to whoever publishes the patch; the status does **not** change to `publicado` with the push alone.
