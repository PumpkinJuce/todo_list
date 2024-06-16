import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/main_page/presentation/widgets/slidable/slidable_action_icon_widget.dart';

typedef SlidableActionCallback = void Function(BuildContext context);

class AppSlidableAction extends StatelessWidget {
  const AppSlidableAction({
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.onPressed,
    required this.icon,
    this.flex = 1,
    this.autoClose = true,
    super.key,
  });

  final int flex;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final bool autoClose;
  final SlidableActionCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomSlidableAction(
      onPressed: onPressed,
      autoClose: autoClose,
      backgroundColor: backgroundColor,
      flex: flex,
      child: SlidableActionIconWidget(
        icon: icon,
        backgroundColor: iconBackgroundColor,
      ),
    );
  }
}
