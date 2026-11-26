# Handoff templates

Source 005 (XDA, November 1, 2026). Destination: `project` — copy to the root of the project several agents share. US English mirror of `registrar-handoff/modelos.md`.

## `HANDOFF.md`

```markdown
# Handoff

Newest note at the top. Each agent signs before leaving.

## YYYY-MM-DD HH:MM (time zone) — Claude Code

- Done: …
- Not done: …
- Next step: …
- Questions for the human: …
```

## `DECISIONS.md`

```markdown
# Decisions

A decision stands until the human reverses it. If you disagree, write it in `HANDOFF.md`.

- YYYY-MM-DD — Plain HTML, no framework. Reason: small project.
```

## Block for `AGENTS.md`

```markdown
## Handoff between agents

- Before changing any file, read `HANDOFF.md` and `DECISIONS.md`.
- Before leaving, write a note at the top of `HANDOFF.md`: what you finished, what you did not, where the next agent should start.
- Decisions in `DECISIONS.md` are final. If you disagree, record it in `HANDOFF.md`; do not reverse them.
- One agent at a time in this folder.
```

Notes:

- The `AGENTS.md` in this example is short on purpose: the source author's is about 2,400 characters. The 12,000-character limit he mentions belongs to Antigravity, not Claude Code.
- Telling the agent "read `HANDOFF.md`" in plain text does not guarantee the read: Claude Code only opens the file if it decides to. What guarantees the read is the `write-handoff` skill and your own request when you open the session ("continue from the last handoff"). An `@HANDOFF.md` in `CLAUDE.md` would guarantee loading, but would bring the whole file into every session, and the cost grows with the log.
