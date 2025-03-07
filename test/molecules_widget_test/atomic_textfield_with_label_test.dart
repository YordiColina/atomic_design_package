import 'package:atomic_design/molecules/atomic_textfield_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renderiza el campo de texto con la etiqueta', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AtomicTextFormFieldWithLabel(label: 'Nombre'),
        ),
      ),
    );

    // Verificar que la etiqueta se muestra
    expect(find.text('Nombre'), findsOneWidget);

    // Verificar que hay un TextFormField en el widget
    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('El campo de texto oculta el texto cuando obscureText es true', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AtomicTextFormFieldWithLabel(label: 'Contraseña', obscureText: true),
        ),
      ),
    );

  

    // Verificar que obscureText está activado
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });

  testWidgets('El usuario puede ingresar texto en el campo', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomicTextFormFieldWithLabel(label: 'Nombre', controller: controller),
        ),
      ),
    );

    // Ingresar texto en el campo de texto
    await tester.enterText(find.byType(TextFormField), 'Yordis');

    // Verificar que el controlador contiene el texto ingresado
    expect(controller.text, 'Yordis');
  });
}
