import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/presentation/main_page/widgets/slidable/app_slidable_action.dart';

class SlidableItemWrapper extends StatelessWidget {
  const SlidableItemWrapper({
    required this.index,
    required this.child,
    super.key,
  });
  final int index;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          AppSlidableAction(
            onPressed: (context) {},
            backgroundColor: scaffoldColor,
            iconBackgroundColor: AppColors.green,
            icon: Icons.check,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          AppSlidableAction(
            onPressed: (context) {},
            backgroundColor: scaffoldColor,
            iconBackgroundColor: AppColors.red,
            icon: Icons.delete,
          ),
        ],
      ),
      child: child,
    );
  }
}
