import 'package:flutter/material.dart';
import 'package:papa_fila/pages_public/carrinho.dart';
import 'package:papa_fila/pages_public/home.dart';
import 'package:papa_fila/pages_public/pedidos.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/icon.png', width: 100, height: 100),
                Text(
                  'Papa-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0XFFFF6B00),
                  ),
                ),
                Text(
                  'Fila',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0XFF2E7D32),
                  ),
                ),
                Spacer(),
                Icon(Icons.notification_add, color: Color(0XFFFF6B00)),
                SizedBox(width: 10),
              ],
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/avatar.png'),
              backgroundColor: Colors.transparent,
            ),
            Text(
              'Matheus Morais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              width: 190,
              height: 60,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFF2E7D32),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.app_registration, color: Colors.white),
                    Text(
                      ' Matricula: 12345678',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 252,
              width: 250,

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),

                child: Column(
                  children: [
                    SizedBox(
                      width: 250,

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.person, color: Color(0XFFFF6B00)),
                              Text(
                                '    Editar Perfil',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.lock, color: Color(0XFF2E7D32)),
                              Text(
                                '    Alterar Senha',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.lock, color: Color(0XFFFF6B00)),
                              Text(
                                '    Notificações',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.support_agent,
                                color: Color(0XFF2E7D32),
                              ),
                              Text(
                                '    Ajuda e Suporte',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,

                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.support_agent,
                                color: Color(0XFFFF6B00),
                              ),
                              Text(
                                '    Sair',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.home, color: Colors.grey, size: 30),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
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
                            MaterialPageRoute(builder: (context) => Carrinho()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.grey,
                              size: 30,
                            ),
                            Text(
                              'Carrinho',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
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
                            MaterialPageRoute(builder: (context) => Pedidos()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.book, color: Colors.grey, size: 30),
                            Text(
                              'Pedidos',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              color: Color(0XFFFF6B00),
                              size: 30,
                            ),
                            Text(
                              'Perfil',
                              style: TextStyle(
                                color: Color(0XFFFF6B00),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
