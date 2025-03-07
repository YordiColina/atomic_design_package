import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/atoms/atomic_text.dart';

void main() {
  testWidgets('AtomicText muestra el texto correctamente', (WidgetTester tester) async {
    const testText = '¡Hola, Mundo!';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AtomicText(
            text: testText,
            size: TextSize.medium,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    // Busca el widget de texto
    final textFinder = find.text(testText);
    expect(textFinder, findsOneWidget);

    final textWidget = tester.widget<Text>(textFinder);

    // Verifica que el estilo del texto tenga el color y el peso esperados
    expect(textWidget.style?.color, Colors.red);
    expect(textWidget.style?.fontWeight, FontWeight.bold);
    expect(textWidget.style?.fontSize, 18); // Tamaño de fuente para `TextSize.medium`
    expect(textWidget.textAlign, TextAlign.center);
  });

  testWidgets('AtomicText usa los estilos correctos según el tamaño', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Column(
          children: [
            AtomicText(text: 'Texto Pequeño', size: TextSize.small, fontWeight: FontWeight.normal),
            AtomicText(text: 'Texto Mediano', size: TextSize.medium, fontWeight: FontWeight.normal),
            AtomicText(text: 'Texto Grande', size: TextSize.large, fontWeight: FontWeight.normal),
          ],
        ),
      ),
    );

    final smallText = tester.widget<Text>(find.text('Texto Pequeño'));
    final mediumText = tester.widget<Text>(find.text('Texto Mediano'));
    final largeText = tester.widget<Text>(find.text('Texto Grande'));

    expect(smallText.style?.fontSize, isNotNull);
    expect(mediumText.style?.fontSize, 18); // Medium usa 18 explícitamente
    expect(largeText.style?.fontSize, isNotNull);
  });
}
