import 'package:atomic_design/templates/atomic_login_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('AtomicTemplateLogin se renderiza correctamente', (WidgetTester tester) async {
    // Variables de prueba
    const icon = Icons.login;
    const title = 'Iniciar Sesión';
    const labels = ['Correo', 'Contraseña'];
    const buttonText = 'Ingresar';
    bool buttonPressed = false;

    // Construimos el widget dentro del entorno de pruebas
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtomicTemplateLogin(
            icon: icon,
            title: title,
            labels: labels,
            buttonText: buttonText,
            fieldsNumber: labels.length,
            iconSize: 40.0,
            fontWeightSubtitle: FontWeight.bold,
            onPressed: () {
              buttonPressed = true;
            },
            onFieldsFilled: (values) {},
          ),
        ),
      ),
    );

    // Verifica que el título y el icono estén en la pantalla
    expect(find.text(title), findsOneWidget);
    expect(find.byIcon(icon), findsOneWidget);

    // Verifica que los campos de entrada estén en la pantalla
    for (var label in labels) {
      expect(find.text(label), findsOneWidget);
    }
    // Ingresa datos válidos en los campos
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

// Simula un toque en el botón
    await tester.tap(find.text(buttonText));
    await tester.pumpAndSettle();

// Verifica que la función onPressed haya sido llamada
    expect(buttonPressed, isTrue);
  });
}
