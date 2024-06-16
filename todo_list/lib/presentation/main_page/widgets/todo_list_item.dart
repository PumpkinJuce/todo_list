import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/domain/data/task_model.dart';
import 'package:todo_list/presentation/main_page/widgets/priority_indicator.dart';
import 'package:todo_list/presentation/main_page/widgets/slidable/slidable_item_wrapper.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
    this.task, {
    required this.index,
    super.key,
  });

  final TaskModel task;
  final int index;

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
      index: index,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.backSecondary,
        ),
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: task.isDone,
              onChanged: (bool? value) {},
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    bottom: 6,
                    right: 6,
                  ),
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
                  )),
            ),
            // const Icon(
            //   Icons.info_outline,
            //   color: AppColors.labelTertiary,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10),
              child: PriorityIndicator(task.priority),
            )
          ],
        ),
      ),
    );
  }
}
