/**
 * Plantilla de inicio de sesión con formulario y encabezado.
 *
 * Este componente muestra un formulario de inicio de sesión con campos de entrada para
 * el correo y la contraseña, además de un ícono y título en la parte superior.
 * Es adaptable a diferentes tamaños de pantalla.
 */

import 'package:flutter/material.dart';
import '../molecules/atomic_icon_with_text.dart';
import '../organism/Atomic_form.dart';

/// Widget de plantilla para el inicio de sesión.
///
/// Contiene un formulario con los campos necesarios y un botón de envío.
/// Permite manejar la autenticación a través de un callback.
class AtomicTemplateLogin extends StatefulWidget {
  /// Función que se ejecuta al enviar el formulario con el email y la contraseña.
  final void Function(String email, String password) onLogin;

  /// Constructor de [AtomicTemplateLogin].
  const AtomicTemplateLogin({super.key, required this.onLogin});

  @override
  _AtomicTemplateLoginState createState() => _AtomicTemplateLoginState();
}

class _AtomicTemplateLoginState extends State<AtomicTemplateLogin> {
  /// Clave global para la validación del formulario.
  final _formKey = GlobalKey<FormState>();

  /// Controlador para el campo de correo electrónico.
  final TextEditingController _emailController = TextEditingController();

  /// Controlador para el campo de contraseña.
  final TextEditingController _passwordController = TextEditingController();

  /// Envía el formulario si la validación es correcta.
  ///
  /// Verifica que los campos no estén vacíos y ejecuta la función `onLogin`
  /// proporcionada en el widget padre.
  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        widget.onLogin(email, password);
      } else {
        print("Error: correo o contraseña vacíos");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600; // Responsive para tablets

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 80 : 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 📌 Ícono con título centrado
            const AtomicIconText(
              size: IconTextSize.medium,
              text: "Bienvenido",
              icon: Icons.lock,
              iconColor: Colors.blueAccent,
              textColor: Colors.black,
            ),
            const SizedBox(height: 24),

            // 📌 Formulario de inicio de sesión
            AtomicForm(
              key: _formKey,
              fieldCount: 3,
              onSubmit: (values) {},
              buttonText: 'Iniciar sesión',
              labels: const ['Nombre', 'Contraseña', 'Correo'],
            ),
          ],
        ),
      ),
    );
  }
}
