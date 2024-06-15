import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    required this.fontSize,
    required this.fontWeight,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.color,
    super.key,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign textAlign;
  final Color? color;
  final TextOverflow overflow;

  Color _textColor(BuildContext context) {
    final color = this.color;
    if (color != null) {
      return color;
    }
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    if (isLightMode) {
      return AppColors.black;
    }

    return AppColors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: _textColor(context),
        fontSize: fontSize,
        overflow: overflow,
        fontWeight: fontWeight,
      ),
    );
  }
}
