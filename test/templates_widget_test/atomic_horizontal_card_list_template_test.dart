import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:atomic_design/organism/atomic_detail_card.dart';
import 'package:atomic_design/templates/Atomic_horizontal_card_list_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AtomicHorizontalCardListTemplate Widget Test', () {
    final List<Map<String, dynamic>> testItems = [
      {
        'title': 'Item 1',
        'price': 10.0,
        'image': 'https://picsum.photos/150/150',
        'category': 'Category 1',
        'description': 'Description 1',
      },
      {
        'title': 'Item 2',
        'price': 20.0,
        'image': 'https://picsum.photos/150/150',
        'category': 'Category 2',
        'description': 'Description 2',
      },
    ];

    testWidgets('Renderiza el título correctamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: AtomicHorizontalCardListTemplate(
          title: 'Test Title',
          items: testItems.map((item) {
            item['image'] = ''; // Evita la carga de imágenes en pruebas.
            return item;
          }).toList(),
        ),
      ));


      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('Renderiza correctamente las tarjetas en ListView horizontal',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: AtomicHorizontalCardListTemplate(
          title: 'Test Title',
          items: testItems.map((item) {
            item['image'] = ''; // Evita la carga de imágenes en pruebas.
            return item;
          }).toList(),
        ),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(AtomicDetailCard), findsNWidgets(testItems.length));
    });

    testWidgets('Ejecuta la función onTap correctamente',
        (WidgetTester tester) async {
      bool tapped = false;
      void onTapFunction() {
        tapped = true;
      }

      final List<Map<String, dynamic>> itemsWithOnTap = [
        {
          'title': 'Item 1',
          'price': 10.0,
          'image': 'https://picsum.photos/150/150',
          'category': 'Category 1',
          'description': 'Description 1',
          'onTapFunction': onTapFunction,
        },
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AtomicHorizontalCardListTemplate(
            title: 'Test Title',
            items: itemsWithOnTap,
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
