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
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 300,
          child: Card(
            elevation: 3,
            color: const Color.fromRGBO(240, 240, 240, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color.fromRGBO(158, 123, 187, 1.0), width: 0.5),
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
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 200,
                        fit: BoxFit.cover,
                        height: 200,
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
          ),
      ),
    );
  }
}
