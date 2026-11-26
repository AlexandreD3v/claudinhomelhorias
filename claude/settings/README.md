# Settings

**Destino de instalação de [`settings.exemplo.json`](settings.exemplo.json):** as chaves de exemplo se separam na hora de copiar — `permissions.deny` para `.env` vai em `projeto` (`.claude/settings.json`); `outputStyle: conciso-ptbr` vai em `usuario` (`~/.claude/settings.json`), porque o estilo é preferência pessoal. Não copie o arquivo inteiro para os dois lugares. O JSON não leva chave extraoficial.


Arquivos JSON que o Claude Code **aplica** (permissões, hooks, `outputStyle`, variáveis de ambiente, modelo). Diferente do `CLAUDE.md`, isto não é só orientação ao modelo.

**Onde vive:**

| Arquivo | Escopo |
| --- | --- |
| `.claude/settings.json` | Projeto, compartilhado no git |
| `.claude/settings.local.json` | Só você, neste projeto (não versionar) |
| `~/.claude/settings.json` | Só você, em todos os projetos |

Precedência, do que ganha: settings gerenciados e flag `--settings` > `settings.local.json` > settings do projeto > settings do usuário. Valores simples (como `model`) usam o de maior precedência; listas como `permissions.allow` em geral se mesclam.

**Instalação:** mescle as chaves de [`settings.exemplo.json`](settings.exemplo.json) no arquivo de destino. Não copie por cima de um `settings.json` já usado.

Documentação: [Explore the .claude directory](https://code.claude.com/docs/en/claude-directory) e a [referência de settings](https://code.claude.com/docs/en/settings-reference). Servidores MCP de projeto ficam em `.mcp.json` na raiz (modelo em [`templates/mcp.json`](../../templates/mcp.json)), não neste arquivo.

## Fragmento `opusplan.exemplo.json`

**Destino de instalação:** `usuario` (mesclar a chave `model` em `~/.claude/settings.json`, não substituir o arquivo inteiro). É opcional: só use se quiser `opusplan` como padrão das sessões novas. Escolher `opusplan` só no `/model` não grava o padrão, segundo a documentação oficial de modelos. Detalhe e ressalvas: skill [`usar-opusplan`](../skills/usar-opusplan/SKILL.md) (fonte 001).

## Fragmento `code-mode.exemplo.json`

**Destino de instalação:** `usuario` (mesclar o bloco `env` em `~/.claude/settings.json`, não substituir o arquivo e **não** gravar isso no settings de um projeto). A documentação oficial ignora `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE` em settings de repositório. Opt-in permanente e experimental; detalhes e restrições na skill [`usar-code-mode`](../skills/usar-code-mode/SKILL.md) (fonte 002).
