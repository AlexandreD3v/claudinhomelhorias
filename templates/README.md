# Templates

Copie o modelo do tipo, nunca edite o template no lugar para gravar uma fonte real.

## Campo `destino`

Todo artefato instalável declara o destino de instalação, com um destes valores:

- `projeto` — instalar no projeto: `.claude/` (skills, agentes, comandos, regras, estilos, hooks, `settings.json`) ou, quando for o caso, `./CLAUDE.md` / `./.mcp.json` na raiz.
- `usuario` — instalar para todos os projetos: `~/.claude/` ou, para MCP pessoal, `~/.claude.json`.

Onde o campo aparece (sem inventar chave de frontmatter que o Claude Code não reconhece):

| Tipo | Onde declarar |
| --- | --- |
| Skill e comando | `metadata.destino` (dentro de `metadata`, que é campo oficial) |
| Subagente | no corpo, linha `**Destino de instalação:** projeto` ou `usuario` — não no frontmatter |
| Regra, estilo de saída, snippet / `CLAUDE.md` | comentário HTML no arquivo |
| Script de hook | comentário no cabeçalho do script |
| JSON de exemplo (settings, bloco de hook, MCP) | comentário no markdown irmão do template e no README da pasta; o JSON em si permanece só com chaves válidas, para poder mesclar |

## Modelos

| Modelo | Uso |
| --- | --- |
| [`fonte.md`](fonte.md) | Nota em `fontes/NNN-slug.md` |
| [`trecho-claude-md.md`](trecho-claude-md.md) | Snippet para `claude/snippets/` ou fusão no starter |
| [`skill/SKILL.md`](skill/SKILL.md) | Nova skill em `claude/skills/<nome>/SKILL.md` |
| [`comando.md`](comando.md) | Comando legado em `claude/commands/<nome>.md` |
| [`agente.md`](agente.md) | Subagente em `claude/agents/<nome>.md` |
| [`regra.md`](regra.md) | Regra com `paths` em `claude/rules/` |
| [`output-style.md`](output-style.md) | Estilo de saída em `claude/output-styles/` |
| [`hook-settings.md`](hook-settings.md) + [`hook-settings.json`](hook-settings.json) | Bloco `hooks` para mesclar em settings |
| [`mcp.md`](mcp.md) + [`mcp.json`](mcp.json) | Esqueleto de `.mcp.json` de projeto ou nota para `~/.claude.json` |
