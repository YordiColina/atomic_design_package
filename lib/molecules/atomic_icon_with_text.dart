/// Un componente personalizable de icono con texto siguiendo el Sistema de Diseño Atómico.
///
/// Este componente permite establecer un ícono junto con una etiqueta de texto, definiendo tamaños y colores.
///
/// Uso:
/// ```dart
/// AtomicIconText(
///   size: IconTextSize.medium,
///   text: "Carrito",
///   icon: Icons.shopping_cart,
///   iconColor: Colors.blue,
///   textColor: Colors.black,
/// )
/// ```
import 'package:flutter/material.dart';

/// Enum que representa los tamaños disponibles para el ícono y el texto.
enum IconTextSize { small, medium }

/// Un componente reutilizable que muestra un ícono con una etiqueta de texto.
class AtomicIconText extends StatelessWidget {
  /// El tamaño del par icono-texto, afectando ambos elementos.
  final IconTextSize size;

  /// El texto a mostrar debajo del ícono.
  final String text;

  /// El ícono que se mostrará. Si no se proporciona, se usa un ícono por defecto.
  final IconData? icon;

  /// El color del ícono.
  final Color iconColor;

  /// El color del texto.
  final Color textColor;

  /// Crea una instancia de [AtomicIconText].
  const AtomicIconText({
    super.key,
    required this.size,
    required this.text,
    this.icon,
    required this.iconColor,
    required this.textColor,
  });

  /// Devuelve el tamaño apropiado para el ícono según el tamaño seleccionado.
  double _getIconSize() {
    return size == IconTextSize.small ? 20.0 : 40.0;
  }

  /// Devuelve el tamaño de fuente apropiado según el tamaño seleccionado.
  double _getFontSize() {
    return size == IconTextSize.small ? 12.0 : 16.0;
  }

  /// Devuelve un ícono por defecto si no se proporciona uno.
  IconData _getDefaultIcon() {
    return size == IconTextSize.small ? Icons.shopping_cart : (icon ?? Icons.info);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _getDefaultIcon(),
          size: _getIconSize(),
          color: iconColor,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(fontSize: _getFontSize(), color: textColor, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
