import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/app_router/app_router.dart';
import 'package:todo_list/core/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/presentation/widgets/decorated_container.dart';
import 'package:todo_list/feature/main_page/presentation/widgets/dismissed_item/dismissed_item_wrapper.dart';
import 'package:todo_list/feature/main_page/presentation/widgets/priority_indicator.dart';

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

  TextStyle? _titleTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (task.isDone) {
      return textTheme.bodyLarge?.copyWith(
        color: AppColors.labelTertiary,
        decoration: TextDecoration.lineThrough,
      );
    }
    return textTheme.bodyLarge;
  }

  MaterialStateProperty<Color?>? _checkBoxFillColor() {
    if (task.isDeadlinePassed) {
      return MaterialStateProperty.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) {
          return AppColors.red.withOpacity(0.2);
        }
        return AppColors.green;
      });
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SlidableItemWrapper(
      key: ObjectKey(task),
      onDone: onDone,
      onDelete: onDelete,
      child: InkWell(
        onTap: () => AppRouter.of(context).push('/task', task),
        child: DecoratedContainer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: task.isDone,
                onChanged: onCheckBoxChange,
                side: task.isDeadlinePassed
                    ? const BorderSide(color: AppColors.red)
                    : null,
                fillColor: _checkBoxFillColor(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      maxLines: 3,
                      style: _titleTextStyle(context),
                    ),
                    _DateText(task.date),
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
      ),
    );
  }
}

class _DateText extends StatelessWidget {
  const _DateText(this.date, {super.key});

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final date = this.date;

    if (date == null) {
      return const SizedBox.shrink();
    }
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        formattedDate,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.labelTertiary),
      ),
    );
  }
}
