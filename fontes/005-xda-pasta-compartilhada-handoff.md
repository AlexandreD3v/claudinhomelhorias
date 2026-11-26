# Fonte 005 — I stopped choosing between Claude Code, Codex, and Antigravity, and one shared folder lets them pick up each other's work

- **URL:** https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/
- **Acesso:** 2026-11-26 08:38 (America/Sao_Paulo)
- **Autor / site:** Nolen Jonker, XDA Developers. Publicado em 1 de novembro de 2026, 14:01 (EST) — 16:01 (America/Sao_Paulo). Relato de uso, sem versão do Claude Code citada.
- **Tema:** claude-code
- **Status:** parcial

## Resumo

O autor assina Claude Code, Codex e Antigravity e passou a guardar a memória do projeto na pasta, não no histórico de nenhum app. `AGENTS.md` é o livro de regras de todos; o `CLAUDE.md` só o importa com uma linha. Regras mandam cada agente ler `HANDOFF.md` (um log com a nota mais recente no topo) antes de mexer e assinar uma nota ao sair, dizendo o que terminou, o que não e por onde continuar. `DECISIONS.md` guarda o que está decidido, e nenhum agente pode reverter: se discordar, avisa no handoff. Cada agente ganha uma “faixa” e só um trabalha na pasta por vez. O fechamento da sessão, no Claude Code e no Codex, passa por uma skill de handoff. O ganho relatado: quando um agente esgota o limite, outro continua da última nota. O autor admite custo (toda sessão termina com handoff, os agentes seguem as regras de modos diferentes) e que não testou o que acontece sem a regra de decisões.

## O que foi lido

