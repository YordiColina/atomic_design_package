import 'package:flutter/material.dart';

enum IconTextSize { small, medium }

class AtomicIconText extends StatelessWidget {
  final IconTextSize size;
  final String text;
  final IconData? icon;
  final Color iconColor;
  final Color textColor;

  const AtomicIconText({
    super.key,
    required this.size,
    required this.text,
    this.icon,
    required this.iconColor, required this.textColor,
  });

  double _getIconSize() {
    return size == IconTextSize.small ? 20.0 : 40.0;
  }

  double _getFontSize() {
    return size == IconTextSize.small ? 12.0 : 16.0;
  }

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
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(fontSize: _getFontSize(), color: textColor, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
