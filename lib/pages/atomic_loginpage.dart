/**
 * Página de inicio de sesión.
 *
 * Este widget muestra la pantalla de inicio de sesión utilizando el componente `AtomicTemplateLogin`.
 * Se encarga de recibir las credenciales ingresadas por el usuario y pasarlas a la función `onLogin`.
 */

import 'package:flutter/material.dart';
import '../templates/atomic_login_template.dart';

/// Página de inicio de sesión.
///
/// Este widget encapsula la plantilla de inicio de sesión [`AtomicTemplateLogin`]
/// dentro de un `Scaffold` para estructurar la pantalla.
///
/// ### Parámetros:
/// - [onLogin]: Función que se ejecuta cuando el usuario ingresa sus credenciales correctamente.
class AtomicLoginPage extends StatelessWidget {
  /// Callback que recibe el correo y la contraseña cuando el usuario inicia sesión.
  final void Function(String email, String password) onLogin;

  /// Constructor de [AtomicLoginPage].
  ///
  /// - [onLogin] es obligatorio y maneja la lógica de autenticación.
  const AtomicLoginPage({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AtomicTemplateLogin(
        onLogin: onLogin,
      ),
    );
  }
}
