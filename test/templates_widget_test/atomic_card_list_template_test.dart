import 'dart:io';

import 'package:atomic_design/templates/atomic_card_list_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (cert, host, port) => true;
  }
}

final List<Map<String, dynamic>> items = [
  {
    "title": "Producto 1",
    "price": 25000.5,
    "image":
    "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
    "category": "Categoría A",
    'description': 'Descripcion del producto 1'
  },
  {
    "title": "Producto 2",
    "price": 35000.5,
    "image":
    "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
    "category": "Categoría B",
    'description': 'Descripcion del producto 2'
  },
];

void main() {
  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  tearDownAll(() {
    HttpOverrides.global = null;
  });

  testWidgets("Renderiza correctamente las tarjetas en ListView o GridView", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AtomicTemplateCardList(title: 'Test', items: items),
    ));

    await tester.pumpAndSettle();
    expect(find.byType(ListView).evaluate().isNotEmpty || find.byType(GridView).evaluate().isNotEmpty, isTrue);
  });

}
