import 'package:flutter/material.dart';
import 'package:papa_fila/data/produto.dart';
import 'package:papa_fila/data/produto_repository.dart';
import 'package:papa_fila/pages_public/carrinho.dart';
import 'package:papa_fila/pages_public/pedidos.dart';
import 'package:papa_fila/pages_public/perfi.dart';
import 'package:papa_fila/services/cart_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Produto> _produtos = [];
  bool _loading = true;
  String _busca = '';

  @override
  void initState() {
    super.initState();
    CartService.instance.ensureLoaded();
    _carregarCardapio();
  }

  Future<void> _carregarCardapio() async {
    final produtos = await ProdutoRepository.instance.carregarCardapio();
    if (!mounted) return;
    setState(() {
      _produtos = produtos;
      _loading = false;
    });
  }

  Future<void> _adicionarAoPedido(Produto produto) async {
    await CartService.instance.addItem(produto);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Pedidos()),
    );
  }

  List<Produto> get _produtosFiltrados {
    if (_busca.trim().isEmpty) return _produtos;
    final termo = _busca.trim().toLowerCase();
    return _produtos.where((p) => p.nome.toLowerCase().contains(termo)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon.png', width: 100, height: 100),
                  const Text(
                    'Papa-',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0XFFFF6B00),
                    ),
                  ),
                  const Text(
                    'Fila',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0XFF2E7D32),
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (value) => setState(() => _busca = value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: SizedBox(
                    width: 50,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFFFF6B00),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: const Text('Buscar Lanches, Frutas, ...'),
                  enabledBorder: const OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 110,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFFFF6B00),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Todos', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lunch_dining, color: Color(0XFF2E7D32)),
                            Text('Lanches', style: TextStyle(color: Color(0XFF2E7D32))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_drink, color: Color(0XFF2E7D32)),
                            Text('Bebidas', style: TextStyle(color: Color(0XFF2E7D32))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _produtosFiltrados.isEmpty
                      ? const Center(child: Text('Nenhum item encontrado.'))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _produtosFiltrados.length,
                          itemBuilder: (context, index) {
                            final produto = _produtosFiltrados[index];
                            return _ProdutoCard(
                              produto: produto,
                              onAdicionar: () => _adicionarAoPedido(produto),
                            );
                          },
                        ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: const Column(
                        children: [
                          Icon(Icons.home, color: Color(0XFFFF6B00), size: 30),
                          Text(
                            'Home',
                            style: TextStyle(color: Color(0XFFFF6B00), fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Carrinho()),
                        );
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.grey, size: 30),
                          Text('Carrinho', style: TextStyle(color: Colors.grey, fontSize: 15)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Pedidos()),
                        );
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.book, color: Colors.grey, size: 30),
                          Text('Pedidos', style: TextStyle(color: Colors.grey, fontSize: 15)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Perfil()),
                        );
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.person, color: Colors.grey, size: 30),
                          Text('Perfil', style: TextStyle(color: Colors.grey, fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProdutoCard extends StatelessWidget {
  final Produto produto;
  final VoidCallback onAdicionar;

  const _ProdutoCard({required this.produto, required this.onAdicionar});

  String _formatarPreco(double preco) {
    return 'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              produto.imagem,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  width: 70,
                  height: 70,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                width: 70,
                height: 70,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produto.nome,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatarPreco(produto.preco),
                  style: const TextStyle(
                    color: Color(0XFF2E7D32),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0XFFFF6B00),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: onAdicionar,
            ),
          ),
        ],
      ),
    );
  }
}
