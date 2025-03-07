import 'package:atomic_design/organism/Atomic_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/molecules/atomic_textfield_with_label.dart';


void main() {
  testWidgets('AtomicForm renders correctly and validates fields', (WidgetTester tester) async {
    final List<String> labels = ['Nombre', 'Correo', 'Contraseña'];
    final List<String> filledValues = [];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomicForm(
            fieldCount: labels.length,
            buttonText: 'Enviar',
            labels: labels,
            onPressed: () => filledValues.add('submitted'),
            onFieldsFilled: (values) {
              filledValues.clear(); // Asegura que la lista se reinicie
              filledValues.addAll(values);
            },
          ),
        ),
      ),
    );


    // Verifica que los campos de texto estén presentes
    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }



    // Verifica que el botón esté presente
    expect(find.text('Enviar'), findsOneWidget);

    // Intenta presionar el botón sin llenar los campos
    await tester.tap(find.text('Enviar'));
    await tester.pump();

    // Encuentra el formulario y ejecuta la validación antes de llenar los campos
    final form = tester.widget<Form>(find.byType(Form));
    final formKey = form.key as GlobalKey<FormState>;

    expect(formKey.currentState!.validate(), false);

    // Verifica que el formulario no se envió porque los campos están vacíos
    expect(filledValues.isEmpty, true);

    // Simula la escritura en los campos para disparar _checkFields
    for (int i = 0; i < labels.length; i++) {
      await tester.enterText(find.byType(AtomicTextFormFieldWithLabel).at(i), 'Texto de prueba');
    }
    await tester.pump(); // Dispara la reconstrucción del widget

// Verifica que la función onFieldsFilled fue llamada con los valores correctos
    expect(filledValues, containsAll(['Texto de prueba', 'Texto de prueba', 'Texto de prueba']));


    filledValues.clear(); // Limpiar antes de llenar los campos

    for (int i = 0; i < labels.length; i++) {
      await tester.enterText(find.byType(AtomicTextFormFieldWithLabel).at(i), 'Valor $i');
    }
    await tester.pump();

// Ahora verifica que se agregaron solo los 3 valores esperados
    expect(filledValues.length, labels.length); // Debe ser 3

 // Debe fallar si los campos están vacíos// Debe fallar la validación si los campos están vacíos

    // Presiona el botón de envío
    await tester.tap(find.text('Enviar'));
    await tester.pump();


    // Verifica que la función onPressed se ejecutó
    expect(filledValues.contains('submitted'), true);

    // Verifica que el campo de contraseña tenga obscureText activado
    final passwordField = find.byType(AtomicTextFormFieldWithLabel).at(2);
    expect((tester.widget(passwordField) as AtomicTextFormFieldWithLabel).obscureText, true);

  });


}
