---
name: registrar-handoff
description: >
  Registra o handoff de fim de sessão numa pasta de projeto compartilhada com
  outros agentes de código: escreve a nota no topo de HANDOFF.md e respeita
  DECISIONS.md. Use ao encerrar a sessão ou antes de passar o projeto a outro agente.
when_to_use: >
  O usuário diz “registre o handoff”, “vou trocar de agente” ou “termine a
  sessão deixando nota”, num projeto que tem HANDOFF.md e DECISIONS.md.
disable-model-invocation: true
metadata:
  destino: projeto
  fonte: "005"
  url: "https://www.xda-developers.com/stopped-choosing-between-claude-code-codex-antigravity-one-shared-folder-lets-them-pick-up-each-others-work/"
  acesso: "2026-11-26"
---

# Registrar o handoff

**Destino de instalação:** `projeto` (`.claude/skills/registrar-handoff/`). `HANDOFF.md` e `DECISIONS.md` vivem na pasta do projeto, compartilhada com os outros agentes.

Fluxo do artigo da fonte 005 (XDA, 1 de novembro de 2026), que é um relato de uso do autor, não um recurso do Claude Code. Os modelos de arquivo estão em [`modelos.md`](modelos.md). Não foi testado no Claude Code.

Pré-requisitos no projeto: `HANDOFF.md` e `DECISIONS.md` na raiz; `AGENTS.md` com o bloco de regras de `modelos.md`; `CLAUDE.md` com `@AGENTS.md` (snippet `compartilhar-agents-md`).

## Passos

1. Leia `HANDOFF.md` (a nota mais recente fica no topo) e `DECISIONS.md`.
2. Liste o que esta sessão concluiu e o que ficou incompleto. Confira com `git status` e `git log` que a lista bate com o repositório.
3. Escreva a nota nova **no topo** de `HANDOFF.md`, no formato de `modelos.md`: data e hora com fuso, agente (Claude Code), o que foi feito, o que não foi, onde o próximo agente deve começar e perguntas para o humano.
4. Se algo ficou decidido de vez (por exemplo “HTML puro neste projeto”), acrescente a `DECISIONS.md`. **Não reverta** uma decisão que já está lá. Se discordar, registre a divergência como pergunta para o humano na nota.
5. Mantenha `HANDOFF.md` curto. Recomendação deste repositório, não do artigo: passe de umas 10 notas, mova as mais antigas para `HANDOFF-ARQUIVO.md`, porque um arquivo que cresce sem parar vira custo de contexto para quem o ler primeiro.
6. Mostre ao usuário o que escreveu e pare. Não faça commit sem pedido.

## Limites

- O artigo recomenda um agente por vez na pasta. Dois agentes editando em paralelo podem mexer nos mesmos arquivos sem ler as notas um do outro.
- Cada agente segue as regras de um jeito: o autor relata que o Antigravity precisou de um prompt mais explícito que o Codex para escrever a nota.
- A obrigatoriedade de reverter só com o humano (`DECISIONS.md`) é regra escrita para os agentes; o próprio autor diz que não testou o que acontece sem ela.
