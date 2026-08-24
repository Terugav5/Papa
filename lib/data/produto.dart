/// Representa um item do cardápio, carregado de assets/json/produtos.json.
class Produto {
  final int id;
  final String nome;
  final double preco;
  final String imagem;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.imagem,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as int,
      nome: json['nome'] as String,
      preco: (json['preco'] as num).toDouble(),
      imagem: json['imagem'] as String,
    );
  }
}
