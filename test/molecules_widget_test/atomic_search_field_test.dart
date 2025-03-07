import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/molecules/atomic_search_field.dart';

void main() {
  group('AtomicSearchField Tests', () {
    testWidgets('Renderiza correctamente con valores por defecto', (WidgetTester tester) async {
      // Renderizar el widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AtomicSearchField(),
          ),
        ),
      );

      // Verificar que el TextField se muestra
      expect(find.byType(TextField), findsOneWidget);

      // Verificar que el ícono de búsqueda está presente
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('Captura cambios de texto correctamente', (WidgetTester tester) async {
      String capturedText = '';

      // Renderizar con una función de callback
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AtomicSearchField(
              onChanged: (text) {
                capturedText = text;
              },
            ),
          ),
        ),
      );

      // Simular escritura en el TextField
      await tester.enterText(find.byType(TextField), 'Flutter');

      // Esperar reconstrucción del widget
      await tester.pump();

      // Verificar que el texto ingresado se capturó correctamente
      expect(capturedText, 'Flutter');
    });

    testWidgets('Usa un TextEditingController externo correctamente', (WidgetTester tester) async {
      final controller = TextEditingController();

      // Renderizar con un controller externo
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AtomicSearchField(controller: controller),
          ),
        ),
      );

      // Simular escritura en el TextField
      await tester.enterText(find.byType(TextField), 'Prueba');

      // Verificar que el controlador tiene el texto correcto
      expect(controller.text, 'Prueba');
    });

    testWidgets('Aplica icono y colores personalizados', (WidgetTester tester) async {
      const customIcon = Icons.person;
      const customColor = Colors.red;

      // Renderizar con icono y colores personalizados
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AtomicSearchField(
              icon: customIcon,
              iconColor: customColor,
            ),
          ),
        ),
      );

      // Verificar que el icono correcto está presente
      expect(find.byIcon(customIcon), findsOneWidget);

      // Obtener el icono renderizado
      final Icon iconWidget = tester.widget(find.byIcon(customIcon));

      // Verificar que el color del ícono es el correcto
      expect(iconWidget.color, customColor);
    });
  });
}
