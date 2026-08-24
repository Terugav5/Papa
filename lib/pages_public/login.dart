import 'dart:math';
import 'package:flutter/material.dart';
import 'package:papa_fila/pages_public/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool obscure = true;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 180,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(painter: WavePainter(controller.value));
              },
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/icon.png', width: 200, height: 200),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                    'Mais Agilidade na hora da refeição',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: 70,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Digite sua matrícula',

                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0XFF2E7D32),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0XFF2E7D32)),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0XFF2E7D32)),
                        ),
                      ),

                      cursorColor: Color(0XFF2E7D32),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      obscureText: obscure,

                      decoration: InputDecoration(
                        hintText: 'Digite Sua Senha',

                        prefixIcon: Icon(Icons.lock, color: Color(0XFF2E7D32)),

                        suffixIcon: IconButton(
                          icon: Icon(
                            obscure ? Icons.visibility_off : Icons.visibility,
                            color: Color(0XFF2E7D32),
                          ),

                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0XFF2E7D32)),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0XFF2E7D32)),
                        ),
                      ),

                      cursorColor: Color(0XFF2E7D32),
                    ),
                  ),

                  SizedBox(height: 50),

                  SizedBox(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFF6B00),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },

                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animation;

  WavePainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    drawWave(
      canvas,
      size,
      color: Color(0XFFFF6B00),
      baseHeight: 80,
      amplitude: 15,
      speed: 1,
      offset: 0,
    );

    drawWave(
      canvas,
      size,
      color: Color(0XFFA5D6A7),
      baseHeight: 100,
      amplitude: 14,
      speed: 0.8,
      offset: 1.5,
    );

    drawWave(
      canvas,
      size,
      color: Color(0XFF2E7D32),
      baseHeight: 125,
      amplitude: 20,
      speed: 0.6,
      offset: 3,
    );
  }

  void drawWave(
    Canvas canvas,
    Size size, {
    required Color color,
    required double baseHeight,
    required double amplitude,
    required double speed,
    required double offset,
  }) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height);

    path.lineTo(0, baseHeight);

    for (double x = 0; x <= size.width; x++) {
      final normalizedX = x / size.width;

      final y =
          baseHeight +
          sin(normalizedX * 2 * pi + animation * 2 * pi * speed + offset) *
              amplitude;

      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
