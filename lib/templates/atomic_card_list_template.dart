import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/atomic_card.dart';


class AtomicTemplateCardList extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items; // Lista de datos

  const AtomicTemplateCardList({
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
      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
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
            // 📌 Título en la parte superior
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AtomicText(
                text: title,
                size: TextSize.medium,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),

            // 📌 Lista de Cards Responsive
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5, // Ajusta la altura
              child: isWideScreen
                  ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
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
            )

          ],
        ),
      ),
    );
  }
}
