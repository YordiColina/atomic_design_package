import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:atomic_design/templates/atomic_card_list_template.dart';
import 'package:atomic_design/templates/atomic_login_template.dart';
import 'package:atomic_design/templates/atomic_register_template.dart';
import 'package:flutter/material.dart';

/// `TemplatesShowcase`
///
/// 📌 **Descripción**
/// Esta clase representa una pantalla de demostración de **Plantillas** en el sistema de diseño atómico.
///
/// Las plantillas (`Templates`) son estructuras de alto nivel que combinan múltiples **Organismos**
/// para crear interfaces más completas y reutilizables.
///
/// 📌 **Componentes incluidos**
/// - `AtomicTemplateCardList`: Lista de tarjetas basada en una plantilla.
/// - `AtomicTemplateLogin`: Formulario de inicio de sesión basado en una plantilla.
/// - `AtomicTemplateRegister`: Formulario de registro basado en una plantilla.
///
/// 📌 **Estructura**
/// - Se usa un `ListView` para manejar el desplazamiento.
/// - Se dividen los bloques con `Divider` y `SizedBox` para mejorar la separación visual.
class TemplatesShowcase extends StatelessWidget {
  /// Constructor de `TemplatesShowcase`
  const TemplatesShowcase({super.key});

  @override
  Widget build(BuildContext context) {

    /// 📌 Lista de elementos para la plantilla `AtomicTemplateCardList`
    ///
    /// Cada elemento tiene un título, precio, imagen y categoría.
    final List<Map<String, dynamic>> items = [
      {
        "title": "Producto 1",
        "price": 25000.5,
        "image":
            "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "category": "Categoría A",
        'description': 'Descripcion del producto 1'
      },
      {
        "title": "Producto 2",
        "price": 35000.5,
        "image":
            "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "category": "Categoría B",
        'description': 'Descripcion del producto 2'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const AtomicText(
          text: "Plantillas",
          size: TextSize.large,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              /// 📌 Ejemplo de `AtomicTemplateCardList`
              ///
              /// Plantilla que muestra una lista de tarjetas con datos dinámicos.
              AtomicTemplateCardList(
                title: "Ejemplo de Plantilla de lista de cards",
                heightOfContainerList: MediaQuery.of(context).size.height * 0.5,
                items: items,
              ),

              const SizedBox(height: 20),
              const Divider(thickness: 2, color: Colors.black),

              /// 📌 Título para el formulario de inicio de sesión
              const AtomicText(
                text: "Ejemplo de Plantilla de Login",
                size: TextSize.medium,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),

              /// 📌 Ejemplo de `AtomicTemplateLogin`
              ///
              /// Formulario de inicio de sesión con función `onLogin`.
              AtomicTemplateLogin(
                onPressed: () {},
                buttonText: "Iniciar sesión",
                labels: ["Correo", "Contraseña"],
                icon: Icons.person,
                title: 'Inicio de sesión',
                fieldsNumber: 2,
                iconSize: 50,
                fontWeightSubtitle: FontWeight.bold, onFieldsFilled: (bool ) {
                  print(bool);
              },
              ),

              const SizedBox(height: 20),
              const Divider(thickness: 2, color: Colors.black),

              /// 📌 Título para el formulario de registro
              const AtomicText(
                text: "Ejemplo de Plantilla de registro",
                size: TextSize.medium,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),

              /// 📌 Ejemplo de `AtomicTemplateRegister`
              ///
              /// Formulario de registro dinámico con etiquetas personalizadas y botón de acción.
              AtomicTemplateRegister(
                onPressed: () {},
                onFieldsFilled: (bool) {
                  print(bool);
                },
                labels: const ["Nombre", "Email", "Contraseña"],
                buttonText: "Registrar",
                fieldsNumber: 3,
                iconSize: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
