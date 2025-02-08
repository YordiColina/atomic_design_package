import 'package:flutter/material.dart';
import '../templates/atomic_card_list.dart';
import '../molecules/atomic_icon_with_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 📌 Lista de datos simulados para los elementos de la card
    final List<Map<String, dynamic>> items = [
      {
        "titulo": "Producto 1",
        "precio": "\$20.00",
        "imageUrl": "https://via.placeholder.com/150",
        "categoria": "Categoría A",
      },
      {
        "titulo": "Producto 2",
        "precio": "\$35.00",
        "imageUrl": "https://via.placeholder.com/150",
        "categoria": "Categoría B",
      },
      {
        "titulo": "Producto 3",
        "precio": "\$50.00",
        "imageUrl": "https://via.placeholder.com/150",
        "categoria": "Categoría C",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // 📌 Título con icono
          const AtomicIconText(
            size: IconTextSize.medium,
            text: "Explora Nuestros Productos",
            icon: Icons.shopping_cart,
            color: Colors.blueAccent,
          ),

          const SizedBox(height: 16),

          // 📌 Lista de tarjetas con productos
          Expanded(
            child: TemplateCardList(
              title: "Ofertas Especiales",
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
