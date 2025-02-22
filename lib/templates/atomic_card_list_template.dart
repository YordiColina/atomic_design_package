/**
 * Componente de plantilla para mostrar una lista de tarjetas (cards).
 *
 * Este widget genera una lista de tarjetas en un diseño adaptable, utilizando
 * un GridView en pantallas anchas (como tablets) y un ListView en pantallas más pequeñas.
 */

import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/atomic_card.dart';

/// Un contenedor con un título y una lista de tarjetas dinámicas.
///
/// Dependiendo del ancho de la pantalla, las tarjetas se organizan en una cuadrícula
/// (para dispositivos grandes) o en una lista vertical (para móviles).
class AtomicTemplateCardList extends StatelessWidget {
  /// Título que se mostrará en la parte superior del componente.
  final String title;

  /// Lista de elementos que se representarán como tarjetas.
  ///
  /// Cada elemento debe ser un `Map<String, dynamic>` con las siguientes claves:
  /// - `'titulo'`: El título de la tarjeta.
  /// - `'precio'`: El precio asociado al elemento.
  /// - `'imageUrl'`: URL de la imagen que se mostrará en la tarjeta.
  /// - `'categoria'`: La categoría del elemento.
  final dynamic items;

  /// color de fondo de la lista de items
  final Color? backgroundListColor;

  /// tamaño del titulo
  final TextSize? textSize;

  /// color del título
  final Color? titleColor;

  /// altura de la lista de items
  final double? containerListHeight;

  /// peso del titulo
  final FontWeight? fontWeight;

  /// Constructor de [AtomicTemplateCardList].
  const AtomicTemplateCardList({
    super.key,
    required this.title,
    required this.items,
    this.backgroundListColor,
    this.textSize,
    this.titleColor,
    this.fontWeight,
    this.containerListHeight,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen =
        screenWidth > 600; // Detecta si es una pantalla ancha (ej. tablets)

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundListColor ?? Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 📌 Título del componente
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AtomicText(
                text: title,
                size: textSize ?? TextSize.medium,
                fontWeight: fontWeight ?? FontWeight.bold,
                textAlign: TextAlign.center,
                color: titleColor ?? Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // 📌 Lista de tarjetas, adaptada a distintos tamaños de pantalla
            SizedBox(
              height: containerListHeight ?? MediaQuery.of(context).size.height *
                  0.5, // Define la altura del contenedor
              child: isWideScreen
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Dos columnas en pantallas grandes
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3 / 4, // Proporción de la tarjeta
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return AtomicCard(
                          titulo: item['title'],
                          precio: item['price'],
                          imageUrl: item['image'],
                          categoria: item['category'],
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AtomicCard(
                            titulo: item['title'],
                            precio: item['price'],
                            imageUrl: item['image'],
                            categoria: item['category'],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
