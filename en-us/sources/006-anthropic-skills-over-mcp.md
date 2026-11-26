# Source 006 — MCP servers can now ship skills, run tasks, and more with Claude

- **URL:** https://claude.com/resources/articles/skills-over-mcp-tasks-and-more
- **Accessed:** 2026-11-26 17:55 (America/Sao_Paulo)
- **Author / site:** Anthropic, official article on claude.com/resources. Published November 24, 2026 (`datePublished`). No individual author.
- **Tema:** ambos
- **Status:** parcial
- **pt-BR original:** [`fontes/006-anthropic-skills-pelo-mcp.md`](../../fontes/006-anthropic-skills-pelo-mcp.md)

## Summary

Official Anthropic article: an MCP server can now work with Claude more like another agent — it teaches, takes long-running work and asks for input mid-way. **Skills over MCP** (public beta in Claude and Claude Code): the server publishes skills alongside its tools; Claude loads a skill only when needed; skills update with the server, with nothing separate to install. Examples cited (Shopify, HubSpot, Atlassian; Carta coming soon). **Tasks** (generally available): the server runs the operation (or even an agent loop) in the background and Claude keeps working until the result is ready. **Elicitation** (generally available): the server pauses to ask for input through a form or a link (Supabase, Railway and GitHub as examples). **File Uploads** (rolling out): send a PDF, spreadsheet or image to the server without passing it through the context window. The piece also lists MCP foundations (tool search, a stateless spec, Enterprise Managed Auth, MCP Apps) and points to the docs for implementers.

## What was read

