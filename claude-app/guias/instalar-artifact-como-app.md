# Instalar um artifact como app no Claude para Mac e Windows

**Destino de instalação:** `app-claude` (Claude para Mac ou Windows, versão 6.28899.0 ou posterior).

<!-- Fonte 003: https://9to5mac.com/2026/11/24/anthropic-just-gave-claude-users-a-new-way-to-make-mac-apps/ (acesso 2026-11-26, America/Sao_Paulo).
     Conferido nas páginas oficiais em 2026-11-26:
     - https://claude.com/resources/articles/install-as-app
     - https://support.claude.com/en/articles/18516354-install-an-artifact-as-an-app
     - https://support.claude.com/en/articles/16994751-artifacts-admin-guide-for-team-and-enterprise-plans
     - https://support.claude.com/en/articles/12138966-release-notes (entrada de 24 de novembro de 2026)
     Status: NÃO testado no app Claude. Recurso em beta; confira as páginas acima antes de confiar em cada detalhe. -->

“Install as app” (beta) transforma um artifact que o Claude fez numa conversa em um app de mesa: ícone próprio, janela própria, permissões que você concede uma a uma. Não é um recurso do Claude Code. Quem usa o Claude Code não precisa disto para nada do CLI; serve para quem constrói ferramentas pessoais no app Claude.

## Requisitos

- **App:** Claude para Mac ou Claude para Windows, versão **6.28899.0 ou posterior**. Mac: menu Claude > Check for Updates. Windows: menu ☰ > Help > Check for Updates.
- **Conta:** online e logado no Claude Desktop, tanto para instalar quanto para abrir o app depois.
- **Planos:** Free, Pro, Max, Ultra, Team e Enterprise (rollout em beta).
  - **Team:** ligado por padrão; o nível “acesso total ao computador” fica desligado até um admin ligar.
  - **Enterprise:** tudo desligado até um owner ligar em Organization settings > Artifacts. O guia de admin pede que “Cloud code execution and file creation” esteja ligado antes, em Organization settings > Capabilities.
- **Não disponível:** Linux, web e celular; organizações com configuração HIPAA-ready e com implantação híbrida (a divergência entre as páginas oficiais está na [nota da fonte 003](../../fontes/003-9to5mac-install-as-app.md)); acesso total em Claude for Teachers e organizações K-12.
- **Artifacts que não instalam:** os criados de template (Docs, Slides, Sheets), artifacts legados e live artifacts do Claude Cowork.

Se o item “Install as app” não aparecer: atualize o app; em Team ou Enterprise, peça a um owner para conferir se está ligado.

## Passo a passo

1. **Descreva o app** numa conversa, por exemplo “um timer pomodoro que fica na barra de menus” ou “um app que renomeia as fotos de uma pasta por data” (exemplos do Help Center).
2. **Teste como artifact** na própria conversa. Peça os ajustes antes de instalar.
3. **Instale:** abra o artifact na janela principal do Claude Desktop, abra o menu do título (ou clique com o botão direito) e escolha “Install as app”; ou use Share > Install as app. Depois confirme em “Install”. O Claude sempre pede confirmação, por qualquer caminho. O artifact também pode ter o próprio botão de instalar, se você pedir.
4. **Abra o app:**
   - macOS: pasta Claude Apps dentro de Applications, na sua pasta pessoal; também aparece no Spotlight. Para manter no Dock: botão direito > Options > Keep in Dock.
   - Windows: menu Iniciar (pasta Claude Apps) ou atalho na área de trabalho.
   - No Claude Desktop: “Open installed app” no artifact, ou File > Apps > escolher > Open (no Windows, File fica no menu ☰).
5. **Encerre** um app com item na barra de menus ou na bandeja: ele continua rodando depois de fechar a janela. No macOS, saia pelo Dock ou com Cmd+Q; no Windows, “Exit” no menu do ícone da bandeja.
6. **Desinstale** em File > Apps > escolher > Uninstall. No macOS o app vai para a Lixeira; no Windows os atalhos somem. Se você o fixou no Dock, na barra de tarefas ou no Iniciar, remova de lá também. Desinstalar tira as permissões concedidas e não apaga o artifact.

O app continua sendo o mesmo artifact: quando você ou outro editor muda o artifact, o app muda junto.

## Permissões

O app precisa pedir antes de usar qualquer recurso abaixo; você responde “Allow” ou “Don't allow”.

| Permissão | O que o app pode fazer |
| --- | --- |
| Notificações | Mostrar notificações enquanto você usa outros apps |
| Atalhos de teclado | Responder a combinações de teclas com outros apps em uso |
| Flutuar sobre outras janelas | Desenhar acima de outras janelas e ler onde o cursor está nas suas telas |
| Item na barra de menus (macOS) ou ícone na bandeja (Windows) | Mostrar um item ali enquanto o app está aberto |
| Acesso total a este computador | Executar programas e ler, alterar ou apagar seus arquivos sem perguntar a cada vez; cobre também as permissões acima, salvo se você ou sua organização as desligaram |

Os níveis, em palavras da Anthropic: padrão (só o que um navegador faria), permissões do app e acesso total ao computador.

