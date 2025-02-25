import 'package:flutter/material.dart';

class AtomicDropdownButton extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Color? dropdownColor;
  final TextStyle? textStyle;
  final double borderRadius;

  const AtomicDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.hintText = 'Selecciona una opción',
    this.dropdownColor,
    this.textStyle,
    this.borderRadius = 8.0,
  });

  @override
  _AtomicDropdownState createState() => _AtomicDropdownState();
}

class _AtomicDropdownState extends State<AtomicDropdownButton> {
  String? _selectedValue; // Maneja internamente la selección

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      dropdownColor: widget.dropdownColor ?? Colors.white,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.dropdownColor ?? Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      hint: Text(widget.hintText, style: widget.textStyle ?? const TextStyle(color: Colors.grey)),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedValue = newValue;
          });
          widget.onChanged(newValue); // Notifica el cambio
        }
      },
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: widget.textStyle),
        );
      }).toList(),
    );
  }
}
