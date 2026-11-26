<!--
Install destination: project (./CLAUDE.md, at the root of the project that has an AGENTS.md)
Source: 005 — https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/ — accessed 2026-11-26 (America/Sao_Paulo)
Checked against: https://code.claude.com/docs/en/memory (AGENTS.md section), 2026-11-26. Not tested in Claude Code.
US English mirror of claude/snippets/compartilhar-agents-md.md.

When to use: the project is also opened by other coding agents, which read AGENTS.md, and it has (or will have) a CLAUDE.md.
- With no CLAUDE.md in the working directory or above it, Claude Code v2.1.277 or later reads AGENTS.md on its own; this snippet is not needed.
- With a CLAUDE.md present, Claude Code reads only CLAUDE.md. The import below pulls AGENTS.md into it. Official alternative: /config > Project instructions = claude-md-and-agents-md.
- A CLAUDE.local.md also counts as a CLAUDE.md: creating one makes Claude stop reading AGENTS.md on its own.
- On Windows, use this import, not a symlink (ln -s AGENTS.md CLAUDE.md): a symlink needs Administrator or Developer Mode and Git may check it out as a plain text file.
Verify: in a new session, run /context all and look for CLAUDE.md under "Memory files".
Block-level HTML comments like this one are stripped before the content reaches Claude.
-->

@AGENTS.md

## Claude Code

- Instructions that apply only to Claude Code, short, down here (Claude reads the imported AGENTS.md first).
