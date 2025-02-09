/**
 * Una tarjeta de detalles que muestra información de un producto o artículo.
 *
 * Este widget muestra un diseño de tarjeta con título, imagen, descripción,
 * precio y categoría. Se puede utilizar en listas de productos o pantallas de detalles.
 */

import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';

/// Un widget de tarjeta que muestra detalles de un producto o artículo.
class AtomicDetailCard extends StatelessWidget {
  /// El título del producto o artículo.
  final String titulo;

  /// El precio del producto o artículo.
  final double precio;

  /// La URL de la imagen del producto o artículo.
  final String imageUrl;

  /// La categoría a la que pertenece el producto o artículo.
  final String categoria;

  /// La descripción del producto o artículo.
  final String descripcion;

  /// Crea una instancia de [AtomicDetailCard].
  const AtomicDetailCard({
    super.key,
    required this.titulo,
    required this.precio,
    required this.imageUrl,
    required this.categoria,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        child: Card(
          elevation: 4,
          color: const Color.fromRGBO(240, 240, 240, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color.fromRGBO(158, 123, 187, 1.0),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Agrega más espacio interno
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🏷️ Título del producto
                AtomicText(
                  text: titulo,
                  size: TextSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // 🖼️ Imagen del producto con bordes redondeados
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 📄 Descripción del producto
                AtomicText(
                  text: descripcion,
                  size: TextSize.small,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.end,
                  color: Colors.black54,
                ),
                const SizedBox(height: 12),

                // 💰 Precio y categoría alineados en la parte inferior
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Precio con color verde
                    AtomicText(
                      text: "\$${precio.toStringAsFixed(2)}",
                      size: TextSize.small,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      textAlign: TextAlign.left,
                    ),
                    // Categoría con color gris
                    AtomicText(
                      text: categoria,
                      size: TextSize.small,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                      textAlign: TextAlign.right,
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
