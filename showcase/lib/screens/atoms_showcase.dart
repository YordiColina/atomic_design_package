/// # AtomsShowcase
///
/// Un widget que muestra ejemplos de átomos dentro del sistema de diseño Atomic Design.
///
/// ## Descripción
/// Este `StatelessWidget` sirve como una pantalla de demostración para visualizar
/// los componentes más básicos (átomos) del sistema de diseño, incluyendo:
/// - `AtomicText`: Diferentes tamaños y estilos de texto.
/// - `AtomicButton`: Un botón de ejemplo con una acción simple.
///
/// ## Uso
/// Se puede utilizar esta pantalla para probar la apariencia y el comportamiento
/// de los átomos en una aplicación Flutter basada en Atomic Design.
///
/// ```dart
/// MaterialApp(
///   home: AtomsShowcase(),
/// )
/// ```
///
import 'package:atomic_design/atoms/atomic_button.dart';
import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:flutter/material.dart';

class AtomsShowcase extends StatelessWidget {
  /// Constructor de `AtomsShowcase`
  const AtomsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Átomos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 📌 Ejemplo de texto pequeño
            const AtomicText(
              text: "Ejemplo de átomo Texto pequeño",
              size: TextSize.small,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // 📌 Ejemplo de texto mediano
            const AtomicText(
              text: "Ejemplo de átomo Texto mediano",
              size: TextSize.medium,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // 📌 Ejemplo de texto grande
            const AtomicText(
              text: "Ejemplo de átomo Texto grande",
              size: TextSize.large,
              color: Colors.black,
              fontWeight: FontWeight.w100,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // 📌 Ejemplo de botón
            AtomicButton(
              label: "Ejemplo de átomo Botón",
              onPressed: () {
                print("Botón presionado");
              },
            ),
          ],
        ),
      ),
    );
  }
}
