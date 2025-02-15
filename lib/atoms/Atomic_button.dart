/// Un componente de botón personalizable siguiendo el Sistema de Diseño Atómico.
///
/// Este botón permite diferentes tamaños y garantiza coherencia en toda la aplicación.
///
/// Uso:
/// ```dart
/// AtomicButton(
///   label: "Haz clic",
///   onPressed: () => print("Botón presionado"),
///   size: ButtonSize.large,
/// )
/// ```
import 'package:flutter/material.dart';

/// Enum que representa los tamaños disponibles para el botón.
enum ButtonSize { small, medium, large }

/// Un componente de botón reutilizable diseñado para mantener la coherencia en el sistema de diseño.
class AtomicButton extends StatelessWidget {
  /// El texto que se muestra en el botón.
  final String label;

  /// La función de callback que se ejecuta cuando se presiona el botón.
  final VoidCallback onPressed;

  /// El tamaño del botón, que afecta el padding y el tamaño de fuente.
  /// Por defecto, usa [ButtonSize.medium].
  final ButtonSize size;
  /// El color del botón.
  final Color? color;
/// El color del texto del botón
  final Color? textColor;

  /// Crea una instancia de [AtomicButton].
  const AtomicButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = ButtonSize.medium, this.color, this.textColor,
  });

  /// Devuelve el valor de padding basado en el tamaño del botón.
  double _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return 8.0;
      case ButtonSize.large:
        return 16.0;
      case ButtonSize.medium:
      default:
        return 12.0;
    }
  }

  /// Devuelve el tamaño de fuente basado en el tamaño del botón.
  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 12.0;
      case ButtonSize.large:
        return 18.0;
      case ButtonSize.medium:
      default:
        return 14.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: _getPadding(),
          horizontal: _getPadding() * 2,
        ),
        textStyle: TextStyle(fontSize: _getFontSize()),
        backgroundColor: color ?? const Color.fromRGBO(158, 123, 187, 1.0),
      ),
      child: Text(label, style: TextStyle(color: textColor ?? Colors.white)),
    );
  }
}