- **Um “Allow” vale para uma versão do app.** Depois de qualquer atualização, inclusive edição sua, o Claude pergunta de novo. Um “Don't allow” fica até você mudar.
- Se parte do app carregar código de outro site, esse código pode mudar sem novo pedido.
- Se o app vier de fora da sua organização, ou o Claude não souber quem o fez, o pedido mostra um aviso.
- **Acesso total** só para apps que você mesmo fez, ou, em Team e Enterprise, de pessoas da sua organização. A Anthropic não revisa os apps antes da instalação.
- **Mudar ou retirar** uma permissão: macOS, com o app aberto, clique no nome do app na barra de menus > Permissions. Windows, botão direito na barra de título (ou Alt+Espaço) > Permissions. No Claude Desktop: File > Apps > escolher > Permissions. Desligar o acesso total pode recarregar ou fechar o app, então salve antes. Isso encerra os programas que o app iniciou (menos os que se separaram dele) e não desfaz mudanças já feitas.
- Para denunciar um app: “Report Artifact”, no mesmo menu de Permissions, se estiver disponível.
- Quem perde acesso ao app (o dono parou de compartilhar, por exemplo) também perde os programas que ele iniciou; pode levar cerca de 20 minutos, ou mais se o Claude estiver offline.

## Limites do beta

- Sem Linux, web ou celular. Sem templates (Docs, Slides, Sheets), artifacts legados ou live artifacts do Cowork.
- Para abrir é preciso estar online e logado.
- **Zero data retention:** em organizações com ZDR só para o Claude Code, os apps podem ser instalados depois que um owner liga Artifacts e Install as app, mas esses apps **não** estão cobertos pelo ZDR. Em organizações com ZDR em toda a organização ou com chaves gerenciadas pelo cliente (CMEK), as três chaves de admin começam desligadas.
- **Computer use no macOS:** o Claude consegue ver um app instalado quando usa o seu computador, mas não consegue clicar nem digitar nele.
- Atalhos do navegador: “Add to Dock”, “Add browser shortcut” e “Add to Home Screen” do navegador só criam atalho; não têm os recursos de app descritos aqui.

## Cota compartilhada

Criar um app e **toda requisição que o app faz ao Claude** contam nos limites de uso do seu plano. O app usa a sua conta, sem chave de API nem login separado. Os limites do plano são compartilhados entre o app Claude e o Claude Code (confira a nota da [fonte 001](../../fontes/001-xda-limites-uso-sessoes.md)). Um app que chama o Claude em segundo plano, como um com item na barra de menus, também gasta cota enquanto estiver rodando.

## Boas práticas

Marcadas conforme a origem: **(oficial)** vem das páginas da Anthropic; **(repo)** é recomendação deste repositório, não texto oficial.

- **(oficial)** Teste como artifact antes de instalar. Instale um artifact que você já usa todo dia.
- **(oficial)** Dê só as permissões que o app precisa; comece negando. Acesso total só para app que você escreveu ou em que confia.
- **(oficial)** Leia cada pedido de permissão depois de uma atualização: o “Allow” anterior não vale para a versão nova.
- **(oficial)** Saiba como sair de um app com item na barra de menus ou na bandeja antes de fechá-lo, para não deixá-lo rodando sem querer.
- **(repo)** Não cole chave de API, token nem senha no código do artifact. O app já usa a sua conta Claude.
- **(repo)** Desconfie de apps que carregam código de outro site: o código externo muda sem novo pedido de permissão.
- **(repo)** Em conta de trabalho (Team ou Enterprise), confira com o owner o que a organização liberou antes de instalar algo com acesso total.
- **(repo)** Se o recurso sumir do menu depois de uma atualização do app, consulte as notas de versão do Claude e o Help Center: o recurso está em beta.

## Para owners de Team e Enterprise

- Em **Organization settings > Artifacts** há três chaves: Install as app, App permissions e Full access to the computer. Padrões: Team liga as duas primeiras e deixa o acesso total desligado; Enterprise começa tudo desligado. A mudança leva cerca de uma hora.
- Controle por **política de dispositivo (MDM)**: `isArtifactAppsEnabled`, `isArtifactAppPermissionsEnabled` e `isArtifactAppFullAccessEnabled`, em `false` no macOS (domínio `com.anthropic.claudefordesktop`) ou DWORD `0` no Windows (`HKLM\SOFTWARE\Policies\Claude`). As chaves só desligam. Exigem Claude Desktop 6.6395.1 ou posterior no macOS e 6.6395.0 ou posterior no Windows. Onde as duas camadas divergem, vale a mais restritiva.
- Abrir um app e as checagens de acesso aparecem como visualizações de artifact na Compliance API. Instalações, respostas de permissão e o que o app faz no computador não são registrados.

## Relação com o Claude Code

O Claude Code tem artifacts próprios: páginas ao vivo em claude.ai publicadas a partir de uma sessão e abertas no navegador (veja [Share session output as artifacts](https://code.claude.com/docs/en/artifacts)). A documentação do Claude Code não descreve instalar essas páginas como app de mesa, e o Help Center do app descreve o caminho “abra o artifact na janela principal do Claude Desktop”. Nenhuma das duas diz se um artifact publicado pelo Claude Code pode ser instalado. Teste antes de contar com isso.

## Como testar este guia

1. No Mac ou no Windows, confira a versão do Claude Desktop (6.28899.0 ou posterior) e atualize se precisar.
2. Numa conversa, peça: “Faça um app simples que mostra um contador na barra de menus.”
3. Veja o artifact, escolha Install as app e confirme. Anote onde o app apareceu (Claude Apps).
4. Abra o app, negue as permissões no primeiro pedido e veja se ele funciona só como o artifact. Depois permita uma só (por exemplo notificações) e confirme que o pedido não volta.
5. Edite o artifact e veja se o app pede as permissões de novo.
6. Encerre o app, desinstale em File > Apps e confira que o artifact continua na conversa.
7. Se algo diferir deste guia, anote a versão do app e corrija o guia e a nota da fonte 003. Só depois do teste e do push no GitHub a fonte pode ir para `publicado`.
