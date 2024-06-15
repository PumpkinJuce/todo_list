import 'dart:ui';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class Body extends TextWidget {
  const Body(
    String text, {
    super.key,
  }) : super(
          text,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
}
