import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/domain/data/task_model.dart';
import 'package:todo_list/presentation/main_page/widgets/priority_indicator.dart';
import 'package:todo_list/presentation/main_page/widgets/slidable/slidable_item_wrapper.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    required this.onCheckBoxChange,
    required this.onDelete,
    required this.onDone,
    required this.task,
    super.key,
  });

  final TaskModel task;
  final void Function() onDone;
  final void Function() onDelete;
  final void Function(bool? value) onCheckBoxChange;

  Widget _date(BuildContext context) {
    final date = task.date;

    if (date == null) {
      return const SizedBox.shrink();
    }
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        formattedDate,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.labelTertiary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidableItemWrapper(
      key: ObjectKey(task),
      onDone: onDone,
      onDelete: onDelete,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.backSecondary,
        ),
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 5,
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: task.isDone,
              onChanged: onCheckBoxChange,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    task.title,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  _date(context),
                ],
              ),
            ),
            const SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: PriorityIndicator(task.priority),
            ),
          ],
        ),
      ),
    );
  }
}