- A página canônica do artigo, com os comentários (ignorados como fonte: citam Gitea, Honcho, T3 Code e outros, sem verificação).
- Documentação oficial, em 26 de novembro de 2026: [memória / AGENTS.md e imports](https://code.claude.com/docs/en/memory#agents-md), [glossário](https://code.claude.com/docs/en/glossary), [comandos](https://code.claude.com/docs/en/commands) (`/import`, `/init`, `/context`), [skills](https://code.claude.com/docs/en/skills) e o [changelog](https://code.claude.com/docs/en/changelog) (suporte a `AGENTS.md` desde a 2.1.277, de 18 de setembro de 2026).
- Deixado de fora por não servir ao Claude Code nem ao app Claude: o comportamento de Codex e Antigravity, o limite de 12.000 caracteres das regras do Antigravity e as faixas por agente. O app Claude (chat/Desktop) não entra: o texto trata de agentes de código.

## Insights acionáveis

### Insight 1 — Um `AGENTS.md` compartilhado, importado pelo `CLAUDE.md`

- **Ação:** manter as regras do projeto em `AGENTS.md` e, no `CLAUDE.md`, `@AGENTS.md` mais as instruções só do Claude Code abaixo. A doc oficial confirma o padrão e traz detalhes que o artigo não tem: a partir da v2.1.277 o Claude Code lê o `AGENTS.md` sozinho quando não existe nenhum `CLAUDE.md` na pasta de trabalho nem acima; existindo, lê só o `CLAUDE.md`; o `CLAUDE.local.md` também conta como `CLAUDE.md`; no Windows o import é preferível a symlink.
- **Quando importa:** projeto que outros agentes também abrem.
- **Tipo de artefato:** trecho-claude-md
- **Destino de instalação:** projeto
- **Seção de origem:** “How I set up one folder for all three”
- **Conferido na doc oficial:** sim — memória (“AGENTS.md”, “Share one file with other coding tools”)

### Insight 2 — Log de handoff e registro de decisões

- **Ação:** `HANDOFF.md` com a nota mais recente no topo, assinada por cada agente ao sair, e `DECISIONS.md` com o que está decidido (agente não reverte; discorda no handoff). Fechar a sessão por uma skill chamada pelo nome. Isso é prática do autor, não recurso do Claude Code; a doc oficial não tem equivalente de handoff.
- **Quando importa:** troca de agente por limite de uso ou por ponto forte de cada um.
- **Tipo de artefato:** skill (com arquivo de apoio de modelos)
- **Destino de instalação:** projeto
- **Seção de origem:** “The project remembers itself, regardless of which agent opens it”
- **Conferido na doc oficial:** sim para o formato de skill (`disable-model-invocation`, arquivos de apoio); o fluxo em si é extraoficial, com atribuição

### Insight 3 — Trazer a configuração do Codex para o Claude Code

- **Ação:** o Claude Code tem `/import codex|gemini|cursor`, que traz instruções, MCP, comandos, subagentes e skills como cópia única. É uma alternativa oficial para quem só quer migrar, e não substitui a pasta compartilhada.
- **Quando importa:** migração única, sem handoff contínuo.
- **Tipo de artefato:** nenhum (só registro; é comando nativo)
- **Destino de instalação:** —
- **Seção de origem:** não está no artigo; vem da doc oficial de comandos
- **Conferido na doc oficial:** sim — comandos

## Artefatos gerados

- `claude/snippets/compartilhar-agents-md.md` — destino: `projeto` (`./CLAUDE.md` da raiz) — o `@AGENTS.md` com a ressalva de quando é preciso, a verificação em `/context all` e os cuidados de Windows e `CLAUDE.local.md`.
- `claude/skills/registrar-handoff/SKILL.md` — destino: `projeto` (`.claude/skills/registrar-handoff/`) — escreve a nota no topo de `HANDOFF.md`, respeita `DECISIONS.md` e não faz commit. Invocação só manual.
- `claude/skills/registrar-handoff/modelos.md` — destino: `projeto` — modelos de `HANDOFF.md`, `DECISIONS.md` e o bloco de regras para o `AGENTS.md`.

## Duplicatas e reuso

Nada em `claude/` tratava de `AGENTS.md`, import ou handoff. O starter só cita `CLAUDE.md` e `CLAUDE.local.md`. A regra “instrução que o Claude precisa seguir vai em hook, não em `CLAUDE.md`” do starter vale aqui também: o handoff é convenção, não garantia. A skill `enxugar-contexto` (fonte 004) é complementar: ela alerta que um log que cresce vira custo de contexto.

## Divergências com a documentação oficial

- O artigo descreve o Claude Code como quem procura o próprio `CLAUDE.md` e precisa do import para chegar ao `AGENTS.md`. A doc oficial, desde a v2.1.277 (18 de setembro de 2026, antes do artigo), lê o `AGENTS.md` direto quando não há `CLAUDE.md`. Com um `CLAUDE.md` presente, o import (ou `/config` > Project instructions) continua necessário. O artigo está certo no caso de quem já tem `CLAUDE.md` e omite o caso novo.
- “O `CLAUDE.md` nunca precisa ser tocado”: oficial, instruções só do Claude Code vão abaixo do import, no `CLAUDE.md`.

## Conflitos entre fontes

- **Como o Claude Code descobre o `AGENTS.md`.** Artigo: só via `CLAUDE.md` com import. Oficial: leitura direta sem `CLAUDE.md` (v2.1.277+), import (ou a configuração `claude-md-and-agents-md`) com `CLAUDE.md`. Recomendação (sem esconder o artigo): sem `CLAUDE.md`, nada a fazer em versão recente; com `CLAUDE.md`, usar o snippet.
- **Instruir “leia o `HANDOFF.md`” em texto.** Artigo: a regra no `AGENTS.md` manda cada agente ler o handoff antes de mexer. Oficial: uma instrução em texto só leva o Claude a ver o arquivo se ele decidir abri-lo; um `@HANDOFF.md` garante o carregamento, mas traz o arquivo inteiro em toda sessão, e import não reduz o contexto (fonte 004 e doc oficial). Os dois lados ficam: leitura instruída (barata, sem garantia) e import (garantida, custo crescente). A skill lê o arquivo explicitamente e sugere manter o log curto e arquivar notas velhas (recomendação deste repositório, não oficial nem do artigo).
- **Fonte 004 contra fonte 005.** 004 aconselha contexto sempre carregado enxuto; 005 acumula um log que os agentes precisam ler. Não há contradição de fato, mas o log só é barato enquanto curto.

## Pendências

- **Teste no Claude Code ainda não feito** (não há Claude Code nesta sessão; os outros agentes do artigo também não foram testados). Permanece `parcial`, mesmo depois do push no GitHub. Para fechar: numa pasta de teste, criar `AGENTS.md` com o bloco de `modelos.md` e um `CLAUDE.md` com `@AGENTS.md`; no Claude Code v2.1.277 ou posterior, `/context all` deve listar o `CLAUDE.md` em Memory files; instalar a skill em `.claude/skills/`, rodar `/registrar-handoff`, abrir sessão nova e pedir “continue do último handoff”, conferindo se ele leu a nota do topo.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
