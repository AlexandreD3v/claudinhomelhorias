# Estilos de saída

Um estilo é um Markdown em `.claude/output-styles/` (projeto) ou `~/.claude/output-styles/` (usuário). Ele define papel, tom e formato de **todas** as respostas da sessão.

**Ativação:** `/output-style`, o menu de configuração, ou a chave `outputStyle` no settings (valor **sensível a maiúsculas**; os nomes embutidos oficiais são `Proactive`, `Concise`, `Explanatory` e `Learning`).

**Frontmatter:** `name`, `description`, `keep-coding-instructions`, `force-for-plugin` (este último só em plugins). Com `keep-coding-instructions: true`, o Claude Code mantém as instruções de engenharia de software e só muda a comunicação.

Documentação: [Output styles](https://code.claude.com/docs/en/output-styles). Template: [`templates/output-style.md`](../../templates/output-style.md).

Estilo incluído neste pacote: [`conciso-ptbr.md`](conciso-ptbr.md). O equivalente em inglês é [`concise-en-us`](../../en-us/claude/output-styles/concise-en-us.md). Para usá-lo como padrão do projeto, mescle `"outputStyle": "conciso-ptbr"` no settings (já sugerido em `claude/settings/settings.exemplo.json`).
