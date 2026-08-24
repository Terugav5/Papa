// Teste básico: garante que o app inicializa sem travar (mostra a Splash).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:papa_fila/main.dart';

void main() {
  testWidgets('App inicializa e mostra a splash', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Papa-'), findsOneWidget);
    expect(find.text('Fila'), findsOneWidget);
  });
}
