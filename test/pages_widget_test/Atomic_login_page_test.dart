import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomic_design/atomic_design.dart';


void main() {

  testWidgets('Prueba de AtomicLoginPage', (WidgetTester tester) async {
    // Variables para verificar si se llama a los callbacks
    bool loginPressed = false;
    List<String> filledFields = [];
    bool goToRegisterPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: AtomicLoginPage(
          icon: Icons.login,
          title: 'Iniciar Sesión',
          titleColor: Colors.black,
          labels: ['Correo electrónico', 'Contraseña'],
          buttonText: 'Iniciar sesión',
          buttonColor: Colors.blue,
          buttonTextColor: Colors.white,
          fieldsNumber: 2,
          subTitle: 'Ingresa tus credenciales',
          subTitleColor: Colors.grey,
          iconColor: Colors.blue,
          iconSize: 30.0,
          fontWeight: FontWeight.bold,
          textColorLabel: Colors.black,
          sizeOfLabelText: TextSize.medium,
          fontWeightOfLabelText: FontWeight.normal,
          onPressed: () => loginPressed = true,
          onFieldsFilled: (values) => filledFields = values,
          goToRegister: () => goToRegisterPressed = true,
        ),
      ),
    );

    // Verificar que el título y subtítulo existen
    expect(find.text('Iniciar Sesión'), findsOneWidget);
    expect(find.text('Ingresa tus credenciales'), findsOneWidget);

    // Ingresar credenciales en los campos de texto
    await tester.enterText(find.byType(TextField).at(0), 'correo@ejemplo.com');
    await tester.enterText(find.byType(TextField).at(1), '123456');
    await tester.pump();

    // Presionar el botón de iniciar sesión
    await tester.tap(find.text('Iniciar sesión'));
    await tester.pump();

    // Verificar que el callback de onPressed se ejecutó

    expect(loginPressed, isTrue);
    expect(filledFields, isNotEmpty);

    // Presionar el botón de crear cuenta
    await tester.tap(find.text('Crear cuenta'));
    await tester.pump();

    // Verificar que el callback de goToRegister se ejecutó
    expect(goToRegisterPressed, isTrue);
  });
}
