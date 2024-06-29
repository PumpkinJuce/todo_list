import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app_ui_kit/components/app_colors.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';
import 'package:todo_list/main_page/presentation/widgets/decorated_container.dart';
import 'package:todo_list/main_page/presentation/widgets/priority_indicator.dart';
import 'package:todo_list/new_task_page/domain/bloc/new_task_page_bloc.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskPageBloc, NewTaskPageState>(
        builder: (context, state) {
      return DecoratedContainer(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Text(
              'Приоритет :',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 10),
            const _DropDownButton(),
          ],
        ),
      );
    });
  }
}

extension PriorityLevelExtension on PriorityLevel {
  String get title => switch (this) {
        PriorityLevel.none => 'Нет',
        PriorityLevel.medium => 'Средний',
        PriorityLevel.heigh => 'Высокий',
      };
}

class _DropDownButton extends StatelessWidget {
  const _DropDownButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskPageBloc, NewTaskPageState>(
        builder: (context, state) {
      final textTheme = Theme.of(context).textTheme;

      return DropdownButton(
        items: PriorityLevel.values.map((PriorityLevel priority) {
          return DropdownMenuItem<PriorityLevel>(
            value: priority,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  priority.title,
                  style: textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PriorityIndicator(priority),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) => context.read<NewTaskPageBloc>().add(
            NewTasPageChoosePriorityLevelEvent(value ?? PriorityLevel.none)),
        value: state.priorityLevel,
        style: textTheme.bodyMedium?.copyWith(
          color: AppColors.labelTertiary,
          decoration: TextDecoration.none,
          decorationStyle: TextDecorationStyle.solid,
        ),
        iconSize: 0.0,
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
      );
    });
  }
}
