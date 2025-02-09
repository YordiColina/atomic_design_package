import 'package:atomic_design/molecules/atomic_icon_with_text.dart';
import 'package:atomic_design/molecules/atomic_texfield_with_label.dart';
import 'package:flutter/material.dart';


class MoleculesShowcase extends StatelessWidget {
  const MoleculesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moléculas")),
      body: const Column(
        children: [
          Center(
            child: AtomicIconText(
              size: IconTextSize.medium,
              text: "Ejemplo de Molécula",
              icon: Icons.info,
              iconColor: Colors.blue,
              textColor: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Center(child: AtomicTextFormFieldWithLabel(label: "Ejemplo de molécula ",)),
        ],
      ),
    );
  }
}
