import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';

/// Un componente de tarjeta reutilizable que muestra un título, imagen,
/// precio y categoría.
///
/// Este componente utiliza `AtomicText` para la tipografía y recibe los datos
/// como parámetros.
class AtomicCard extends StatelessWidget {
  /// Título de la tarjeta.
  final String titulo;

  /// Precio del producto o servicio.
  final double precio;

  /// URL de la imagen a mostrar en la tarjeta.
  final String imageUrl;

  /// Categoría del producto o servicio.
  final String categoria;

  /// color de la card
  final Color? cardColor;

  /// Constructor de `AtomicCard`.
  const AtomicCard({
    super.key,
    required this.titulo,
    required this.precio,
    required this.imageUrl,
    required this.categoria, this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 310,
        child: Card(
          elevation: 3,
          color: cardColor ?? const Color.fromRGBO(240, 240, 240, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color.fromRGBO(158, 123, 187, 1.0),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// 🏷️ Título
                AtomicText(
                  text: titulo,
                  size: TextSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                /// 🖼️ Imagen con diseño responsive
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: 200,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                /// 💰 Precio y Categoría alineados en la parte inferior
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AtomicText(
                      text: "\$${precio.toStringAsFixed(2)}",
                      size: TextSize.small,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      textAlign: TextAlign.left,
                    ),
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
