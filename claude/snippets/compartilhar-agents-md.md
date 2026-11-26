<!--
Destino de instalação: projeto (./CLAUDE.md, na raiz do projeto que tem um AGENTS.md)
Fonte: 005 — https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/ — acesso 2026-11-26 (America/Sao_Paulo)
Conferido em: https://code.claude.com/docs/en/memory (seção AGENTS.md), 2026-11-26. Não testado no Claude Code.

Quando usar: o projeto também é aberto por outros agentes de código, que leem AGENTS.md, e tem (ou terá) um CLAUDE.md.
- Sem nenhum CLAUDE.md na pasta de trabalho ou acima dela, o Claude Code v2.1.277 ou posterior lê o AGENTS.md sozinho; este snippet não é preciso.
- Com um CLAUDE.md presente, o Claude Code lê só o CLAUDE.md. O import abaixo traz o AGENTS.md para dentro dele. Alternativa oficial: /config > Project instructions = claude-md-and-agents-md.
- Um CLAUDE.local.md também conta como CLAUDE.md: criar um deixa o Claude de ler o AGENTS.md sozinho.
- No Windows, use este import, não um symlink (ln -s AGENTS.md CLAUDE.md): symlink exige Administrador ou Modo de Desenvolvedor e o Git pode extraí-lo como arquivo de texto.
Verificar: numa sessão nova, rode /context all e confira CLAUDE.md em “Memory files”.
Comentários HTML de bloco como este são removidos antes de o conteúdo chegar ao Claude.
-->

@AGENTS.md

## Claude Code

- Instruções que valem só para o Claude Code, curtas, aqui embaixo (o Claude lê o AGENTS.md importado primeiro).
