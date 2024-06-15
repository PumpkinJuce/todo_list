import 'dart:ui';
import 'package:todo_list/app_ui_kit/components/text_widgets/base_text_widget.dart';

class Title extends TextWidget {
  const Title(
    String text, {
    super.key,
  }) : super(
          text,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        );
}
