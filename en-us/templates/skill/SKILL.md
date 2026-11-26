---
name: skill-name
description: >
  What it does and when to use it. Start with the main case.
  The description + when_to_use combination is truncated at 1,536 characters.
when_to_use: "Phrases the user would say that should trigger this skill."
argument-hint: "[url]"
# arguments: [url]
# disable-model-invocation: true   # use for side-effect flows only the user should trigger
# user-invocable: false            # only Claude invokes it; hidden from the / menu
# allowed-tools: Read Grep Glob WebFetch
# paths:
#   - "src/**/*.ts"
metadata:
  destination: project
  source: "NNN"
  url: "https://example.invalid/page"
  accessed: "YYYY-MM-DD"
  mirror-of: pt-br-skill-name
---

<!-- destination: project = .claude/skills/  |  user = ~/.claude/skills/
     The English name must differ from the pt-BR skill's name. -->

# Skill name

Numbered, short, verifiable steps. Long supporting material goes in files next to this `SKILL.md`, not in `CLAUDE.md`.

1. …
2. …

## Arguments

If the skill takes arguments: `$ARGUMENTS` (all), `$0` / `$ARGUMENTS[0]` (first), or `$name` if you declared `arguments`.
