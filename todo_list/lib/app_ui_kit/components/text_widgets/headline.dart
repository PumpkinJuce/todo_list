import 'dart:ui';
import 'package:todo_list/app_ui_kit/components/font_sizes.dart';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class Headline extends TextWidget {
  const Headline(
    String text, {
    super.key,
  }) : super(
          text,
          fontSize: FontSizes.large,
          fontWeight: FontWeight.w500,
        );
}
