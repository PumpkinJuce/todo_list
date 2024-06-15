import 'dart:ui';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class Subhead extends TextWidget {
  const Subhead(
    String text, {
    super.key,
  }) : super(
          text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
}
