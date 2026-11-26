# Install an artifact as an app in Claude for Mac and Windows

**Install destination:** `app-claude` (Claude for Mac or Windows, version 6.28899.0 or later).

<!-- Source 003: https://9to5mac.com/2026/11/24/anthropic-just-gave-claude-users-a-new-way-to-make-mac-apps/ (accessed 2026-11-26, America/Sao_Paulo).
     Checked against the official pages on 2026-11-26:
     - https://claude.com/resources/articles/install-as-app
     - https://support.claude.com/en/articles/18516354-install-an-artifact-as-an-app
     - https://support.claude.com/en/articles/16994751-artifacts-admin-guide-for-team-and-enterprise-plans
     - https://support.claude.com/en/articles/12138966-release-notes (entry of November 24, 2026)
     Status: NOT tested in the Claude app. Beta feature; check the pages above before relying on each detail.
     US English mirror of claude-app/guias/instalar-artifact-como-app.md. -->

"Install as app" (beta) turns an artifact Claude made in a conversation into a desktop app: its own icon, its own window, permissions you grant one by one. It is not a Claude Code feature. Claude Code users do not need it for anything in the CLI; it is for people who build personal tools in the Claude app.

## Requirements

- **App:** Claude for Mac or Claude for Windows, version **6.28899.0 or later**. Mac: Claude menu > Check for Updates. Windows: ☰ menu > Help > Check for Updates.
- **Account:** online and signed in to Claude Desktop, both to install and to open the app later.
- **Plans:** Free, Pro, Max, Ultra, Team and Enterprise (beta rollout).
  - **Team:** on by default; the "full access to the computer" level stays off until an admin turns it on.
  - **Enterprise:** everything off until an owner turns it on in Organization settings > Artifacts. The admin guide asks for "Cloud code execution and file creation" to be on first, in Organization settings > Capabilities.
- **Not available:** Linux, web and mobile; organizations with a HIPAA-ready setup and with a hybrid deployment (the disagreement between the official pages is in the [source 003 note](../../../fontes/003-9to5mac-install-as-app.md), pt-BR); full access on Claude for Teachers and K-12 organizations.
- **Artifacts that do not install:** those created from templates (Docs, Slides, Sheets), legacy artifacts and Claude Cowork live artifacts.

If the "Install as app" item does not show up: update the app; on Team or Enterprise, ask an owner to check that it is on.

## Steps

1. **Describe the app** in a conversation, for example "a pomodoro timer that lives in the menu bar" or "an app that renames the photos in a folder by date" (Help Center examples).
2. **Test it as an artifact** in the conversation itself. Ask for adjustments before installing.
3. **Install:** open the artifact in the Claude Desktop main window, open the title menu (or right-click) and choose "Install as app"; or use Share > Install as app. Then confirm with "Install". Claude always asks for confirmation, whichever path you take. The artifact can also have its own install button, if you ask for it.
4. **Open the app:**
   - macOS: Claude Apps folder inside Applications, in your home folder; it also shows up in Spotlight. To keep it in the Dock: right-click > Options > Keep in Dock.
   - Windows: Start menu (Claude Apps folder) or desktop shortcut.
   - In Claude Desktop: "Open installed app" on the artifact, or File > Apps > pick it > Open (on Windows, File is in the ☰ menu).
5. **Quit** an app with a menu bar or tray item: it keeps running after you close the window. On macOS, quit from the Dock or with Cmd+Q; on Windows, "Exit" in the tray icon menu.
6. **Uninstall** in File > Apps > pick it > Uninstall. On macOS the app goes to the Trash; on Windows the shortcuts disappear. If you pinned it to the Dock, taskbar or Start, remove it there too. Uninstalling removes the granted permissions and does not delete the artifact.

The app is still the same artifact: when you or another editor changes the artifact, the app changes with it.

## Permissions

The app must ask before using any of the features below; you answer "Allow" or "Don't allow".

| Permission | What the app can do |
| --- | --- |
| Notifications | Show notifications while you use other apps |
| Keyboard shortcuts | Respond to key combinations while other apps are in use |
| Float over other windows | Draw above other windows and read where the cursor is on your screens |
| Menu bar item (macOS) or tray icon (Windows) | Show an item there while the app is open |
| Full access to this computer | Run programs and read, change or delete your files without asking each time; also covers the permissions above, unless you or your organization turned them off |

The levels, in Anthropic's words: default (only what a browser would do), app permissions and full access to the computer.

