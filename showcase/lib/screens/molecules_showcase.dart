import 'package:atomic_design/molecules/atomic_icon_with_text.dart';
import 'package:atomic_design/molecules/atomic_textfield_with_label.dart';
import 'package:flutter/material.dart';

/// `MoleculesShowcase`
///
/// Esta clase representa una pantalla de demostración de componentes de tipo **Molécula**
/// dentro del sistema de diseño atómico.
///
/// 📌 **Descripción**
/// Muestra ejemplos de moléculas, que son componentes formados por átomos.
/// En este showcase se incluyen:
/// - `AtomicIconText`: Un icono con texto.
/// - `AtomicTextFormFieldWithLabel`: Un campo de texto con etiqueta.
///
/// 📌 **Uso**
/// Se utiliza para visualizar cómo se comportan las moléculas dentro de la aplicación.
///
/// 📌 **Estructura**
/// - Contiene una `AppBar` con el título "Moléculas".
/// - En el cuerpo (`body`), hay una `Column` con dos elementos centrales:
///   1. `AtomicIconText`
///   2. `AtomicTextFormFieldWithLabel`
class MoleculesShowcase extends StatelessWidget {
  /// Constructor de `MoleculesShowcase`
  const MoleculesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moléculas")),
      body: const Column(
        children: [
          /// 📌 Ejemplo de `AtomicIconText`
          ///
          /// Un icono de información acompañado de un texto descriptivo.
          Center(
            child: AtomicIconText(
              size: 25,
              fontWeight: FontWeight.w600,
              text: "Ejemplo de Molécula",
              icon: Icons.info,
              iconColor: Colors.blue,
              textColor: Colors.black,
            ),
          ),

          SizedBox(height: 20),

          /// 📌 Ejemplo de `AtomicTextFormFieldWithLabel`
          ///
          /// Un campo de texto con una etiqueta para mostrar su estilo dentro del diseño atómico.
          Center(
            child: AtomicTextFormFieldWithLabel(label: "Ejemplo de molécula"),
          ),
        ],
      ),
    );
  }
}
