/// 📦 Librería de Diseño Atómico para Flutter.
///
/// Este paquete organiza los componentes siguiendo la metodología de Atomic Design,
/// estructurando los elementos en Átomos, Moléculas, Organismos, Plantillas y Páginas.
///
/// Importa esta librería en tu proyecto con:
/// ```dart
/// import 'package:atomic_design/atomic_design.dart';
/// ```
library atomic_design;

// 📌 1️⃣ Átomos: Componentes básicos e independientes.
export '../atoms/atomic_text.dart';     // Componente de texto reutilizable.
export '../atoms/atomic_button.dart';   // Botón estilizado atómico.


// 📌 2️⃣ Moléculas: Combinación de átomos que generan pequeñas unidades funcionales.
export '../molecules/atomic_icon_with_text.dart'; // Ícono con texto.
export '../molecules/atomic_textfield_with_label.dart';    // Campo de entrada estilizado.

// 📌 3️⃣ Organismos: Componentes más complejos formados por moléculas y átomos.
export '../organism/atomic_form.dart';  // Formulario reutilizable con validación.
export '../organism/atomic_card.dart';  // Tarjeta con información estructurada.

// 📌 4️⃣ Plantillas: Estructuras de diseño que reutilizan organismos.
export '../templates/atomic_login_template.dart';    // Plantilla para la pantalla de inicio de sesión.
export '../templates/atomic_register_template.dart'; // Plantilla para la pantalla de registro.
export '../templates/atomic_card_list_template.dart'; // Plantilla para mostrar listas de tarjetas.

// 📌 5️⃣ Páginas: Pantallas completas listas para usarse en la aplicación.
export '../pages/atomic_homepage.dart';    // Página de inicio con listado de productos.
export '../pages/atomic_loginpage.dart';   // Página de inicio de sesión con funcionalidad.

