import 'package:flutter/material.dart';

import '../atoms/atomic_text.dart';

class DetailCardProducto extends StatelessWidget {
  final String titulo;
  final double precio;
  final String imageUrl;
  final String categoria;
  final String descripcion; // Nueva propiedad para la descripción

  const DetailCardProducto({
    super.key,
    required this.titulo,
    required this.precio,
    required this.imageUrl,
    required this.categoria,
    required this.descripcion, // Se requiere la descripción
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Más padding para mayor tamaño
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🏷️ Título
            AtomicText(
              text: titulo,
              size: TextSize.medium,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

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
            const SizedBox(height: 12),

            // 📄 Descripción en el centro debajo de la imagen
            AtomicText(
              text: descripcion,
              size: TextSize.small, // Usa el átomo de texto pequeño
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.end,
              color: Colors.black54,
            ),
            const SizedBox(height: 12),

            // 💰 Precio y Categoría alineados en la parte inferior
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AtomicText(
                  text: "\$${precio.toStringAsFixed(2)}",
                  size: TextSize.small,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700], textAlign: TextAlign.left,
                ),
                AtomicText(
                  text: categoria,
                  size: TextSize.small,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700], textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}