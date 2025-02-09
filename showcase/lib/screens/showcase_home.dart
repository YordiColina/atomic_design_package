import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:flutter/material.dart';
import 'package:showcase/screens/another_page_showcase.dart';
import 'atoms_showcase.dart';
import 'molecules_showcase.dart';
import 'organism_showcase.dart';
import 'templates_showcase.dart';
import 'pages_showcase.dart';

/// `ShowcaseHome`
///
/// 📌 **Descripción**
/// Página principal del sistema de diseño atómico.
/// Proporciona acceso a las diferentes categorías del sistema de diseño.
///
/// 📌 **Componentes incluidos**
/// - `AtomicText`: Texto estilizado que da la bienvenida al sistema.
/// - `ShowcaseButton`: Botones que navegan a las diferentes secciones del sistema.
///
/// 📌 **Secciones disponibles**
/// - Átomos
/// - Moléculas
/// - Organismos
/// - Plantillas
/// - Páginas
/// - Más páginas
class ShowcaseHome extends StatelessWidget {
  /// Constructor de `ShowcaseHome`
  const ShowcaseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 📌 Barra de aplicación con título
      appBar: AppBar(title: const Text("Design System Showcase")),

      /// 📌 Cuerpo de la pantalla con lista de secciones
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// 📌 Mensajes de bienvenida
          const Center(
            child: AtomicText(
              text: "Bienvenidos al Atomic Design",
              size: TextSize.large,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              color: Colors.black,
            ),
          ),
          const Center(
            child: AtomicText(
              text: "System",
              size: TextSize.large,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              color: Colors.black,
            ),
          ),

          /// 📌 Botones para navegar a cada sección del diseño atómico
          const ShowcaseButton(title: "Átomos", page: AtomsShowcase()),
          const ShowcaseButton(title: "Moléculas", page: MoleculesShowcase()),
          const ShowcaseButton(title: "Organismos", page: OrganismsShowcase()),
          const ShowcaseButton(title: "Plantillas", page: TemplatesShowcase()),
          ShowcaseButton(title: "Páginas", page: PagesShowcase()),
          const ShowcaseButton(title: "Más páginas", page: AnotherPageShowcase()),
        ],
      ),
    );
  }
}

/// `ShowcaseButton`
///
/// 📌 **Descripción**
/// Botón reutilizable para navegar entre secciones del sistema de diseño.
///
/// 📌 **Propiedades**
/// - `title`: Título del botón.
/// - `page`: Página de destino.
///
/// 📌 **Funcionamiento**
/// - Al presionar el botón, navega a la página correspondiente usando `Navigator.push`.
class ShowcaseButton extends StatelessWidget {
  /// 📌 Título del botón
  final String title;

  /// 📌 Página a la que se navegará al presionar el botón
  final Widget page;

  /// Constructor de `ShowcaseButton`
  const ShowcaseButton({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        /// 📌 Estilo del botón con padding adicional
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
        ),

        /// 📌 Acción del botón: Navegar a la nueva página
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),

        /// 📌 Texto del botón
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
