import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class AtomicButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonSize size;

  const AtomicButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = ButtonSize.medium,
  });

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
        padding: EdgeInsets.symmetric(vertical: _getPadding(), horizontal: _getPadding() * 2),
        textStyle: TextStyle(fontSize: _getFontSize()),
        backgroundColor: const Color.fromRGBO(158, 123, 187, 1.0)
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
