import 'dart:ui';
import 'package:todo_list/app_ui_kit/components/font_sizes.dart';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class Body extends TextWidget {
  const Body(
    super.text, {
    super.maxLines,
    super.key,
  }) : super(
          fontSize: FontSizes.normal,
          fontWeight: FontWeight.w400,
        );
}
