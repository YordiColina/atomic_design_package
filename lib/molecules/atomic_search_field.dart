import 'package:flutter/material.dart';

class AtomicSearchField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? TextEditingController(),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          icon ?? Icons.search,
          color: iconColor ?? Colors.black45,
          size: iconSize ?? 24,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? Colors.blue),
        ),
      ),
    );
  }
}
