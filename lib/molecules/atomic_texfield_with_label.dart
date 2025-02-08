import 'package:flutter/material.dart';

class AtomicTextFormFieldWithLabel extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText; // Para contraseñas
  final TextInputType keyboardType; // Para personalizar el tipo de input
  final String? Function(String?)? validator; // Función de validación

  const AtomicTextFormFieldWithLabel({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: _internalController,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator, // Se usa la función de validación
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }
}
