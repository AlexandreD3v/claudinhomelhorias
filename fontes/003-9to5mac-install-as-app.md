# Fonte 003 — Anthropic just gave Claude users a new way to make Mac apps

- **URL:** https://9to5mac.com/2026/11/24/anthropic-just-gave-claude-users-a-new-way-to-make-mac-apps/
- **Acesso:** 2026-11-26 08:20 (America/Sao_Paulo). Reprocessada em 2026-11-26 08:29 (America/Sao_Paulo), depois da ampliação do escopo ao app Claude.
- **Autor / site:** Zac Hall, 9to5Mac. Publicado em 24 de novembro de 2026, 11:56 PT.
- **Tema:** claude-app
- **Status:** parcial

## Resumo

A 9to5Mac noticia o beta “Install as app”: artifacts criados no **Claude para Mac e Windows** (o app de chat da Anthropic) podem ser instalados como apps de mesa, com ícone e janela próprios, permissões que o usuário concede, notificações, item na barra de menus e uso de connectors. O texto é curto e quase todo citação do anúncio oficial da Anthropic. O recurso **não é do Claude Code**, mas entra no escopo do repositório desde 26 de novembro de 2026 (app Claude). O artigo não traz requisitos, versão, planos nem limites; esses vêm das páginas oficiais, que viraram o guia [`claude-app/guias/instalar-artifact-como-app.md`](../claude-app/guias/instalar-artifact-como-app.md).

**Histórico.** Na primeira passagem (26 de novembro de 2026, 08:20) a fonte foi `descartada`, porque o escopo era só o Claude Code. Com o escopo ampliado, foi reprocessada: virou guia em `claude-app/` e o status passou a `parcial`.

## O que foi lido

