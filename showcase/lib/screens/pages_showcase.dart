import 'package:atomic_design/pages/atomic_homepage.dart';
import 'package:flutter/material.dart';

/// `PagesShowcase`
///
/// 📌 **Descripción**
/// Esta clase representa una pantalla de demostración de **Páginas** en el sistema de diseño atómico.
///
/// Las **Páginas** (`Pages`) son el nivel más alto en la jerarquía de Atomic Design,
/// ya que combinan **Templates**, **Organismos**, **Moléculas** y **Átomos**
/// para formar una experiencia completa.
///
/// 📌 **Componentes incluidos**
/// - `AtomicHomePage`: Página que muestra una lista de productos.
///
/// 📌 **Estructura**
/// - Se usa un `Scaffold` con un `AppBar` personalizado.
/// - Se inyectan datos de productos a `AtomicHomePage` para su renderización.
class PagesShowcase extends StatelessWidget {
  /// Constructor de `PagesShowcase`
  PagesShowcase({super.key});

  /// 📌 Lista de productos para mostrar en `AtomicHomePage`
  ///
  /// Cada producto incluye un título, precio, imagen y categoría.
  final List<Map<String, dynamic>> items = [
    {
      "title": "Producto 1",
      "price": 20.00,
      "image": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
      "category": "Categoría A",
      "description": "Descripción del producto 1",
    },
    {
      "title": "Producto 2",
      "price": 35.00,
      "image": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
      "category": "Categoría B",
      "description": "Descripción del producto 2",
    },
    {
      "title": "Producto 3",
      "price": 50.00,
      "image": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
      "category": "Categoría C",
      "description": "Descripción del producto 3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 📌 Color de fondo de la página
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),


      appBar: AppBar(
        title: const Text("Páginas"),
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),

      /// 📌 Contenido principal: `AtomicHomePage`
      ///
      /// Se pasa la lista de productos a la página.
      body: AtomicHomePage(items: items),
    );
  }
}
