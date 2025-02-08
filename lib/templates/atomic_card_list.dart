import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/atomic_card.dart';


class TemplateCardList extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items; // Lista de datos

  const TemplateCardList({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600; // Responsive para tablets

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 📌 Título en la parte superior
          AtomicText(
            text: title,
            size: TextSize.medium,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // 📌 Lista de Cards Responsive
          Expanded(
            child: isWideScreen
                ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Muestra 2 columnas en pantallas grandes
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4, // Ajusta la proporción de la tarjeta
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return AtomicCard(
                  titulo: item['titulo'],
                  precio: item['precio'],
                  imageUrl: item['imageUrl'],
                  categoria: item['categoria'],
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
                    titulo: item['titulo'],
                    precio: item['precio'],
                    imageUrl: item['imageUrl'],
                    categoria: item['categoria'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
