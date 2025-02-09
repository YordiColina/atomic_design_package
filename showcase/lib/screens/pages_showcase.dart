import 'package:atomic_design/pages/atomic_homepage.dart';
import 'package:flutter/material.dart';


class PagesShowcase extends StatelessWidget {
  PagesShowcase({super.key});
  final List<Map<String, dynamic>> items = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(title: const Text("Páginas"),
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),
      body: AtomicHomePage(items: items,),
    );
  }

}
