import 'package:atomic_design/atoms/Atomic_button.dart';
import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:atomic_design/molecules/atomic_icon_with_text.dart';
import 'package:flutter/material.dart';

class AtomsShowcase extends StatelessWidget {
  const AtomsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Átomos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AtomicText(
              text: "Ejemplo de atomo Texto pequeño",
              size: TextSize.small,
              color: Colors.black, fontWeight: FontWeight.normal, textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const AtomicText(
              text: "Ejemplo de atomo Texto mediano",
              size: TextSize.medium,
              color: Colors.black, fontWeight: FontWeight.bold, textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const AtomicText(
              text: "Ejemplo de atomo Texto grande",
              size: TextSize.large,
              color: Colors.black, fontWeight: FontWeight.w100, textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),



            AtomicButton(label: "ejemplo de atomo botón", onPressed: () { print("Botón presionado"); }),

          ],
        ),
      ),
    );
  }
}
