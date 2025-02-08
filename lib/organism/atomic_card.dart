import 'package:flutter/material.dart';

import '../atoms/atomic_text.dart';
// Importa tu átomo de texto

class AtomicCard extends StatelessWidget {
  final String titulo;
  final double precio;
  final String imageUrl;
  final String categoria;

  const AtomicCard({
    super.key,
    required this.titulo,
    required this.precio,
    required this.imageUrl,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🏷️ Título
                AtomicText(
                  text: titulo,
                  size: TextSize.medium, // Usa el átomo de texto mediano
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // 🖼️ Imagen con diseño responsive
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // 💰 Precio y Categoría alineados en la parte inferior
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AtomicText(
                      text: "\$${precio.toStringAsFixed(2)}",
                      size: TextSize.small, // Usa el átomo de texto pequeño
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700], textAlign: TextAlign.left,
                    ),
                    AtomicText(
                      text: categoria,
                      size: TextSize.small, // Usa el átomo de texto pequeño
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700], textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
