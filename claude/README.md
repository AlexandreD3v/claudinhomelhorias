# Pacote instalável (`claude/`)

Espelho do layout `.claude/` do Claude Code, mais um `CLAUDE.md` starter para copiar com critério. O Claude Code **não** lê esta pasta automaticamente. Veja a seção “Instalar os artefatos” do [`README.md`](../README.md) na raiz. O material do app Claude (chat/Desktop) fica na pasta irmã [`claude-app/`](../claude-app/). O que cada artefato faz e o comando de cópia estão em [`USO.md`](../USO.md). Versão en-US deste pacote, com nomes em inglês: [`en-us/claude/`](../en-us/claude/).

| Subpasta | Equivale a | O que há hoje |
| --- | --- | --- |
| [`CLAUDE.md`](CLAUDE.md) | `./CLAUDE.md`, `./.claude/CLAUDE.md` ou `~/.claude/CLAUDE.md` | Starter curto baseado nas práticas oficiais |
| [`snippets/`](snippets/) | Trechos para fundir num `CLAUDE.md` existente | `compartilhar-agents-md` |
| [`skills/`](skills/) | `.claude/skills/` ou `~/.claude/skills/` | `processar-fonte`, `usar-opusplan`, `usar-code-mode`, `enxugar-contexto`, `registrar-handoff` |
| [`commands/`](commands/) | `.claude/commands/` (formato legado) | Só o README com exemplo; prefira skills |
| [`agents/`](agents/) | `.claude/agents/` ou `~/.claude/agents/` | Subagente `extrator-fonte` |
| [`hooks/`](hooks/) | Scripts referenciados por `hooks` no settings | Exemplo mínimo + bloco JSON |
| [`settings/`](settings/) | `.claude/settings.json` ou `~/.claude/settings.json` | Exemplo para mesclar, não para copiar por cima |
| [`rules/`](rules/) | `.claude/rules/` | README com o formato |
| [`output-styles/`](output-styles/) | `.claude/output-styles/` | Estilo `conciso-ptbr` |

Ao instalar settings ou hooks, **mescle** com o arquivo existente. Não substitua `settings.json` de um projeto no escuro.
