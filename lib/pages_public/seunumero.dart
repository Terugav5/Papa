import 'package:flutter/material.dart';
import 'package:papa_fila/pages_public/pagamentos.dart';

class Seunumero extends StatefulWidget {
  const Seunumero({super.key});

  @override
  State<Seunumero> createState() => _SeunumeroState();
}

class _SeunumeroState extends State<Seunumero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pagamentos()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            Text(
              'Sua Senha é',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              width: 250,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0XFFFF6B00), width: 2),
                ),

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Senha:',
                        style: TextStyle(
                          color: Color(0XFFFF6B00),
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '42',
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,

              child: Divider(thickness: 2, color: Colors.black),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 250,

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFFFF6B00), width: 2),
                ),
                child: Image.asset('assets/qrpegar.png'),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.monitor),
                Text('    Aguarde seu numero no painel'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
