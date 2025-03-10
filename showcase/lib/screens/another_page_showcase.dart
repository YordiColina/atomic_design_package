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
/// -esta compuesto de un scaffold con un AtomicLoginPage



class AnotherPageShowcase extends StatelessWidget {
  /// Constructor de `AnotherPageShowcase`
  const AnotherPageShowcase({super.key});

  void _handleRegister() {
    // Navigator.push;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 📌 Color de fondo de la página
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),

      appBar: AppBar(
        title: const Text("Páginas"),
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),

      /// 📌 Contenido principal: `AtomicLoginPage`
      ///
      /// Se pasa la función `_handleLogin` a la página de inicio de sesión.
      /// el título que va en la parte superior de la pantalla y en el centro
      /// los titulos [labels] de cada campo del formulario
      /// el texto del botón de la parte inferior al formulario
      /// el subtitulo que indica que pantalla es [register, login] acompañado de un icono
      /// y la cantidad de campos a usar en el formulario
      body: AtomicLoginPage(
        onPressed: () {},
        onFieldsFilled: (values){},
        icon: Icons.person,
        title: "Fake store",
        labels: ["Correo Electrónico", "Contraseña"],
        buttonText: 'Iniciar Sesión',
        fieldsNumber: 2,
        subTitle: 'Iniciar Sesión',
        iconSize: 50,
        fontWeight: FontWeight.bold,
        goToRegister: _handleRegister,
      ),
    );
  }
}
