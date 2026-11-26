# Skills

Cada skill é uma pasta `nome-da-skill/SKILL.md`, mais arquivos de apoio se precisar.

**Instalação:** copie a pasta para `.claude/skills/` (projeto) ou `~/.claude/skills/` (todos os seus projetos). Invocação: `/nome-da-skill`, ou o Claude carrega sozinho quando a `description` combina — a menos que `disable-model-invocation: true`.

**Formato oficial:** [Skills](https://code.claude.com/docs/en/skills). O frontmatter YAML precisa ser a primeira linha do arquivo. Campos mais usados: `name`, `description` (recomendado), `when_to_use`, `argument-hint`, `arguments`, `disable-model-invocation`, `user-invocable`, `allowed-tools`, `paths`. Lista completa em [`referencias/praticas-oficiais.md`](../../referencias/praticas-oficiais.md) e no template [`templates/skill/SKILL.md`](../../templates/skill/SKILL.md).

**Sobre comandos:** arquivos em `.claude/commands/` ainda funcionam, mas a documentação oficial recomenda skills para trabalho novo. Se uma skill e um comando tiverem o mesmo nome, a skill vence.

Skills neste pacote (o espelho en-US, com nomes em inglês, está em [`en-us/claude/skills/`](../../en-us/claude/skills/); tabela de nomes em [`USO.md`](../../USO.md)):

- [`processar-fonte`](processar-fonte/SKILL.md) — pipeline deste repositório (destino: `usuario`).
- [`usar-opusplan`](usar-opusplan/SKILL.md) — planejar com Opus e executar com Sonnet para esticar a cota (destino: `usuario`; fonte 001).
- [`usar-code-mode`](usar-code-mode/SKILL.md) — ligar o Code Mode experimental e encadear tool calls em JavaScript (destino: `usuario`; fonte 002).
- [`enxugar-contexto`](enxugar-contexto/SKILL.md) — medir e enxugar o contexto sempre carregado (CLAUDE.md, regras, imports), decidindo o que vira skill, regra, subpasta, hook ou subagente (destino: `usuario`; fonte 004).
- [`registrar-handoff`](registrar-handoff/SKILL.md) — nota de handoff em `HANDOFF.md` para projetos compartilhados com outros agentes, com modelos em [`modelos.md`](registrar-handoff/modelos.md) (destino: `projeto`; fonte 005).
