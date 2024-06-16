import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/components/font_sizes.dart';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class LargeTitle extends TextWidget {
  const LargeTitle(
    super.text, {
    super.key,
  }) : super(
          maxLines: 1,
          color: Colors.white,
          fontSize: FontSizes.large,
          fontWeight: FontWeight.w700,
        );
}
