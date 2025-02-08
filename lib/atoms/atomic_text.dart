import 'package:flutter/material.dart';

enum TextSize { small, medium, large }

class AtomicText extends StatelessWidget {
  final String text;
  final TextSize size;
  final Color? color;

  const AtomicText({
    super.key,
    required this.text,
    this.size = TextSize.medium,
    this.color, required FontWeight fontWeight, required TextAlign textAlign,
  });

  TextStyle _getTextStyle(BuildContext context) {
    switch (size) {
      case TextSize.small:
        return Theme.of(context).textTheme.bodySmall!.copyWith(color: color);
      case TextSize.large:
        return Theme.of(context).textTheme.headlineSmall!.copyWith(color: color);
      case TextSize.medium:
      default:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context),
    );
  }
}
