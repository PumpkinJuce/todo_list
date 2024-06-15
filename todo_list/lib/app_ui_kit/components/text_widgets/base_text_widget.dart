import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    required this.fontSize,
    required this.fontWeight,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.color = Colors.black,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign textAlign;
  final Color color;
  final TextOverflow overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        overflow: overflow,
        fontWeight: fontWeight,
      ),
    );
  }
}
