import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';

/// Un componente reutilizable que muestra un ícono con una etiqueta de texto.
class AtomicIconText extends StatelessWidget {
  /// El tamaño del ícono.
  final double size;

  /// Tamaño del texto.
  final TextSize? textSize;

  /// El texto a mostrar debajo del ícono.
  final String text;

  /// El ícono que se mostrará. Si no se proporciona, se usa un ícono por defecto.
  final IconData icon;

  /// El color del ícono.
  final Color iconColor;

  /// El color del texto.
  final Color textColor;

  /// El peso de la fuente del texto.
  final FontWeight fontWeight;

  /// Crea una instancia de [AtomicIconText].
  const AtomicIconText({
    super.key,
    required this.size,
    required this.text,
    this.icon = Icons.help_outline, // Valor por defecto
    required this.iconColor,
    required this.textColor,
    this.textSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: size,
          color: iconColor,
        ),
        const SizedBox(height: 4),
        AtomicText(
          text: text,
          size: textSize ?? TextSize.medium,
          fontWeight: fontWeight,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
