# Fonte 004 — I cut my Claude token use in half by moving instructions out of the main session

- **URL:** https://www.xda-developers.com/cut-claude-token-use-in-half-moving-instructions-out-of-main-session/
- **Acesso:** 2026-11-26 08:38 (America/Sao_Paulo)
- **Autor / site:** Dhruv Bhutani, XDA Developers. Publicado em 29 de outubro de 2026, 7:30 (EDT) — 08:30 (America/Sao_Paulo). Relato de uso, sem versão do Claude Code citada.
- **Tema:** claude-code
- **Status:** parcial

## Resumo

Relato de quem usa o Claude Code para cuidar de um ambiente self-hosted (Docker, logs, pequenos apps). A tese: o gasto de tokens depende menos da complexidade da tarefa e mais do que fica carregado na sessão. Ele mantém o `CLAUDE.md` da raiz como guia curto (o que o projeto faz, onde ficam os arquivos principais, comandos de teste, restrições), põe instruções de cada componente perto dos arquivos (um `CLAUDE.md` por pasta, como frontend e backend), transforma fluxos repetidos em skills e manda investigações longas (logs, Compose, permissões) a subagentes que devolvem um resumo com evidência. O próprio texto ressalva que subagente não é solução universal e pode aumentar o total de tokens. O “metade” do título é impressão do autor, sem medição. Os comentários dos leitores (Graphban, um MCP “Billion-Context” e outros) são sugestões de terceiros sem verificação: não foram seguidos nem instalados.

## O que foi lido

- A página canônica do artigo, com os comentários (ignorados como fonte).
- Documentação oficial, em 26 de novembro de 2026: [memória / CLAUDE.md](https://code.claude.com/docs/en/memory), [custos](https://code.claude.com/docs/en/costs), [subagentes](https://code.claude.com/docs/en/sub-agents), [skills](https://code.claude.com/docs/en/skills) e [comandos](https://code.claude.com/docs/en/commands).
- Nada do artigo se aplica ao app Claude (chat/Desktop): o texto trata só do Claude Code.

## Insights acionáveis

### Insight 1 — CLAUDE.md enxuto na raiz e `CLAUDE.md` por pasta

- **Ação:** manter na raiz só o essencial e pôr instruções de uma parte do projeto num `CLAUDE.md` dentro da pasta. A doc oficial confirma: arquivos de subpasta carregam quando o Claude lê, escreve ou edita um arquivo ali, e o alvo é menos de 200 linhas por arquivo.
- **Quando importa:** projeto com várias partes (frontend/backend, vários serviços).
- **Tipo de artefato:** skill (triagem) e acréscimo no starter
- **Destino de instalação:** usuario (a skill); o starter mistura projeto e usuario por trecho
- **Seção de origem:** “Keep your CLAUDE.md file lean”
- **Conferido na doc oficial:** sim — memória (“How CLAUDE.md files load”, “Write effective instructions”)

### Insight 2 — Fluxos repetidos viram skill

- **Ação:** mover do `CLAUDE.md` para uma skill o procedimento que só importa às vezes. A doc de custos diz o mesmo (“Move instructions from CLAUDE.md to skills”).
- **Quando importa:** instrução de fluxo (investigar um serviço, revisar PR) presente em toda sessão sem necessidade.
- **Tipo de artefato:** nenhum novo; já estava no starter. Entra como passo da skill `enxugar-contexto`.
- **Destino de instalação:** usuario
- **Seção de origem:** “Separate instruction files and skills for project-specific tasks”
- **Conferido na doc oficial:** sim — custos

### Insight 3 — Subagente para investigação volumosa

- **Ação:** delegar logs, testes e pesquisa a um subagente que devolve só o resumo. Oficial: o contexto fica isolado, mas as requisições do subagente contam no mesmo limite de uso, e um subagente próprio carrega o `CLAUDE.md` (só Explore e Plan começam sem ele; `omitClaudeMd: true` resolve nos próprios). O artigo cobre o primeiro ponto e a ressalva do total de tokens, não o segundo.
- **Quando importa:** investigação grande, com objetivo claro e resultado curto.
- **Tipo de artefato:** nenhum novo; passo da skill `enxugar-contexto`
- **Destino de instalação:** usuario
- **Seção de origem:** “I use subagents to avoid bloating up my main session”
- **Conferido na doc oficial:** sim — subagentes (“Isolate high-volume operations”, “What loads at startup”) e custos

## Artefatos gerados

- `claude/skills/enxugar-contexto/SKILL.md` — destino: `usuario` — mede (`/context`, `/usage`, `/status`, `/doctor prompt-audit`), tria cada bloco do `CLAUDE.md`, avisa que `@` import não economiza e orienta o uso de subagente com as ressalvas oficiais. Invocação só manual (`disable-model-invocation: true`).
- `claude/CLAUDE.md` (starter, editado) — destino: o do trecho, `projeto` ou `usuario` — dois acréscimos: `CLAUDE.md` de subpasta carrega sob demanda; `@` import não economiza contexto.

## Duplicatas e reuso

O starter já dizia: arquivo curto (menos de 200 linhas), procedimento em skill, regra com `paths`, regra sem exceção em hook ou `deny`. Isso **não** foi duplicado. Acrescentou-se só o que faltava (`CLAUDE.md` de subpasta, `@` import) e criou-se a skill como procedimento invocável. O subagente `extrator-fonte` já usa `omitClaudeMd: true`; não se criou subagente novo, porque o Explore embutido e o padrão de prompt oficial já cobrem a delegação. `usar-opusplan` trata de modelo, não de contexto; `usar-code-mode` não se sobrepõe.

## Divergências com a documentação oficial

- O artigo sugere partir o `CLAUDE.md` em arquivos de instrução e usar o `CLAUDE.md` para guiar o modelo até cada um. A doc oficial é específica: `@arquivo` carrega junto com quem importa, então **não reduz** o contexto. Só reduz o que carrega sob demanda (skill, regra com `paths`, `CLAUDE.md` de subpasta). A skill segue o oficial.
- O artigo não menciona que o subagente também recebe o `CLAUDE.md`.

## Conflitos entre fontes

- **Apontar o `CLAUDE.md` para arquivos separados.** Artigo: dividir as instruções em arquivos e deixar o `CLAUDE.md` guiar até o certo. Oficial: import com `@` não economiza; citar o caminho em texto simples só vale se o Claude decidir abrir o arquivo. Recomendação (sem esconder o artigo): usar os mecanismos sob demanda.
- **Metade dos tokens.** Título do artigo: uso “cortado pela metade”, número pessoal e sem método. O corpo admite que subagente pode aumentar o total. Oficial: sem cifra de economia; as requisições do subagente contam no limite de uso. A skill não promete economia.
- **O que fica na raiz.** Artigo: o `CLAUDE.md` da raiz diz onde ficam os arquivos principais. Oficial: o `/doctor` corta do `CLAUDE.md` o que o Claude descobre no código, como árvore de pastas, lista de dependências e visão da arquitetura. A skill manda manter só o não derivável.

## Pendências

- **Teste no Claude Code ainda não feito** (não há Claude Code nesta sessão). Permanece `parcial`, mesmo depois do push no GitHub. Para fechar: instalar a skill em `~/.claude/skills/`; num projeto com `CLAUDE.md` grande, anotar o `/context`, rodar `/enxugar-contexto`, aplicar a triagem e rodar `/context` de novo; criar um `CLAUDE.md` numa subpasta e conferir que carrega quando o Claude lê um arquivo ali.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
