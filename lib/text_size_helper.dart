import 'package:flutter/material.dart';

/// Computes size of text widget when it will be rendered in future
Size computeTextWidgetSize(
  String text,
  TextStyle? style,
) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}