- **An "Allow" applies to one version of the app.** After any update, including your own edit, Claude asks again. A "Don't allow" stays until you change it.
- If part of the app loads code from another site, that code can change without a new prompt.
- If the app comes from outside your organization, or Claude does not know who made it, the prompt shows a warning.
- **Full access** only for apps you made yourself or, on Team and Enterprise, made by people in your organization. Anthropic does not review apps before installation.
- **Change or revoke** a permission: macOS, with the app open, click the app name in the menu bar > Permissions. Windows, right-click the title bar (or Alt+Space) > Permissions. In Claude Desktop: File > Apps > pick it > Permissions. Turning off full access may reload or close the app, so save first. It ends the programs the app started (except those that detached from it) and does not undo changes already made.
- To report an app: "Report Artifact", in the same Permissions menu, if available.
- Whoever loses access to the app (the owner stopped sharing, for example) also loses the programs it started; this can take about 20 minutes, or longer if Claude is offline.

## Beta limits

- No Linux, web or mobile. No templates (Docs, Slides, Sheets), legacy artifacts or Cowork live artifacts.
- You must be online and signed in to open it.
- **Zero data retention:** in organizations with ZDR for Claude Code only, apps can be installed after an owner turns on Artifacts and Install as app, but those apps are **not** covered by ZDR. In organizations with organization-wide ZDR or customer-managed keys (CMEK), the three admin toggles start off.
- **Computer use on macOS:** Claude can see an installed app when it uses your computer, but cannot click or type in it.
- Browser shortcuts: the browser's "Add to Dock", "Add browser shortcut" and "Add to Home Screen" only create a shortcut; they do not have the app features described here.

## Shared quota

Creating an app and **every request the app makes to Claude** count toward your plan's usage limits. The app uses your account, with no API key or separate login. Plan limits are shared between the Claude app and Claude Code (see the [source 001 note](../../../fontes/001-xda-limites-uso-sessoes.md), pt-BR). An app that calls Claude in the background, such as one with a menu bar item, also spends quota while it runs.

## Good practices

Marked by origin: **(official)** comes from Anthropic's pages; **(repo)** is this repository's recommendation, not official text.

- **(official)** Test as an artifact before installing. Install an artifact you already use every day.
- **(official)** Grant only the permissions the app needs; start by denying. Full access only for an app you wrote or trust.
- **(official)** Read every permission prompt after an update: the previous "Allow" does not apply to the new version.
- **(official)** Know how to quit an app with a menu bar or tray item before closing it, so you do not leave it running by accident.
- **(repo)** Do not paste an API key, token or password into the artifact's code. The app already uses your Claude account.
- **(repo)** Be wary of apps that load code from another site: external code changes without a new permission prompt.
- **(repo)** On a work account (Team or Enterprise), check with the owner what the organization allows before installing anything with full access.
- **(repo)** If the feature disappears from the menu after an app update, check the Claude release notes and the Help Center: the feature is in beta.

## For Team and Enterprise owners

- In **Organization settings > Artifacts** there are three toggles: Install as app, App permissions and Full access to the computer. Defaults: Team turns the first two on and leaves full access off; Enterprise starts with everything off. The change takes about an hour.
- Control by **device policy (MDM)**: `isArtifactAppsEnabled`, `isArtifactAppPermissionsEnabled` and `isArtifactAppFullAccessEnabled`, set to `false` on macOS (domain `com.anthropic.claudefordesktop`) or DWORD `0` on Windows (`HKLM\SOFTWARE\Policies\Claude`). The keys only turn things off. They need Claude Desktop 6.6395.1 or later on macOS and 6.6395.0 or later on Windows. Where the two layers diverge, the more restrictive one wins.
- Opening an app and the access checks show up as artifact views in the Compliance API. Installs, permission answers and what the app does on the computer are not logged.

## Relation to Claude Code

Claude Code has its own artifacts: live pages on claude.ai published from a session and opened in the browser (see [Share session output as artifacts](https://code.claude.com/docs/en/artifacts)). The Claude Code docs do not describe installing those pages as a desktop app, and the app's Help Center describes the path "open the artifact in the Claude Desktop main window". Neither says whether an artifact published by Claude Code can be installed. Test before counting on it.

## How to test this guide

1. On Mac or Windows, check the Claude Desktop version (6.28899.0 or later) and update if needed.
2. In a conversation, ask: "Make a simple app that shows a counter in the menu bar."
3. Look at the artifact, choose Install as app and confirm. Note where the app showed up (Claude Apps).
4. Open the app, deny the permissions at the first prompt and see whether it works just like the artifact. Then allow only one (for example notifications) and confirm the prompt does not come back.
5. Edit the artifact and see whether the app asks for permissions again.
6. Quit the app, uninstall it in File > Apps and check that the artifact is still in the conversation.
7. If anything differs from this guide, note the app version and fix this guide, the pt-BR guide and the source 003 note. Only after the test and the GitHub push can the source go to `publicado`.
