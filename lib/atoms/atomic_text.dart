/// Un componente de texto personalizable siguiendo el Sistema de Diseño Atómico.
///
/// Este componente permite diferentes tamaños de texto, colores, pesos de fuente y alineaciones.
///
/// Uso:
/// ```dart
/// AtomicText(
///   text: "¡Hola, Mundo!",
///   size: TextSize.large,
///   color: Colors.blue,
///   fontWeight: FontWeight.bold,
///   textAlign: TextAlign.center,
/// )
/// ```
import 'package:flutter/material.dart';

/// Enum que representa los tamaños de texto disponibles.
enum TextSize { small, medium, large }

/// Un componente de texto reutilizable diseñado para mantener la coherencia en el sistema de diseño.
class AtomicText extends StatelessWidget {
  /// El contenido del texto a mostrar.
  final String text;

  /// El tamaño del texto, que afecta su estilo.
  /// Por defecto, usa [TextSize.medium].
  final TextSize size;

  /// El color del texto. Si no se proporciona, usa el color por defecto del tema.
  final Color? color;

  /// La alineación del texto.
  final TextAlign? textAlign;

  /// El peso de la fuente del texto.
  final FontWeight fontWeight;

  /// Crea una instancia de [AtomicText].
  const AtomicText({
    super.key,
    required this.text,
    this.size = TextSize.medium,
    this.color,
    required this.fontWeight,
    this.textAlign,
  });

  /// Devuelve el estilo de texto apropiado según el tamaño seleccionado.
  TextStyle _getTextStyle(BuildContext context) {
    switch (size) {
      case TextSize.small:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color,
          fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Stars'
        );
      case TextSize.large:
        return Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: color,
          fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Stars'
        );
      case TextSize.medium:
      default:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontSize: 18,
          fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Stars'
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context),
      textAlign: textAlign,
    );
  }
}
