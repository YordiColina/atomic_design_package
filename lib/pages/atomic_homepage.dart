import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../templates/atomic_card_list_template.dart';
import '../molecules/atomic_icon_with_text.dart';

class AtomicHomePage extends StatelessWidget {
  final dynamic items;
  const AtomicHomePage({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dataItems = [
      {
        "titulo": "Producto 1",
        "precio": 20.00,
        "imageUrl": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "categoria": "Categoría A",
      },
      {
        "titulo": "Producto 2",
        "precio": 35.00,
        "imageUrl": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "categoria": "Categoría B",
      },
      {
        "titulo": "Producto 3",
        "precio": 50.00,
        "imageUrl": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "categoria": "Categoría C",
      },
    ];

    // 📌 Lista de datos simulados para los elementos de la card


    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: const AtomicText(text:"Inicio",size:  TextSize.large,
          fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // 📌 Título con icono
          const AtomicIconText(
            size: IconTextSize.medium,
            text: "Explora Nuestros Productos",
            icon: Icons.shopping_cart,
            iconColor: Colors.blueAccent,
            textColor: Colors.black,
          ),

          const SizedBox(height: 16),

          // 📌 Lista de tarjetas con productos
          Expanded(
            child: AtomicTemplateCardList(
              title: "Ofertas Especiales",
              items: items ?? dataItems,
            ),
          ),
        ],
      ),
    );
  }
}