- A página canônica do artigo da 9to5Mac. O link “here” aponta para o anúncio oficial [Turn artifacts into Mac and Windows apps](https://claude.com/resources/articles/install-as-app). O link “second Claude update this week made specifically for builders” leva a outra matéria da 9to5Mac, sobre o recurso Claude Ship (23 de novembro de 2026); não foi processada aqui.
- Conferência oficial, em 26 de novembro de 2026: o anúncio acima; o Help Center [Install an artifact as an app](https://support.claude.com/en/articles/18516354-install-an-artifact-as-an-app); o [guia de admin de artifacts para Team e Enterprise](https://support.claude.com/en/articles/16994751-artifacts-admin-guide-for-team-and-enterprise-plans) (linkado pelo Help Center); as [notas de versão](https://support.claude.com/en/articles/12138966-release-notes) (entrada de 24 de novembro de 2026); [Share session output as artifacts](https://code.claude.com/docs/en/artifacts) (para a fronteira com o Claude Code). A listagem de [anthropic.com/news](https://www.anthropic.com/news) não tinha post dedicado na data do acesso.

## Insights acionáveis

### Insight 1 — Como instalar, abrir e desinstalar um artifact como app

- **Ação:** no Claude para Mac ou Windows (6.28899.0 ou posterior, online e logado), construir o artifact, testá-lo, escolher “Install as app” no menu do título ou em Share e confirmar. Abrir pela pasta Claude Apps, por File > Apps ou pelo artifact. Desinstalar em File > Apps. App com item na barra de menus ou na bandeja continua rodando depois de fechar a janela.
- **Quando importa:** quem constrói ferramentas pessoais no app Claude e quer abri-las como apps comuns.
- **Tipo de artefato:** guia-app
- **Destino de instalação:** app-claude
- **Seção de origem:** corpo do artigo (citação “Starting today… Claude for Mac and Windows”), completado pelo Help Center
- **Conferido na doc oficial:** sim — anúncio da Anthropic e Help Center

### Insight 2 — Permissões em níveis e re-consentimento

- **Ação:** o app pede antes de usar notificações, atalhos de teclado, flutuar sobre janelas e item na barra de menus ou bandeja; “acesso total” (executar programas e ler, alterar ou apagar arquivos) é um nível à parte. Um “Allow” vale para uma versão do app e o Claude pergunta de novo a cada atualização. Acesso total só para apps feitos por você (ou, em Team e Enterprise, por gente da organização). A Anthropic não revisa os apps.
- **Quando importa:** antes de instalar qualquer app, e a cada atualização.
- **Tipo de artefato:** guia-app (mesmo guia)
- **Destino de instalação:** app-claude
- **Seção de origem:** “has its own permissions” (artigo) e seções Permissions das páginas oficiais
- **Conferido na doc oficial:** sim

### Insight 3 — Cota compartilhada

- **Ação:** construir o app e toda requisição que ele faz ao Claude contam nos limites do plano. Esses limites já são compartilhados com o Claude Code (fonte 001).
- **Quando importa:** quem usa o plano também no Claude Code.
- **Tipo de artefato:** guia-app (mesmo guia, seção “Cota compartilhada”)
- **Destino de instalação:** app-claude
- **Seção de origem:** “Claude usage is tied to desktop apps made with artifacts.”
- **Conferido na doc oficial:** sim — anúncio e Help Center (“Usage limits”)

### Insight 4 — Controles para owners de Team e Enterprise

- **Ação:** três chaves em Organization settings > Artifacts (Install as app, App permissions, Full access) e três chaves de MDM que só desligam. Team vem ligado, com acesso total desligado; Enterprise vem desligado. O artigo da 9to5Mac não traz isso; vem do guia de admin.
- **Quando importa:** conta de trabalho.
- **Tipo de artefato:** guia-app (mesmo guia, seção para owners)
- **Destino de instalação:** app-claude (as chaves em si ficam em Configurações da organização)
- **Seção de origem:** guia de admin de artifacts, “Control installing artifacts as apps (beta)”
- **Conferido na doc oficial:** sim

## Artefatos gerados

- `claude-app/guias/instalar-artifact-como-app.md` — destino: `app-claude` — requisitos, versão, planos, passo a passo, permissões, limites do beta, cota compartilhada, boas práticas (marcadas como oficiais ou deste repositório), controles de admin e roteiro de teste.
- `claude-app/README.md` — apresenta a pasta nova e os destinos (`app-claude`, `projeto-claudeai`, `configuracoes`).

## Duplicatas e reuso

Não havia nada em `claude-app/` (pasta criada junto com esta fonte). A cota compartilhada já constava na fonte 001 e na skill `usar-opusplan`; o guia só remete a ela, sem duplicar a skill.

## Divergências com a documentação oficial

O artigo reproduz o oficial no essencial e não o contradiz. O que ele não traz (versão mínima, planos, limites, níveis de permissão, re-consentimento) está no guia, a partir das páginas oficiais. A imagem de capa da 9to5Mac (`claude-code-auto-mode.webp`) lembra o Claude Code, mas o corpo, as citações e o link oficial tratam do app Claude para Mac e Windows.

## Conflitos entre fontes

- **Acesso total e apps de terceiros.** Anúncio oficial (claude.com): “você só pode dar acesso total a apps que você fez ou, em Team e Enterprise, a apps de pessoas da sua organização”, dito sem ressalva. Help Center: o Claude “geralmente não permite” que um app peça acesso total se alguém de fora da organização escreveu parte dele ou se o Claude não confirma quem o fez, e em planos pessoais “fora da organização” é qualquer outro usuário. Os dois lados: regra categórica (anúncio) e regra com “geralmente” (Help Center). O guia trata como bloqueado e não promete exceção.
- **Implantação híbrida.** Anúncio oficial e guia de admin: organizações com configuração HIPAA-ready **e** com implantação híbrida não podem usar o recurso. Help Center, seção de limitações: cita só HIPAA. Os dois lados: o Help Center não menciona implantação híbrida, os outros dois mencionam. O guia lista as duas.
- **Artifact do Claude Code como app.** A doc do Claude Code descreve artifacts como páginas em claude.ai abertas no navegador (CLI v2.1.281+ ou app desktop 1.13576.0+) e não fala em instalá-las como app. O Help Center descreve só o caminho “abra o artifact na janela principal do Claude Desktop” e não afirma nem nega que um artifact publicado pelo Claude Code possa ser instalado. É lacuna, não escolha: o guia manda testar.
- **9to5Mac vs oficial.** Nenhuma contradição factual. A matéria cita só “menu bar”; o oficial fala de barra de menus (macOS) ou bandeja (Windows), e só depois de permissão explícita.

Recomendação (sem esconder os dois lados): seguir o Help Center e o anúncio oficial vigentes; tratar o acesso total como indisponível para apps de terceiros.

## Pendências

- **Teste no app Claude ainda não feito** (não há Claude Desktop nesta sessão). O status permanece `parcial`, mesmo depois do push no GitHub. Para fechar: seguir a seção “Como testar este guia” em `claude-app/guias/instalar-artifact-como-app.md` no Mac ou no Windows, anotar a versão do app e corrigir o guia no que divergir.
- Push no GitHub: a cargo de quem publicar; não muda o status para `publicado` sozinho.
