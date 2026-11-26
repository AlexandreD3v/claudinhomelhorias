# Official Claude Code practices

US English mirror of [`referencias/praticas-oficiais.md`](../../referencias/praticas-oficiais.md) (pt-BR, canonical). Summary checked on **November 25, 2026** (America/Sao_Paulo), from the official docs at [code.claude.com](https://code.claude.com/docs/en/overview). This page does not replace the guides; use the links to check the current format before writing an artifact.

The living documentation is at `code.claude.com`. There is also an older Anthropic engineering article on the topic; on the date of this check, the [Best practices for Claude Code](https://code.claude.com/docs/en/best-practices) guide is the current reference to follow.

## When to use each mechanism

Source: [Extend Claude Code](https://code.claude.com/docs/en/features-overview), [Best practices](https://code.claude.com/docs/en/best-practices).

- Instructions the model **reads and decides** whether to apply: prompt, `CLAUDE.md`, skills. There is no absolute guarantee of compliance.
- Instructions the **harness always enforces**: hooks, `deny` rules, managed settings, sandbox in strict mode.
- `CLAUDE.md`: persistent context for every session. Only what Claude cannot see in the repository. Short and concrete (target: under 200 lines). A long procedure leaves here and becomes a skill. A localized instruction becomes a rule with `paths`.
- Skill: reusable knowledge or workflow; the body only loads when the skill is used or invoked with `/name`. Prefer a skill to a standalone command for new work.
- Subagent: another loop, isolated context, returns a summary. Good for parallel work, independent review or noisy research — not for "getting a better answer" to the same task.
- Hook: side effect or block on a lifecycle event (`PreToolUse`, `PostToolUse`, `Stop`, etc.). For real enforcement, use a `command`/`http`/`mcp_tool` hook (not `prompt`/`agent`) and, if the hook's failure must not pass, `onFailure: "block"`.
- MCP: external tools without a comfortable CLI. Project servers in `.mcp.json`; servers only you use in `~/.claude.json`.
- Plugin: packages skills, agents, hooks, MCP, styles and the like for distribution.
- Output style: role, tone and format of **every** response in the session.

The practices guide also recommends: give Claude a **definition of done** (test, typecheck, spec); do not describe in `CLAUDE.md` the architecture it already reads in the repo; effort is controlled by the effort level, not by phrases like "think hard" (`ultrathink` still asks for deeper reasoning on that turn).

## Where the files live

Source: [How Claude remembers your project](https://code.claude.com/docs/en/memory), [Explore the .claude directory](https://code.claude.com/docs/en/claude-directory).

| Artifact | Project (shared) | User (all projects) | Note |
| --- | --- | --- | --- |
| Persistent instructions | `./CLAUDE.md` or `./.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` | `./CLAUDE.local.md` is personal; put it in `.gitignore`. `AGENTS.md` can be read instead or alongside, depending on the config |
| Path rules | `.claude/rules/*.md` | `~/.claude/rules/` | Only frontmatter field read: `paths` |
| Settings / hooks / permissions | `.claude/settings.json` | `~/.claude/settings.json` | `.claude/settings.local.json` is personal and usually gitignored. Settings **apply** even if the model ignores `CLAUDE.md` |
| Skills | `.claude/skills/<name>/SKILL.md` | `~/.claude/skills/<name>/SKILL.md` | Prefer this format for new work |
| Commands (legacy) | `.claude/commands/<name>.md` | `~/.claude/commands/<name>.md` | Still work; if the name collides with a skill, the skill wins |
| Subagents | `.claude/agents/<name>.md` | `~/.claude/agents/<name>.md` | Priority: managed > `--agents` flag > project > user > plugin |
| Output styles | `.claude/output-styles/<name>.md` | `~/.claude/output-styles/<name>.md` | Activate with `outputStyle` in settings or `/output-style` |
| Project MCP | `.mcp.json` at the root | `~/.claude.json` (personal servers) | — |
| Auto memory | (per repository, managed by Claude) | — | The model records learnings; it does not replace the `CLAUDE.md` you write |

Typical settings precedence (most specific first): `--settings` flag and managed settings > `.claude/settings.local.json` > `.claude/settings.json` > `~/.claude/settings.json`. Lists such as `permissions.allow` usually merge.

## Frontmatter (official fields on the check date)

The YAML must start on the first line of the file (`---`). An unknown field is ignored without error; invalid YAML loads the file as if it had no frontmatter.

**Skill** (`SKILL.md`) — [reference](https://code.claude.com/docs/en/skills): `name`, `description` (recommended), `when_to_use`, `argument-hint`, `arguments`, `disable-model-invocation`, `user-invocable`, `allowed-tools`, `disallowed-tools`, `model`, `effort`, `context`, `agent`, `background`, `hooks`, `paths`, `shell`, `metadata`, `license`, `compatibility`.

**Command** (`.claude/commands/*.md`): the same as a skill, **except** `name` and `paths`. The command name comes from the file.

**Subagent** — [reference](https://code.claude.com/docs/en/sub-agents): `name`, `description`, `tools`, `disallowedTools`, `model`, `permissionMode`, `maxTurns`, `autoCompactWindow`, `skills`, `mcpServers`, `hooks`, `memory`, `background`, `effort`, `isolation`, `color`, `initialPrompt`, `omitClaudeMd`, `experimental`.

**Output style**: `name`, `description`, `keep-coding-instructions`, `force-for-plugin`.

**Rule**: only `paths`.

## Hooks and settings

Sources: [Hooks guide](https://code.claude.com/docs/en/hooks-guide), [Hooks reference](https://code.claude.com/docs/en/hooks).

The config lives in the `hooks` object of a settings file, per event (`Notification`, `PostToolUse`, `PreToolUse`, `Stop`, `SessionStart`, …), with an optional `matcher` and a list of handlers (`type: command` is the usual case). Scripts can live at any path; in this repo the convention is `claude/hooks/` (en-US: `en-us/claude/hooks/`). Check the config with `/hooks` in the session.

## Skills: details that affect the pipeline

Source: [Skills](https://code.claude.com/docs/en/skills).

- The `description` + `when_to_use` combination is truncated at 1,536 characters in the listing.
- `disable-model-invocation: true` keeps Claude from triggering the skill on its own (use it for side-effect flows, such as a release).
- `user-invocable: false` hides the skill from the `/` menu.
- To load this repository's skills in a session of another project: `--add-dir` / `/add-dir` on the directory that contains `.claude/skills/`.
- On name collisions, the typical order is enterprise > personal (`~/.claude`) > project; a skill beats a command with the same name. That is why the en-US skills have names different from the pt-BR ones.

## How to install (summary)

- Project: copy into `.claude/…` and, for permanent guidance, edit `./CLAUDE.md` or `./.claude/CLAUDE.md` selectively. Do not commit `CLAUDE.local.md` or `settings.local.json`.
- User: copy into `~/.claude/…`.
- Check what loaded: `/context`, `/doctor`, `/hooks`, `/mcp`.

## Claude app (chat and Claude Desktop)

Scope added on November 26, 2026. These pages are where an app feature is checked before writing into [`claude-app/`](../claude-app/). In beta, the content changes fast: reopen the current page for each source.

- [Claude by Anthropic: resources and articles](https://claude.com/resources) — feature announcements, such as [Turn artifacts into Mac and Windows apps](https://claude.com/resources/articles/install-as-app).
- [Help Center](https://support.claude.com) — steps, requirements, plans and limits; for example [Install an artifact as an app](https://support.claude.com/en/articles/18516354-install-an-artifact-as-an-app) and the [artifacts admin guide](https://support.claude.com/en/articles/16994751-artifacts-admin-guide-for-team-and-enterprise-plans).
- [Claude release notes](https://support.claude.com/en/articles/12138966-release-notes) and the [Claude Desktop changelog](https://claude.com/docs/cowork/changelog) — date the feature and the minimum version.
- [Anthropic news](https://www.anthropic.com/news).
- Touch points with Claude Code: [Claude Code artifacts](https://code.claude.com/docs/en/artifacts) and the [desktop app](https://code.claude.com/docs/en/desktop-quickstart).

Destinations of app artifacts: `app-claude`, `projeto-claudeai` and `configuracoes`. There is no install by copying files; see [`claude-app/README.md`](../claude-app/README.md).
