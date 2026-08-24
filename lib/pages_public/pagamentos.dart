import 'package:flutter/material.dart';
import 'package:papa_fila/pages_public/home.dart';
import 'package:papa_fila/pages_public/seunumero.dart';
import 'package:papa_fila/services/cart_service.dart';

class Pagamentos extends StatefulWidget {
  const Pagamentos({super.key});

  @override
  State<Pagamentos> createState() => _PagamentosState();
}

class _PagamentosState extends State<Pagamentos> {
  String _formatarPreco(double preco) {
    return preco.toStringAsFixed(2).replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Color(0XFF2E7D32),
        title: Text('Pagamento Via Pix', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.verified_user, color: Colors.white),
                    Text('Pagamento', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Text('100% Seguro', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pix, color: Color(0xFF32BCAD), size: 70),
                        Image.asset('assets/pix.png', width: 70, height: 70),
                      ],
                    ),
                    Text(
                      'Escaneie O Codigo Qrcode',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,

                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                          ),

                          child: Image.asset('assets/qr.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 200, child: Divider(thickness: 2)),
                    SizedBox(
                      width: 290,

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'papa-fila@pagamentos.app',
                                style: TextStyle(color: Color(0XFF2E7D32)),
                              ),
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.copy,
                                      color: Color(0XFF2E7D32),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 130,

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lunch_dining, color: Color(0XFF2E7D32)),
                          SizedBox(width: 5),
                          Text(
                            'Resumo do Pedido',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              color: Color(0XFF2E7D32),
                              fontSize: 17,
                            ),
                          ),
                          const Spacer(),
                          FutureBuilder<double>(
                            future: CartService.instance.totalAtual(),
                            builder: (context, snapshot) {
                              final total = snapshot.data ?? 0.0;
                              return Text(
                                'R\$ ${_formatarPreco(total)}',
                                style: const TextStyle(
                                  color: Color(0XFF2E7D32),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFF32BCAD),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock),
                        SizedBox(width: 10),
                        Text('Após o Pagamento, Aguarde a Confirmação'),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF2E7D32),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Seunumero()),
                      );
                    },
                    child: Text(
                      'Pagar com o Cartão',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF2E7D32),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Seunumero()),
                      );
                    },
                    child: Text(
                      'Pagar em dinheiro',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
