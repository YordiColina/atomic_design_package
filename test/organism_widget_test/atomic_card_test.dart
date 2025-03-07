import 'package:atomic_design/organism/atomic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides(); // 🔥 Evita errores de carga de imagen
  });

  testWidgets('AtomicCard muestra los datos correctamente', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AtomicCard(
              titulo: 'Producto de prueba',
              precio: 99.99,
              imageUrl: 'https://via.placeholder.com/150',
              categoria: 'Categoría de prueba',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle(); // 🔥 Espera a que terminen los procesos asincrónicos
    });

    expect(find.text('Producto de prueba'), findsOneWidget);
    expect(find.text('\$99.99'), findsOneWidget);
  });
}
