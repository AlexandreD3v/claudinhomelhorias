<!--
Install destination: choose when copying.
  - project: conventions of the target repository in ./CLAUDE.md or ./.claude/CLAUDE.md
  - user: personal preferences in ~/.claude/CLAUDE.md
This starter mixes both kinds of guidance; do not copy the whole file to both
places. Split the pieces when installing.
US English mirror of claude/CLAUDE.md (pt-BR).
-->

# CLAUDE.md starter

Short instructions to paste (selectively) into a project's `CLAUDE.md` or into `~/.claude/CLAUDE.md`. Do not replace a file that is already tuned: add only what is not there yet.

Origin: official Anthropic practices checked on November 25, 2026 — [best practices](https://code.claude.com/docs/en/best-practices) and [memory / CLAUDE.md](https://code.claude.com/docs/en/memory). The two additions about subfolder `CLAUDE.md` files and `@` imports come from source 004 (XDA), checked against the same docs on November 26, 2026. The rest did not come from a third-party article.

## How to write the instructions that stay in this file

- Record only what Claude **cannot** find out by reading the repository (build and test commands, invisible conventions, "always do X").
- Be concrete and verifiable: "use 2-space indentation", "run `npm test` before committing". Avoid "format it properly" or "test your changes".
- Keep the file short (official target: under 200 lines). If two rules contradict each other, the model may pick either one.
- A multi-step procedure or long reference material goes into a **skill** (`.claude/skills/<name>/SKILL.md`), not here. The skill body only enters the context when it is used.
- An instruction that applies only to certain files goes into `.claude/rules/` with `paths` frontmatter. If it applies to a whole folder (frontend, backend), a `CLAUDE.md` inside that folder only loads when Claude reads or edits a file there.
- `@file` (import) organizes, but **does not save context**: the imported file loads together with `CLAUDE.md` at session start. To save, use a skill, a rule with `paths` or a subfolder `CLAUDE.md`. The `trim-context` skill does this triage.
- Preferences that are only yours and only for this project: `CLAUDE.local.md` (do not commit). Your preferences across all projects: `~/.claude/CLAUDE.md`.
- Anything that must have no exceptions (never read `.env`, always run the formatter, never edit `src/gen/`) becomes a hook, `permissions.deny` or a setting — not a line in this file. `CLAUDE.md` is context, not enforced configuration.
- Give a definition of done when you ask for a change: the test command, the typecheck or the spec that has to pass.
- After `/compact`, only the project-root `CLAUDE.md` is re-injected automatically. Instructions given only in the chat are lost.

## Commands for this project

Fill in what applies to the target repository (examples — replace with the real ones):

- Install: `…`
- Test: `…`
- Typecheck / lint: `…`
- Build: `…`

## Conventions the code does not make obvious

- …
