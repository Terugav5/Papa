import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/produto.dart';
import '../data/produto_repository.dart';

class ItemPedido {
  final Produto produto;
  int quantidade;

  ItemPedido({required this.produto, this.quantidade = 1});

  double get subtotal => produto.preco * quantidade;
}

/// Mantém o "pedido atual" (carrinho) sendo montado pelo usuário, e persiste
/// as quantidades no dispositivo (shared_preferences) para sobreviver a um
/// fechamento/reabertura do app.
///
/// É um singleton + ChangeNotifier: qualquer tela pode chamar
/// `CartService.instance.addListener(...)` (ou usar `AnimatedBuilder` /
/// `ListenableBuilder`) para reconstruir quando o pedido mudar.
class CartService extends ChangeNotifier {
  CartService._();
  static final CartService instance = CartService._();

  static const _prefsKey = 'papafila_pedido_atual';

  final Map<int, int> _quantidades = {}; // produtoId -> quantidade
  bool _loaded = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw != null && raw.isNotEmpty) {
        final map = json.decode(raw) as Map<String, dynamic>;
        _quantidades.clear();
        map.forEach((key, value) {
          _quantidades[int.parse(key)] = value as int;
        });
        notifyListeners();
      }
    } catch (_) {
      // Sem preferências salvas ainda, ou dado corrompido — começa vazio.
    }
  }

  Future<void> _persist() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final map = _quantidades.map((key, value) => MapEntry('$key', value));
      await prefs.setString(_prefsKey, json.encode(map));
    } catch (_) {
      // Persistência indisponível (ex: alguns navegadores em modo privado).
    }
  }

  Future<void> addItem(Produto produto) async {
    _quantidades.update(
      produto.id,
      (qtd) => qtd + 1,
      ifAbsent: () => 1,
    );
    notifyListeners();
    await _persist();
  }

  Future<void> removeOne(int produtoId) async {
    final atual = _quantidades[produtoId];
    if (atual == null) return;
    if (atual <= 1) {
      _quantidades.remove(produtoId);
    } else {
      _quantidades[produtoId] = atual - 1;
    }
    notifyListeners();
    await _persist();
  }

  Future<void> removerItem(int produtoId) async {
    _quantidades.remove(produtoId);
    notifyListeners();
    await _persist();
  }

  Future<void> limpar() async {
    _quantidades.clear();
    notifyListeners();
    await _persist();
  }

  /// Monta a lista de itens do pedido atual, cruzando as quantidades salvas
  /// com o cardápio carregado do JSON.
  Future<List<ItemPedido>> itensAtuais() async {
    await ensureLoaded();
    final cardapio = await ProdutoRepository.instance.carregarCardapio();
    final itens = <ItemPedido>[];
    for (final produto in cardapio) {
      final qtd = _quantidades[produto.id];
      if (qtd != null && qtd > 0) {
        itens.add(ItemPedido(produto: produto, quantidade: qtd));
      }
    }
    return itens;
  }

  int get totalItensSincrono => _quantidades.values.fold<int>(
        0,
        (soma, qtd) => soma + qtd,
      );

  Future<double> totalAtual() async {
    final itens = await itensAtuais();
    final double total = itens.fold<double>(
      0.0,
      (soma, item) => soma + item.subtotal,
    );
    return total;
  }
}
