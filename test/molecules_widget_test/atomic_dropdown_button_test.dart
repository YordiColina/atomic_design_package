import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/molecules/atomic_dropdown_button.dart';

void main() {
  testWidgets('AtomicDropdownButton aplica estilos correctamente', (WidgetTester tester) async {
    const dropdownColor = Colors.blueGrey;
    const textStyle = TextStyle(color: Colors.red, fontSize: 16);
    const borderRadius = 12.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomicDropdownButton(
            items: ['Opción 1', 'Opción 2'],
            onChanged: (_) {},
            dropdownColor: dropdownColor,
            textStyle: textStyle,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );

    // Esperar a que los widgets se rendericen correctamente
    await tester.pumpAndSettle();

    // Verificar que el hint usa el estilo correcto
    final hintTextWidget = tester.widget<Text>(find.text('Selecciona una opción'));
    expect(hintTextWidget.style, textStyle);

    // Buscar el DropdownButtonFormField
    final dropdownFinder = find.byType(DropdownButtonFormField<String>);
    expect(dropdownFinder, findsOneWidget);

    // Obtener el widget y su decoración
    final dropdownWidget = tester.widget<DropdownButtonFormField<String>>(dropdownFinder);
    final decoration = dropdownWidget.decoration;

    // Verificar el borde redondeado
    expect(decoration.border, isA<OutlineInputBorder>());
    final outlineBorder = decoration.border as OutlineInputBorder;
    expect(outlineBorder.borderRadius, BorderRadius.circular(borderRadius));
  });
}
