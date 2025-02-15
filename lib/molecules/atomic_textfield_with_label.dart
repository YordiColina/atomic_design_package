/**
 * Un campo de formulario de texto personalizable con una etiqueta.
 *
 * Este widget proporciona un campo de entrada de texto con una etiqueta y propiedades opcionales
 * para ocultar el texto (por ejemplo, para contraseñas), personalizar el tipo de teclado y validar la entrada.
 */
import 'package:flutter/material.dart';

import '../atoms/atomic_text.dart';

/// Un widget con estado que representa un campo de formulario de texto con etiqueta.
class AtomicTextFormFieldWithLabel extends StatefulWidget {
  /// El texto de la etiqueta que se muestra encima del campo de entrada.
  final String label;

  /// Un controlador opcional para gestionar la entrada del campo de texto.
  final TextEditingController? controller;

  /// Indica si el campo de texto debe ocultar el texto ingresado (útil para contraseñas).
  final bool obscureText;

  /// El tipo de teclado que se utilizará para la entrada de texto.
  final TextInputType keyboardType;

  /// Una función opcional para validar el formulario.
  final String? Function(String?)? validator;
  /// El color del texto del label.
  final Color? textColor;

  /// El tamaño del texto, que afecta su estilo.
  /// Por defecto, usa [TextSize.medium].
  final TextSize? size;

  /// El peso de la fuente del texto.
  final FontWeight? fontWeight;


  /// Crea una instancia de [AtomicTextFormFieldWithLabel].
  const AtomicTextFormFieldWithLabel({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator, this.textColor, this.size,  this.fontWeight,
  });

  @override
  _AtomicTextFormFieldWithLabelState createState() => _AtomicTextFormFieldWithLabelState();
}

class _AtomicTextFormFieldWithLabelState extends State<AtomicTextFormFieldWithLabel> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AtomicText(
            text: widget.label,
            fontWeight: widget.fontWeight ?? FontWeight.w400,
            color: widget.textColor,
            size: widget.size ?? TextSize.medium,

          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: _internalController,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
