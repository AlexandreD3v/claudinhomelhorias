# Hooks

O Claude Code **não** carrega esta pasta sozinho. Hooks se declaram no objeto `hooks` de um arquivo de settings (`.claude/settings.json`, `.claude/settings.local.json` ou `~/.claude/settings.json`). Os scripts aqui são o `command` apontado por essa config.

**Guia oficial:** [Automate actions with hooks](https://code.claude.com/docs/en/hooks-guide) e a [referência](https://code.claude.com/docs/en/hooks). Na sessão, confira com `/hooks`.

**Instalação:**

1. Copie o script para o projeto (por convenção, `.claude/hooks/`) e dê permissão de execução no macOS/Linux (`chmod +x`).
2. Mescle o bloco JSON correspondente no `settings.json` de destino. Não substitua o arquivo inteiro se ele já tiver outros hooks.
3. Para regras que não podem falhar junto com o hook, a referência oficial descreve `onFailure: "block"` no handler.

Formato típico (evento → lista de matchers → handlers):

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/hooks/exemplo.sh"
          }
        ]
      }
    ]
  }
}
```

O matcher vazio (`""`) combina com todos os eventos daquele tipo. O script recebe JSON em stdin (campos como `tool_input`). Exit `0` deixa seguir; exit `2` em geral bloqueia e envia stderr de volta ao Claude.

Arquivos deste pacote: [`exemplo.sh`](exemplo.sh) e o bloco em [`bloco-exemplo.json`](bloco-exemplo.json). São didáticos — instale só se quiser um ponto de partida.
