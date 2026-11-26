---
name: usar-opusplan
description: >
  Ativa e usa o alias opusplan do Claude Code: Opus planeja no plan mode
  e Sonnet executa depois da aprovação, para esticar o limite do plano.
  Use ao falar de limites de uso, custo, /usage, plan mode, ou quando
  o trabalho tiver uma fase clara de planejamento seguida de implementação.
when_to_use: >
  O usuário quer gastar menos da cota, menciona limites de 5 horas ou
  semanais, pede opusplan, ou vai começar uma tarefa que precisa de um
  plano antes do código.
argument-hint: ""
allowed-tools: Read Grep Glob
metadata:
  destino: usuario
  fonte: "001"
  url: "https://www.xda-developers.com/i-stopped-hitting-claudes-usage-limits-after-changing-one-habit-in-how-i-start-sessions/"
  acesso: "2026-11-25"
---

# Usar opusplan para esticar a cota

**Destino de instalação:** `usuario` (`~/.claude/skills/usar-opusplan/`).

Procedimento conferido na documentação oficial ([model configuration](https://code.claude.com/docs/en/model-config), [prompt caching](https://code.claude.com/docs/en/prompt-caching), [manage costs](https://code.claude.com/docs/en/costs), [models, usage and limits](https://support.claude.com/en/articles/14552983-models-usage-and-limits-in-claude-code)). A fonte 001 (XDA, 21 de novembro de 2026) relata o mesmo padrão; não trate os números do teste do autor (16%, US$ 0,34) como garantia.

## Quando usar

- A tarefa tem uma fase de plano (arquitetura, abordagem, arquivos a tocar) e depois implementação.
- Você está numa assinatura com limite (Pro, Max, etc.) e quer reservar o Opus para o raciocínio, não para cada linha de código.

Não transforme `opusplan` no padrão cego de todos os projetos: se a tarefa inteira exige Opus (refatoração difícil, debug cruzado), fique em `opus`. Sonnet sozinho continua adequado para o dia a dia, segundo a doc oficial.

## Como ativar

Para **esta sessão:**

```text
/model opusplan
```

No seletor de `/model`, escolher `opusplan` **não grava** um novo padrão (a doc oficial diz que a escolha registrada não muda com Default nem com `opusplan`). Para default permanente, mescle no `~/.claude/settings.json` (veja `claude/settings/opusplan.exemplo.json` neste repositório):

```json
{
  "model": "opusplan"
}
```

Também vale `claude --model opusplan` só naquela invocação.

## Como trabalhar

1. Entre no plan mode (`/plan` ou Shift+Tab, conforme a sua superfície).
2. Peça o plano e revise. O Opus é o modelo desta fase.
3. Aprove o plano e saia do plan mode. O Claude Code passa automaticamente para Sonnet na execução. A conversa **não** é apagada: o Sonnet ainda vê o plano.
4. Acompanhe o consumo com `/usage` (barras percentuais do plano, não número de mensagens). Em assinatura, o valor em dólares da sessão é estimativa a preço de API, não a cobrança do plano. No site, use Settings > Usage.

## Ressalvas oficiais (não pule)

- **Cache miss na troca.** Cada ida ou volta do plan mode com `opusplan` é uma troca de modelo e começa um cache novo. O próximo pedido relê o histórico. Isso é esperado; evite alternar o plan mode sem necessidade.
- **Limites compartilhados.** O limite de 5 horas (começa na primeira mensagem e zera 5 horas depois) e o limite semanal valem juntos para o Claude (web, desktop, mobile) e o Claude Code. Ultra verificado não tem o limite de 5 horas, segundo o help center na data desta fonte.
- **Outro hábito oficial, que este artigo não ensina:** ao *mudar de tarefa* não relacionada, a Anthropic recomenda `/clear` (a conversa zera; `CLAUDE.md` e o projeto permanecem). No meio da mesma tarefa, use `/compact`. Não atribua isso ao artigo da XDA; está na doc oficial de uso e custos.

## O que não fazer

- Não apresente a economia de 16% do teste da XDA como resultado esperado.
- Não copie o `model: opusplan` para o `.claude/settings.json` de um projeto se a convenção dali for outro modelo; este default é pessoal (`usuario`).
