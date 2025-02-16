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

import '../atoms/atomic_text.dart';



/// Un componente reutilizable que muestra un ícono con una etiqueta de texto.
class AtomicIconText extends StatelessWidget {
  /// El tamaño del par icono-texto, afectando ambos elementos.
  final double size;
  /// tamaño del texto
  final TextSize? textSize;

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
    required this.textColor, this.textSize,
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
         text:  text,
          size: textSize ?? TextSize.medium,fontWeight:FontWeight.w500 , color: textColor,

          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
