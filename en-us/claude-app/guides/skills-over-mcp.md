# Skills, Tasks and Elicitation shipped by the MCP connector

**Install destination:** `app-claude` (Claude app on Mac, Windows or claude.ai, wherever the client has the feature).

<!-- Source 006: https://claude.com/resources/articles/skills-over-mcp-tasks-and-more (accessed 2026-11-26 17:55, America/Sao_Paulo).
     Checked against official pages on 2026-11-26:
     - https://code.claude.com/docs/en/mcp#use-skills-from-mcp-servers
     - https://code.claude.com/docs/en/feature-availability
     - https://claude.com/docs/connectors/building/files
     Status: NOT tested in the Claude app. Skills over MCP is in beta; File Uploads is rolling out. Check the pages above before trusting every detail. -->

MCP servers (connectors in the app) can ship skills alongside their tools, run long-running work (Tasks) and ask you to confirm mid-call (Elicitation). You do not install the skill separately: it arrives with the connector and updates with it. This does not replace the skills you create yourself in the app (Customize > Skills).

For the same topic in **Claude Code** (CLI, `/server:skill` menu, `/tasks`), use the `use-mcp-skills` skill in the `en-us/claude/` package. pt-BR: `claude/skills/usar-skills-pelo-mcp`.

## Requirements

- **Plans (article, Nov 24):** Skills over MCP is in public beta in Claude and Claude Code, on by default for Pro, Max and Ultra; on Team, an admin needs to turn it on; “coming soon to Enterprise.” Tasks and Elicitation: generally available on Pro, Max and Ultra, rolling out to Team and Enterprise. File Uploads: rolling out to Pro, Max, Ultra and eligible Team/Enterprise plans.
- **Plans (official Claude Code docs, Nov 26):** Skills from MCP servers are on for Pro, Max and Ultra; on Team **and** Enterprise they are *Admin-enabled* (the Owner turns them on in Organization settings > Connectors; the organization's Skills setting must also be on). The official table already includes Enterprise; the article is behind on this point. For Tasks and Elicitation, the MCP docs do not repeat the article's plan split: check your plan and the connectors screen.
- **Account:** online, with the connector turned on. Only add connectors you trust: a skill can direct Claude to act, and the server can change it at any time.

If the connector's skills do not appear: update the app; on Team or Enterprise, ask an Owner to turn on Skills over MCP in Organization settings > Connectors and to check the Skills setting.

## Connector skills

1. Turn the connector on under Customize or Settings > Connectors, and complete any sign-in it asks for.
2. Do not download or recreate the connector's skill as a personal skill: a local copy goes stale. Ask for the workflow in chat (“update my store”, “set up HubSpot onboarding”) and let Claude load the server skill when it fits.
3. The article cites Shopify (an online store end to end), HubSpot (onboarding), Atlassian (organizational context) and Carta (coming soon). Those are Anthropic's examples, not a procedure tested here.
4. Skills you write yourself still live in the usual place (Customize > Skills). The two origins can coexist.

## Tasks

When the connector accepts long-running work, Claude does not have to sit idle until the tool call finishes: the server runs the operation and Claude keeps going, until the result arrives. The article cites ZoomInfo (deeper account and contact research). If the app shows the task's progress or completion, ask Claude for the result if it does not bring it up on its own.

## Elicitation

Before a charge, destructive SQL or deleting a resource, the server can pause and ask for confirmation in a form or by opening a link (URL, for example a sign-in). Fill it in and submit, or decline: declining is an answer, and the server decides whether to continue. The article cites Supabase, Railway and GitHub. Do not confirm in the chat a step the dialog is already asking for: answer in the dialog itself.

## File Uploads

Still rolling out. The idea (article) is to send a PDF, spreadsheet or image to the server without passing the file through the context window. The [connector docs](https://claude.com/docs/connectors/building/files) already describe the extension in beta, with tight requirements (a Directory connector, MCP revision 2026-07-28, approved hosts). Do not treat it as a general-purpose feature until your plan and connector show the option.

## How to test (when you test)

1. On a Pro, Max or Ultra account (or Team/Enterprise with an admin having turned the feature on), enable a connector that publishes skills.
2. Ask for a workflow the connector's skill should cover and check, in the thinking or the conversation record, that Claude loaded the server's skill — not a skill of yours on the same topic.
3. If the connector offers a long-running or destructive action, follow its progress (Tasks) and answer the dialog (Elicitation) instead of only typing the confirmation in the chat.

Not tested in this checkout. The feature is in beta; details can change.
