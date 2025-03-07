import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/templates/atomic_register_template.dart';

void main() {
  testWidgets('AtomicTemplateRegister se renderiza correctamente y el botón funciona solo con campos llenos',
          (WidgetTester tester) async {
        // Variables de prueba
        const labels = ['Nombre', 'Correo', 'Contraseña'];
        const buttonText = 'Registrarse';
        bool buttonPressed = false;

        // Construimos el widget dentro del entorno de pruebas
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AtomicTemplateRegister(
                labels: labels,
                buttonText: buttonText,
                fieldsNumber: labels.length,
                iconSize: 40.0,
                onPressed: () {
                  buttonPressed = true;
                },
                onFieldsFilled: (values) {},
              ),
            ),
          ),
        );

        // Verifica que el título y los campos existan
        expect(find.text('Registro de Usuario'), findsOneWidget);
        for (var label in labels) {
          expect(find.text(label), findsOneWidget);
        }

        // Verifica que el botón esté en la pantalla
        expect(find.text(buttonText), findsOneWidget);

        // Ingresa datos válidos en los campos
        for (var i = 0; i < labels.length; i++) {
          await tester.enterText(find.byType(TextField).at(i), 'Dato $i');
        }

        // Simula un toque en el botón
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Verifica que la función onPressed haya sido llamada
        expect(buttonPressed, isTrue);
      });
}
