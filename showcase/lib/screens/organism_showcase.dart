import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:atomic_design/organism/Atomic_form.dart';
import 'package:atomic_design/organism/atomic_card.dart';
import 'package:atomic_design/organism/atomic_detail_card.dart';
import 'package:flutter/material.dart';

/// `OrganismsShowcase`
///
/// 📌 **Descripción**
/// Esta clase representa una pantalla de demostración de componentes de tipo **Organismo**
/// dentro del sistema de diseño atómico.
///
/// Los organismos son componentes más complejos que combinan moléculas y átomos
/// para formar estructuras funcionales completas dentro de la UI.
///
/// 📌 **Componentes incluidos**
/// - `AtomicCard`: Una tarjeta con título, precio, imagen y categoría.
/// - `AtomicDetailCard`: Una tarjeta con más detalles, incluyendo descripción.
/// - `AtomicText`: Un texto de título para el formulario.
/// - `AtomicForm`: Un formulario dinámico con múltiples campos y botón de acción.
///
/// 📌 **Estructura**
/// - Se usa un `ListView` para manejar el desplazamiento.
/// - Se agrupan los elementos en una `Column`.
class OrganismsShowcase extends StatelessWidget {
  /// Constructor de `OrganismsShowcase`
  const OrganismsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Organismos")),
      body: ListView(
        children: [
          Column(
            children: [
              /// 📌 Ejemplo de `AtomicCard`
              ///
              /// Tarjeta simple con una imagen, título, precio y categoría.
              const AtomicCard(
                titulo: "Ejemplo de Card",
                precio: 9.99,
                imageUrl: "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
                categoria: "Demo",
              ),

              const SizedBox(height: 16),

              /// 📌 Ejemplo de `AtomicDetailCard`
              /// incluye imagen, título, precio, categoría y descripción.
              /// Tarjeta más detallada que incluye descripción del producto.
              const AtomicDetailCard(
                titulo: "Ejemplo detail card",
                precio: 8.35,
                imageUrl: "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
                categoria: "tech",
                descripcion: "Celular bonito, de última generación con 5G y 8GB de RAM",
              ),

              const SizedBox(height: 16),

              /// 📌 Título para el formulario
              ///
              /// Un texto que indica la sección del formulario.
              const AtomicText(
                text: "Ejemplo de formulario",
                size: TextSize.medium,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              /// 📌 Ejemplo de `AtomicForm`
              ///
              /// Formulario dinámico con cinco campos y un botón para crear una cuenta.
              AtomicForm(
                fieldCount: 5,
                buttonText: "Crear cuenta",
                labels: ["Nombre", "Apellido", "Edad", "Correo", "Dirección"],
                onFieldsFilled: (values) {
                  print(values);
                },
                onPressed: () {
                  print("exito");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
