# Papa-Fila — Notas desta implementação

## ⚠️ Isto não foi compilado nem testado

Assim como no outro projeto, este ambiente **não tem Flutter SDK nem acesso
à internet**, então não consegui rodar `flutter pub get` / `flutter run`
para validar o código. Escrevi com cuidado, mas o primeiro passo obrigatório
na sua máquina é:

```bash
flutter pub get
flutter run -d chrome      # ou -d <dispositivo>
flutter analyze            # checar erros
```

Se aparecer erro, me manda a mensagem que eu corrijo.

## O que foi implementado

- `assets/json/produtos.json` — cardápio da cantina que você mandou, agora
  registrado no `pubspec.yaml`.
- `lib/data/produto.dart` e `lib/data/produto_repository.dart` — modelo do
  produto e leitura do JSON.
- `lib/services/cart_service.dart` — **pedido atual** (carrinho): guarda as
  quantidades por produto, persiste no dispositivo via `shared_preferences`
  (sobrevive a fechar/abrir o app) e expõe `addItem`, `removeOne`,
  `itensAtuais()`, `totalAtual()`.
- **Home** (`lib/pages_public/home.dart`): agora lista o cardápio (imagem,
  nome, preço) vindo do JSON. Cada item tem um botão **"+"** que adiciona ao
  pedido atual e leva direto para a tela **Pedidos**. O campo de busca no
  topo já filtra a lista pelo nome.
- **Pedidos** (`lib/pages_public/pedidos.dart`): antes era um placeholder de
  "Histórico"; agora mostra os itens do **pedido atual** (conforme você
  pediu), com quantidade (+/-), subtotal por item e total, mais um botão
  "Pagar Com Pix" que leva para Pagamentos.
- **Carrinho** (`lib/pages_public/carrinho.dart`): mantive a tela como
  estava (com o botão de ir pro Pix), só adicionei o resumo dos itens do
  pedido atual + total acima do botão.
- **Pagamentos / Pix** (`lib/pages_public/pagamentos.dart`): o "Total"
  fixo `00,00` agora mostra o valor real do pedido atual.

## O que eu não toquei

`login.dart`, `perfi.dart`, `seunumero.dart`, `splash.dart` e
`page_cozinha/HomeCozinha.dart` continuam exatamente como estavam — você não
pediu mudanças ali.

## Publicando no GitHub

Sem acesso à internet aqui, não consigo dar `git push`. Depois de validar
localmente:

```bash
git add .
git commit -m "Integra cardapio (JSON) com pedido atual, pedidos e pagamento via Pix"
git push origin main
```
