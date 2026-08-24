import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'produto.dart';

/// Carrega o cardápio de assets/json/produtos.json (formato: { "cantina": {
/// "nome": ..., "cardapio": [ ... ] } }) e mantém em cache na memória.
class ProdutoRepository {
  ProdutoRepository._();
  static final ProdutoRepository instance = ProdutoRepository._();

  List<Produto>? _cache;
  String nomeCantina = 'Cantina';

  Future<List<Produto>> carregarCardapio() async {
    if (_cache != null) return _cache!;

    final raw = await rootBundle.loadString('assets/json/produtos.json');
    final data = json.decode(raw) as Map<String, dynamic>;
    final cantina = data['cantina'] as Map<String, dynamic>;
    nomeCantina = cantina['nome'] as String? ?? 'Cantina';

    final cardapio = cantina['cardapio'] as List<dynamic>? ?? [];
    _cache = cardapio
        .whereType<Map<String, dynamic>>()
        .map(Produto.fromJson)
        .toList();
    return _cache!;
  }
}
