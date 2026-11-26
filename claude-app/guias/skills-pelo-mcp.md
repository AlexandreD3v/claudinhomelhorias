# Skills, Tasks e Elicitation enviados pelo conector MCP

**Destino de instalação:** `app-claude` (app Claude no Mac, Windows ou claude.ai, conforme o recurso existir no cliente).

<!-- Fonte 006: https://claude.com/resources/articles/skills-over-mcp-tasks-and-more (acesso 2026-11-26 17:55, America/Sao_Paulo).
     Conferido nas páginas oficiais em 2026-11-26:
     - https://code.claude.com/docs/en/mcp#use-skills-from-mcp-servers
     - https://code.claude.com/docs/en/feature-availability
     - https://claude.com/docs/connectors/building/files
     Status: NÃO testado no app Claude. Skills over MCP está em beta; File Uploads em rollout. Confira as páginas acima antes de confiar em cada detalhe. -->

Servidores MCP (conectores no app) podem enviar skills junto das tools, rodar trabalho longo (Tasks) e pedir a sua confirmação no meio da chamada (Elicitation). Você não instala a skill à parte: ela chega com o conector e atualiza com ele. Não é um substituto das skills que você mesmo cria no app (Customize > Skills).

Para o mesmo assunto no **Claude Code** (CLI, menu `/servidor:skill`, `/tasks`), use a skill `usar-skills-pelo-mcp` do pacote `claude/`.

## Requisitos

- **Planos (artigo, 24/11):** Skills over MCP em beta pública no Claude e no Claude Code, ligadas por padrão em Pro, Max e Ultra; em Team, um admin precisa ligar; “em breve no Enterprise”. Tasks e Elicitation: disponibilidade geral em Pro, Max e Ultra, em rollout para Team e Enterprise. File Uploads: em rollout para Pro, Max, Ultra e planos Team/Enterprise elegíveis.
- **Planos (doc oficial do Claude Code, 26/11):** Skills from MCP servers estão ligadas em Pro, Max e Ultra; em Team **e** Enterprise ficam *Admin-enabled* (Owner liga em Organization settings > Connectors; a setting de Skills da organização também precisa estar ligada). A tabela oficial já inclui o Enterprise; o artigo está atrasado neste ponto. Para Tasks e Elicitation, a doc de MCP não repete a divisão por plano do artigo: confira o seu plano e a tela de conectores.
- **Conta:** online, com o conector ligado. Só adicione conectores em que você confia: a skill pode orientar o Claude a agir, e o servidor pode mudá-la a qualquer momento.

Se as skills do conector não aparecerem: atualize o app; em Team ou Enterprise, peça a um Owner para ligar Skills over MCP em Organization settings > Connectors e conferir a setting de Skills.

## Skills do conector

1. Ligue o conector em Customize ou em Configurações > Connectors, e faça o login que ele pedir.
2. Não baixe nem recrie a skill do conector como skill pessoal: a cópia local envelhece. Peça o fluxo no chat (“atualize minha loja”, “prepare o onboarding no HubSpot”) e deixe o Claude carregar a skill do servidor quando couber.
3. O artigo cita Shopify (loja de ponta a ponta), HubSpot (onboarding), Atlassian (contexto da organização) e Carta (em breve). São exemplos da Anthropic, não um passo a passo testado aqui.
4. Skills que você mesmo escreveu continuam no caminho de sempre (Customize > Skills). As duas origens podem coexistir.

## Tasks

Quando o conector aceita um trabalho longo, o Claude não precisa ficar parado esperando a tool call terminar: o servidor roda a operação e o Claude segue, até o resultado chegar. O artigo cita o ZoomInfo (pesquisa mais fundo de contas e contatos). Se o app mostrar o andamento ou o fim da tarefa, peça o resultado ao Claude se ele não trouxer sozinho.

## Elicitation

Antes de um gasto, de um SQL destrutivo ou de apagar um recurso, o servidor pode pausar e pedir confirmação numa ficha (form) ou abrindo um link (URL, por exemplo um login). Preencha e envie, ou recuse: recusar é uma resposta, e o servidor decide se continua. O artigo cita Supabase, Railway e GitHub. Não confirme no chat um passo que o diálogo já está pedindo: responda no próprio diálogo.

## File Uploads

Ainda em rollout. A ideia (artigo) é enviar PDF, planilha ou imagem ao servidor sem passar o arquivo pelo contexto. A [doc de conectores](https://claude.com/docs/connectors/building/files) já descreve a extensão em beta, com requisitos estreitos (conector do Directory, revisão MCP 2026-07-28, hosts aprovados). Não trate como recurso geral até o seu plano e o conector aparecerem com a opção.

## Como testar (quando for testar)

1. Numa conta Pro, Max ou Ultra (ou Team/Enterprise com o admin tendo ligado o recurso), ligue um conector que publique skills.
2. Peça um fluxo que a skill do conector deveria cobrir e confira, no pensamento ou no registro da conversa, se o Claude carregou a skill do servidor — não uma skill sua com o mesmo tema.
3. Se o conector oferecer uma ação longa ou destrutiva, acompanhe o andamento (Tasks) e responda o diálogo (Elicitation) em vez de escrever a confirmação só no chat.

Não testado neste checkout. Recurso em beta; detalhes podem mudar.
