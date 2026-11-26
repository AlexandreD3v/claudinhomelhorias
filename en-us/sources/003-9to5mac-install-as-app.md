# Source 003 — Anthropic just gave Claude users a new way to make Mac apps

- **URL:** https://9to5mac.com/2026/11/24/anthropic-just-gave-claude-users-a-new-way-to-make-mac-apps/
- **Accessed:** 2026-11-26 08:20 (America/Sao_Paulo). Reprocessed on 2026-11-26 08:29 (America/Sao_Paulo), after the scope was widened to the Claude app.
- **Author / site:** Zac Hall, 9to5Mac. Published November 24, 2026, 11:56 PT.
- **Tema:** claude-app
- **Status:** parcial
- **pt-BR original:** [`fontes/003-9to5mac-install-as-app.md`](../../fontes/003-9to5mac-install-as-app.md)

## Summary

9to5Mac reports the "Install as app" beta: artifacts created in **Claude for Mac and Windows** (Anthropic's chat app) can be installed as desktop apps, with their own icon and window, permissions the user grants, notifications, a menu bar item and connector use. The text is short and almost entirely quotes Anthropic's official announcement. The feature is **not part of Claude Code**, but it is within the repository's scope since November 26, 2026 (Claude app). The article has no requirements, version, plans or limits; those come from the official pages, which became the guide [`claude-app/guides/install-artifact-as-app.md`](../claude-app/guides/install-artifact-as-app.md).

**History.** On the first pass (November 26, 2026, 08:20) the source was `descartado` (discarded), because the scope was Claude Code only. With the wider scope, it was reprocessed: it became a guide in `claude-app/` and the status moved to `parcial`.

## What was read

- The canonical page of the 9to5Mac article. The "here" link points to the official announcement [Turn artifacts into Mac and Windows apps](https://claude.com/resources/articles/install-as-app). The "second Claude update this week made specifically for builders" link leads to another 9to5Mac story, about the Claude Ship feature (November 23, 2026); it was not processed here.
- Official check, on November 26, 2026: the announcement above; the Help Center article [Install an artifact as an app](https://support.claude.com/en/articles/18516354-install-an-artifact-as-an-app); the [artifacts admin guide for Team and Enterprise](https://support.claude.com/en/articles/16994751-artifacts-admin-guide-for-team-and-enterprise-plans) (linked from the Help Center); the [release notes](https://support.claude.com/en/articles/12138966-release-notes) (entry of November 24, 2026); [Share session output as artifacts](https://code.claude.com/docs/en/artifacts) (for the boundary with Claude Code). The [anthropic.com/news](https://www.anthropic.com/news) listing had no dedicated post on the access date.

## Actionable insights

### Insight 1 — How to install, open and uninstall an artifact as an app

- **Action:** in Claude for Mac or Windows (6.28899.0 or later, online and signed in), build the artifact, test it, choose "Install as app" from the title menu or Share and confirm. Open it from the Claude Apps folder, from File > Apps or from the artifact. Uninstall in File > Apps. An app with a menu bar or tray item keeps running after the window closes.
- **When it matters:** for people who build personal tools in the Claude app and want to open them as regular apps.
- **Artifact type:** guia-app (app guide)
- **Install destination:** app-claude
- **Source section:** article body (quote "Starting today… Claude for Mac and Windows"), completed by the Help Center
- **Checked against official docs:** yes — Anthropic announcement and Help Center

### Insight 2 — Tiered permissions and re-consent

- **Action:** the app asks before using notifications, keyboard shortcuts, floating over windows and a menu bar or tray item; "full access" (run programs and read, change or delete files) is a separate level. An "Allow" applies to one version of the app and Claude asks again after each update. Full access only for apps you made (or, on Team and Enterprise, made by people in the organization). Anthropic does not review the apps.
- **When it matters:** before installing any app, and after every update.
- **Artifact type:** guia-app (same guide)
- **Install destination:** app-claude
- **Source section:** "has its own permissions" (article) and the Permissions sections of the official pages
- **Checked against official docs:** yes

### Insight 3 — Shared quota

- **Action:** building the app and every request it makes to Claude count toward the plan's limits. Those limits are already shared with Claude Code (source 001).
- **When it matters:** for people who also use the plan in Claude Code.
- **Artifact type:** guia-app (same guide, "Shared quota" section)
- **Install destination:** app-claude
- **Source section:** "Claude usage is tied to desktop apps made with artifacts."
- **Checked against official docs:** yes — announcement and Help Center ("Usage limits")

### Insight 4 — Controls for Team and Enterprise owners

- **Action:** three toggles in Organization settings > Artifacts (Install as app, App permissions, Full access) and three MDM keys that only turn things off. Team comes on, with full access off; Enterprise comes off. The 9to5Mac article does not have this; it comes from the admin guide.
- **When it matters:** work accounts.
- **Artifact type:** guia-app (same guide, owners section)
- **Install destination:** app-claude (the toggles themselves live in the organization Settings)
- **Source section:** artifacts admin guide, "Control installing artifacts as apps (beta)"
- **Checked against official docs:** yes

## Artifacts produced

- `en-us/claude-app/guides/install-artifact-as-app.md` (pt-BR: `claude-app/guias/instalar-artifact-como-app.md`) — destination: `app-claude` — requirements, version, plans, steps, permissions, beta limits, shared quota, good practices (marked as official or from this repository), admin controls and a test script.
- `en-us/claude-app/README.md` (pt-BR: `claude-app/README.md`) — introduces the folder and the destinations (`app-claude`, `projeto-claudeai`, `configuracoes`).

## Duplicates and reuse

There was nothing in `claude-app/` (folder created together with this source). The shared quota was already in source 001 and in the `use-opusplan` skill (`usar-opusplan`); the guide only points to it, without duplicating the skill.

## Divergences from the official docs

The article reproduces the official text in essence and does not contradict it. What it lacks (minimum version, plans, limits, permission levels, re-consent) is in the guide, from the official pages. The 9to5Mac cover image (`claude-code-auto-mode.webp`) suggests Claude Code, but the body, the quotes and the official link are about the Claude app for Mac and Windows.

## Conflicts between sources

- **Full access and third-party apps.** Official announcement (claude.com): "you can only give full access to apps you made or, on Team and Enterprise, to apps from people in your organization", stated without qualification. Help Center: Claude "generally doesn't allow" an app to request full access if someone outside the organization wrote part of it or if Claude cannot confirm who made it, and on personal plans "outside the organization" means any other user. Both sides: a categorical rule (announcement) and a rule with "generally" (Help Center). The guide treats it as blocked and promises no exception.
- **Hybrid deployment.** Official announcement and admin guide: organizations with a HIPAA-ready setup **and** with a hybrid deployment cannot use the feature. Help Center, limitations section: mentions only HIPAA. Both sides: the Help Center does not mention hybrid deployment, the other two do. The guide lists both.
- **A Claude Code artifact as an app.** The Claude Code docs describe artifacts as pages on claude.ai opened in the browser (CLI v2.1.281+ or desktop app 1.13576.0+) and say nothing about installing them as an app. The Help Center describes only the path "open the artifact in the Claude Desktop main window" and neither confirms nor denies that an artifact published by Claude Code can be installed. It is a gap, not a choice: the guide says to test.
- **9to5Mac vs official.** No factual contradiction. The story mentions only "menu bar"; the official text talks about the menu bar (macOS) or tray (Windows), and only after explicit permission.

Recommendation (without hiding either side): follow the current Help Center and official announcement; treat full access as unavailable for third-party apps.

## Open items

- **Test in the Claude app not done yet** (no Claude Desktop in this session). The status stays `parcial`, even after the GitHub push. To close: follow the "How to test this guide" section in `en-us/claude-app/guides/install-artifact-as-app.md` (or the pt-BR guide) on Mac or Windows, note the app version and fix the guide where it differs.
- GitHub push: up to whoever publishes; it does not change the status to `publicado` on its own.
