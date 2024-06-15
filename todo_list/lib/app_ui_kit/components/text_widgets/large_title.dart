import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class LargeTitle extends TextWidget {
  const LargeTitle(
    String text, {
    super.key,
  }) : super(
          text,
          maxLines: 1,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        );
}
