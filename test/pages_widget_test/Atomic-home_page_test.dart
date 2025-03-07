import 'package:atomic_design/pages/atomic_homepage.dart';
import 'package:atomic_design/templates/atomic_card_list_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  final List<Map<String, dynamic>> mockItems = [
    {
      "title": "Producto Test",
      "price": 99.99,
      "image": "https://example.com/image.jpg",
      "category": "Test Category",
      "description": "a good product"
    }
  ];
  testWidgets('AtomicHomePage renders correctly', (WidgetTester tester) async {
    // Construye el widget
    await tester.pumpWidget(
      MaterialApp(
        home: AtomicHomePage(items: mockItems,),
      ),
    );

    // Verifica que el título "Inicio" aparece en la AppBar
    expect(find.text("Inicio"), findsOneWidget);

    // Verifica que el texto "Explora Nuestros Productos" está presente
    expect(find.text("Explora Nuestros Productos"), findsOneWidget);

    // Verifica que la lista de productos se muestra correctamente
    expect(find.byType(AtomicTemplateCardList), findsOneWidget);
  });

  testWidgets('AtomicHomePage renders with provided items', (WidgetTester tester) async {


    await tester.pumpWidget(
      MaterialApp(
        home: AtomicHomePage(items: mockItems),
      ),
    );

    // Verifica que el título "Inicio" está presente
    expect(find.text("Inicio"), findsOneWidget);

    // Verifica que el producto de prueba está en la lista
    expect(find.text("Producto Test"), findsOneWidget);
  });
}
