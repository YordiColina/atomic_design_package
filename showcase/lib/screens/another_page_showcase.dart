import 'package:atomic_design/pages/atomic_loginpage.dart';
import 'package:flutter/material.dart';

/// `AnotherPageShowcase`
///
/// 📌 **Descripción**
/// Esta clase representa una pantalla de demostración de otra página del sistema de diseño atómico.
/// En este caso, se muestra una página de inicio de sesión (`AtomicLoginPage`).
///
/// 📌 **Componentes incluidos**
/// - `AtomicLoginPage`: Página que contiene un formulario de inicio de sesión.
///
/// 📌 **Estructura**
/// - Se usa un `Scaffold` con un `AppBar` personalizado.
/// - Se implementa un método `_handleLogin` que captura el correo y la contraseña del usuario.
/// - La función `_handleLogin` podría ser usada para conectarse a Firebase u otro backend.
class AnotherPageShowcase extends StatelessWidget {
  /// Constructor de `AnotherPageShowcase`
  const AnotherPageShowcase({super.key});

  /// 📌 Función para manejar el inicio de sesión
  ///
  /// Recibe el `email` y `password` ingresados por el usuario.
  /// Actualmente, solo imprime los valores en la consola.
  void _handleLogin(String email, String password) {
    print("Login con: Email: $email, Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 📌 Color de fondo de la página
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),

      /// 📌 AppBar personalizado
      appBar: AppBar(
        title: const Text("Páginas"),
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),

      /// 📌 Contenido principal: `AtomicLoginPage`
      ///
      /// Se pasa la función `_handleLogin` a la página de inicio de sesión.
      body: AtomicLoginPage(onLogin: _handleLogin),
    );
  }
}
