import 'dart:ui';
import 'package:todo_list/app_ui_kit/components/font_sizes.dart';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class Subhead extends TextWidget {
  const Subhead(
    String text, {
    super.key,
  }) : super(
          text,
          fontSize: FontSizes.small,
          fontWeight: FontWeight.w400,
        );
}
