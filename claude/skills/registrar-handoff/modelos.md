# Modelos para o handoff

Fonte 005 (XDA, 1 de novembro de 2026). Destino: `projeto` — copie para a raiz do projeto que vários agentes compartilham.

## `HANDOFF.md`

```markdown
# Handoff

Nota mais recente no topo. Cada agente assina antes de sair.

## AAAA-MM-DD HH:MM (America/Sao_Paulo) — Claude Code

- Feito: …
- Não feito: …
- Próximo passo: …
- Perguntas para o humano: …
```

## `DECISIONS.md`

```markdown
# Decisões

Decisão tomada vale até o humano reverter. Se discordar, escreva a divergência no `HANDOFF.md`.

- AAAA-MM-DD — HTML puro, sem framework. Motivo: projeto pequeno.
```

## Bloco para o `AGENTS.md`

```markdown
## Handoff entre agentes

- Antes de alterar qualquer arquivo, leia `HANDOFF.md` e `DECISIONS.md`.
- Antes de sair, escreva uma nota no topo de `HANDOFF.md`: o que terminou, o que não, onde o próximo deve começar.
- Decisões em `DECISIONS.md` são finais. Se discordar, registre a divergência no `HANDOFF.md`; não reverta.
- Um agente por vez nesta pasta.
```

Observações:

- O `AGENTS.md` deste exemplo é curto de propósito: o autor da fonte tem uns 2.400 caracteres. O limite de 12.000 caracteres que ele cita é do Antigravity, não do Claude Code.
- Instruir “leia `HANDOFF.md`” em texto não garante a leitura: o Claude Code só abre o arquivo se decidir abri-lo. Quem garante a leitura é a skill `registrar-handoff` e um pedido seu ao abrir a sessão (“continue do último handoff”). Um `@HANDOFF.md` no `CLAUDE.md` garantiria o carregamento, mas traria o arquivo inteiro em toda sessão e o custo cresce com o log.
