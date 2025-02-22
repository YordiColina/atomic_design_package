import 'package:flutter/material.dart';

class AtomicSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final String hintText;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final double borderRadius;

  const AtomicSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Buscar...',
    this.fillColor,
    this.hintStyle,
    this.borderColor,
    this.borderRadius = 15.0,
    this.icon,
    this.iconColor,
    this.iconSize,
  });

  @override
  State<AtomicSearchField> createState() => _AtomicSearchFieldState();
}

class _AtomicSearchFieldState extends State<AtomicSearchField> {
  TextEditingController? _internalController;

  @override
  void initState() {
    super.initState();
    // Si no se proporciona un controller, creamos uno interno
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Solo eliminamos el controlador si lo creamos nosotros
    if (widget.controller == null) {
      _internalController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _internalController,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey, fontFamily: 'Stars'),
        prefixIcon: Icon(widget.icon ?? Icons.search ,
          color: widget.iconColor ?? Colors.black45,
          size: widget.iconSize ?? 24,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor ?? Colors.transparent),
        ),
      ),
    );
  }
}
