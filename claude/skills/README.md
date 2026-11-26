# Skills

Cada skill é uma pasta `nome-da-skill/SKILL.md`, mais arquivos de apoio se precisar.

**Instalação:** copie a pasta para `.claude/skills/` (projeto) ou `~/.claude/skills/` (todos os seus projetos). Invocação: `/nome-da-skill`, ou o Claude carrega sozinho quando a `description` combina — a menos que `disable-model-invocation: true`.

**Formato oficial:** [Skills](https://code.claude.com/docs/en/skills). O frontmatter YAML precisa ser a primeira linha do arquivo. Campos mais usados: `name`, `description` (recomendado), `when_to_use`, `argument-hint`, `arguments`, `disable-model-invocation`, `user-invocable`, `allowed-tools`, `paths`. Lista completa em [`referencias/praticas-oficiais.md`](../../referencias/praticas-oficiais.md) e no template [`templates/skill/SKILL.md`](../../templates/skill/SKILL.md).

**Sobre comandos:** arquivos em `.claude/commands/` ainda funcionam, mas a documentação oficial recomenda skills para trabalho novo. Se uma skill e um comando tiverem o mesmo nome, a skill vence.

Skill incluída neste pacote: [`processar-fonte`](processar-fonte/SKILL.md) — pipeline deste repositório.