- The article's canonical page (fetched once, November 26, 2026).
- Official docs, on the same date: [Claude Code skills](https://code.claude.com/docs/en/skills#skills-from-mcp-servers), [MCP](https://code.claude.com/docs/en/mcp#use-skills-from-mcp-servers) (skills, approvals, Tasks, Elicitation, tool search), [changelog](https://code.claude.com/docs/en/changelog) (2.1.332, November 25, 2026), [feature availability](https://code.claude.com/docs/en/feature-availability), [File Uploads](https://claude.com/docs/connectors/building/files) and the open extensions the article links ([Skills](https://modelcontextprotocol.io/extensions/skills/overview), [Tasks](https://modelcontextprotocol.io/extensions/tasks/overview), [Elicitation](https://modelcontextprotocol.io/specification/2026-07-28/client/elicitation)).
- Left out of the artifacts (implementation guide, not usage): protocol details for server authors (`ttlMs`, `pollIntervalMs`, `tasks/get`, the elicitation capability declaration, approved File Uploads hosts). They stay in the open items and in the official links.

## Actionable insights

### Insight 1 — Use the skills the MCP server itself ships

- **Action:** if a server or connector publishes skills, do not copy the skill into `~/.claude/skills/`. In Claude Code (v2.1.331+ according to the skills/MCP docs; the changelog announces the feature in **2.1.332**), find it under `/` or `/skills` and invoke `/server:skill` (connectors: `claude_ai_Name:skill`; plugins: `plugin_plugin_server:skill`). Claude can also load it on its own. Local skills and server skills can coexist; several local-skill features (`allowed-tools`, hooks, `!`, `@`, substitutions) **do not apply** to an MCP skill. Plans: on for Pro, Max and Ultra with `/login`; off for Team and Enterprise until an admin turns them on (Owner in Organization settings > Connectors, and `disableDirectMcpSkills: false` in managed settings for servers that are not a connector).
- **When it matters:** the connector or server already teaches the workflow (store, CRM, org context) and you do not want to keep a local copy that goes stale.
- **Artifact type:** skill (Claude Code) and app guide (Claude app)
- **Install destination:** `user` (skill) and `app-claude` (guide)
- **Source section:** “Ship expertise alongside tools with Skills over MCP”
- **Checked against official docs:** yes — skills (“Skills from MCP servers”), MCP (“Use skills from MCP servers”, approvals, availability) and feature availability

### Insight 2 — Tasks: long-running work on the server, Claude stays in the session

- **Action:** when the server accepts an MCP task, the tool call returns at once and Claude keeps working. In the terminal, the footer shows `N MCP task`; in `/tasks` you can inspect, stop (`x`) or reopen a question. The result goes to Claude, not into the transcript: ask for the result (if Claude is idle, it starts on it unprompted). A remote server's task survives exiting the session; resume the same session to follow it again. Server-side tasks need Claude Code v2.1.304+. Do not confuse this with automatic backgrounding of a slow tool call (two minutes, does not survive exit).
- **When it matters:** research, an export or a build that used to pin the session across several prompts.
- **Artifact type:** the same skill + guide pair
- **Install destination:** `user` / `app-claude`
- **Source section:** “Hand off long-running work with Tasks”
- **Checked against official docs:** yes — MCP (“MCP tasks that run on the server”)

### Insight 3 — Elicitation: answer mid-call, not in the chat

- **Action:** if the server asks for input (spend, destructive SQL, a repository name before delete), a dialog appears. Form mode: fill in the fields. URL mode: open the link (sign-in, a flow outside the client). Declining is an answer; the server decides whether to continue. With `/tasks` open the dialog stays hidden: close `/tasks` to answer. To answer later (v2.1.324+): `Esc` in the dialog and reopen it from the task's details in `/tasks`.
- **When it matters:** an irreversible action, or data the server does not have.
- **Artifact type:** the same skill + guide pair
- **Install destination:** `user` / `app-claude`
- **Source section:** “Ask for input mid-call with Elicitation”
- **Checked against official docs:** yes — MCP (“Respond to MCP elicitation requests”)

## Artifacts produced

- `en-us/claude/skills/use-mcp-skills/SKILL.md` — destination: `user` (`~/.claude/skills/use-mcp-skills/`) — how to find and invoke server skills, approvals, limits, Tasks and Elicitation in Claude Code. US English mirror of `usar-skills-pelo-mcp`.
- `en-us/claude-app/guides/skills-over-mcp.md` — destination: `app-claude` — the same set in the Claude app (connectors, plans, what to expect from Tasks, Elicitation and File Uploads). US English mirror of `guias/skills-pelo-mcp.md`.

## Duplicates and reuse

Nothing in `claude/` or `claude-app/` already covered Skills over MCP, Tasks or Elicitation. The `trim-context` skill (source 004) is complementary: it deals with always-loaded context (`CLAUDE.md`, rules, imports); MCP tool search defers *tool definitions* and does not replace that trim. The article cites “over 85%” less tool-context in multi-server setups; the official Claude Code docs describe the mechanism (“only names and server instructions at the start”) **without that figure**. This source's skill does not promise a percentage saving.

## Divergences from the official docs

- **Enterprise and skills.** Article: Skills over MCP “coming soon to Enterprise.” Official (feature availability and the MCP page, Nov 26): Team **and** Enterprise are *Admin-enabled* — the Owner turns them on in Organization settings > Connectors, and the organization's Skills setting must also be on. Recommendation (without hiding the article): in Claude Code, follow the official table for your organization; the article is behind on this point.
- **Minimum Claude Code version.** Skills and MCP docs: v2.1.331 or later. Changelog: “Added skills from MCP servers (beta)” lands in **2.1.332** (November 25, 2026), with the `server:skill` form in the `/` menu. Recommendation: treat 2.1.332 as the release that announced the feature and check `claude --version`; if you are on 2.1.331, test before you depend on it.
- **File Uploads.** Article: “rolling out soon.” The connector docs already describe the extension in beta (`io.modelcontextprotocol/files`), with tight requirements (a Directory connector with an exact URL, MCP revision 2026-07-28, approved hosts, Team/Enterprise limits). It is not “missing from the docs”; it is rolling out with restrictions. The skill and the guide say it is not general-purpose use yet.
- **Tasks and Elicitation by plan.** Article: generally available in Claude and Claude Code for Pro, Max and Ultra, rolling out to Team and Enterprise. The MCP docs detail version, session type and feature flags, **without** repeating that plan split. The artifacts cite both sides and tell you to check your plan and the docs for your version.
- **Where MCP skills do not apply (official; the article does not list this):** cloud sessions, `claude -p`, the Agent SDK, GitHub Actions, Remote Control server mode, Desktop-app connectors/extensions and `claude_desktop_config.json`, cloud providers, a custom `ANTHROPIC_BASE_URL`, organizations with HIPAA or zero data retention. Models: Fable, or Opus 4.8, Sonnet 5, Haiku 5.5 or later, with a direct connection to Anthropic and feature flags on. VS Code is rolling out.

## Conflicts between sources

- **Enterprise: “coming soon” (article) versus Admin-enabled (official).** See divergences. No earlier repository source covers this.
- **The 85% tool-search figure.** Article: “can cut the context they use by over 85% in multi-server setups,” linking to the API docs. Official Claude Code docs: describe deferring definitions, with no percentage. Source 004 already teaches not to repeat an unmeasured figure; here the figure stays with the article only.
- No earlier source (001–005) contradicts the rest: 002 (Code Mode) and tool search can coexist; 004 still applies to always-loaded instructions.

## Open items

- **Not yet tested** in Claude Code or the Claude app (neither is available in this session). Stays `parcial` even after a push. To close it out, on Claude Code v2.1.332+ (Pro/Max/Ultra, `/login`): connect a server or connector that publishes skills; `/skills` should list `server:skill`; invoke a harmless skill and check the approval. If the server offers Tasks or Elicitation, follow it in `/tasks` and answer the dialog (closing `/tasks` if it is open). In the Claude app: the same flow through connectors, on the account's plan.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
