import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/presentation/main_page/widgets/slidable/app_slidable_action.dart';

class SlidableItemWrapper extends StatelessWidget {
  const SlidableItemWrapper({
    required this.child,
    required this.onDone,
    required this.onDelete,
    required super.key,
  });
  final Widget child;
  final void Function() onDone;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    return Slidable(
      key: key,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          AppSlidableAction(
            onPressed: (context) => onDone.call(),
            backgroundColor: scaffoldColor,
            iconBackgroundColor: AppColors.green,
            icon: Icons.check,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: onDelete),
        children: [
          AppSlidableAction(
            onPressed: (context) => onDelete.call(),
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
