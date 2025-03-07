import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/atoms/Atomic_button.dart';

void main() {
  testWidgets('AtomicButton renderiza y responde a eventos', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AtomicButton(
          label: 'Presionar',
          onPressed: () => pressed = true,
        ),
      ),
    ));

    await tester.tap(find.byType(ElevatedButton)); // Tap en el botón
    await tester.pump(); // Re-render para capturar cambios

    expect(pressed, isTrue);
  });


  testWidgets('AtomicButton ejecuta onPressed cuando se toca', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomicButton(
            label: 'Presionar',
            onPressed: () => pressed = true,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(AtomicButton));
    await tester.pump();

    expect(pressed, isTrue);
  });

  testWidgets('AtomicButton usa el tamaño correcto', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AtomicButton(
          label: 'Haz clic',
          onPressed: () {},
          size: ButtonSize.small,
        ),
      ),
    ));

    // Buscar el RenderObject del botón
    final buttonFinder = find.byType(ElevatedButton);
    final RenderBox buttonBox = tester.renderObject(buttonFinder);

    // Obtener el tamaño del botón
    final Size buttonSize = buttonBox.size;

    debugPrint('Tamaño del botón en test: $buttonSize');

    // Validar los valores de padding indirectamente mediante el tamaño
    expect(buttonSize.height, greaterThan(16.0)); // Debe incluir el padding vertical
    expect(buttonSize.width, greaterThan(16.0));  // Debe incluir el padding horizontal
  });




  testWidgets('AtomicButton usa el color de fondo y texto correcto', (WidgetTester tester) async {
    const buttonColor = Colors.red;
    const textColor = Colors.yellow;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomicButton(
            label: 'Color Test',
            onPressed: () {},
            color: buttonColor,
            textColor: textColor,
          ),
        ),
      ),
    );

    final ElevatedButton button = tester.widget(find.byType(ElevatedButton));
    final Text textWidget = tester.widget(find.text('Color Test'));

    expect(button.style?.backgroundColor?.resolve({}) ?? Colors.transparent, buttonColor);
    expect(textWidget.style?.color ?? Colors.black, textColor);
  });
}
