import 'package:flutter/material.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/main_page/presentation/widgets/dismissed_item/dismissed_icon_widget.dart';

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
    return Dismissible(
      key: key ?? UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerStart,
        child: const SlidableActionIconWidget(
          backgroundColor: AppColors.green,
          icon: Icons.check,
        ),
      ),
      secondaryBackground: Container(
        alignment: AlignmentDirectional.centerEnd,
        child: const SlidableActionIconWidget(
          backgroundColor: AppColors.red,
          icon: Icons.delete,
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onDone.call();
          return false;
        }
        return true;
      },
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete.call();
        }
      },
      child: child,
    );
  }
}
