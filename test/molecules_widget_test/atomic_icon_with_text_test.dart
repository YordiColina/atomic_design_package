import 'package:atomic_design/molecules/atomic_icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('AtomicIconText muestra ícono y texto correctamente', (WidgetTester tester) async {
    const testText = 'Prueba';
    const testIcon = Icons.star;
    const testSize = 24.0;
    const testColor = Colors.green;
    const testTextColor = Colors.black;
    const testFontWeight = FontWeight.bold;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AtomicIconText(
            size: testSize,
            text: testText,
            icon: testIcon,
            iconColor: testColor,
            textColor: testTextColor,
            fontWeight: testFontWeight,
          ),
        ),
      ),
    );

    // Verificar que el icono existe y tiene el color correcto
    final iconFinder = find.byIcon(testIcon);
    expect(iconFinder, findsOneWidget);
    final iconWidget = tester.widget<Icon>(iconFinder);
    expect(iconWidget.color, testColor);
    expect(iconWidget.size, testSize);

    // Verificar que el texto se muestra correctamente
    final textFinder = find.text(testText);
    expect(textFinder, findsOneWidget);

    // Verificar que el texto tiene el estilo correcto
    final textWidget = tester.firstWidget<Text>(textFinder);
    expect(textWidget.style?.color, testTextColor);
    expect(textWidget.style?.fontWeight, testFontWeight);
  });
}
