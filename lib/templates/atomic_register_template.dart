/**
 * Plantilla de registro de usuario con formulario dinámico.
 *
 * Este componente muestra un formulario de registro con campos de entrada personalizables.
 * Se adapta a diferentes tamaños de pantalla y permite manejar el registro a través de un callback.
 */

import 'package:atomic_design/molecules/atomic_icon_with_text.dart';
import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/Atomic_form.dart';

/// Widget de plantilla para el registro de usuario.
///
/// Contiene un formulario con un número configurable de campos y un botón de envío.
/// Permite manejar el registro de usuarios a través de un callback.
class AtomicTemplateRegister extends StatelessWidget {
  /// Función que se ejecuta al enviar el formulario.
  ///
  /// Recibe un `Map<String, String>` con los valores ingresados en cada campo.
  final void Function(Map<String, String>) onRegister;

  /// Lista de etiquetas para los campos del formulario.
  final List<String> labels;

  /// Texto del botón de registro.
  final String buttonText;

  /// Color del texto.
  final Color? textColor;

  /// Color del botón.
  final Color? buttonColor;

  /// Color del texto del botón.
  final Color? buttonTextColor;

  /// Color del texto del botón.
  final Color? iconColor;

  /// tamaño del icono
  final double iconSize;

  /// Número de campos en el formulario.
  final int fieldsNumber;

  /// El color del texto del label.
  final Color? textLabelColor;

  /// El tamaño del texto, que afecta su estilo.
  /// Por defecto, usa [TextSize.medium].
  final TextSize? sizeOfLabelText;

  /// El peso de la fuente del texto.
  final FontWeight? fontWeightLabelText;

  /// Constructor de [AtomicTemplateRegister].
  ///
  /// - [onRegister]: Función que se ejecuta cuando se envía el formulario.
  /// - [labels]: Lista de nombres de los campos que aparecerán en el formulario.
  /// - [buttonText]: Texto del botón de envío.
  const AtomicTemplateRegister({
    super.key,
    required this.onRegister,
    required this.labels,
    required this.buttonText,
    this.textColor,
    this.buttonColor,
    this.buttonTextColor,
    required this.fieldsNumber,
    this.textLabelColor,
    this.sizeOfLabelText,
    this.fontWeightLabelText,
    this.iconColor,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 📌 Título centrado
            AtomicIconText(
              text: "Registro de Usuario",
              iconColor: iconColor ?? Colors.blue,
              textColor: textColor ?? Colors.black,
              size: iconSize,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),

            // 📌 Formulario dinámico
            AtomicForm(
              fieldCount: fieldsNumber,
              // Número de campos basado en la lista de etiquetas
              onSubmit: onRegister,
              // Callback que maneja el registro
              labels: labels,
              // Etiquetas de los campos
              buttonText: buttonText,
              // Texto del botón
              buttonColor: buttonColor,
              buttonTextColor: buttonTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
