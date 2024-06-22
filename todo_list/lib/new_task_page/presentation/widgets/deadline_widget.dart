import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/main_page/presentation/widgets/decorated_container.dart';
import 'package:todo_list/new_task_page/domain/bloc/new_task_page_bloc.dart';
import 'package:todo_list/new_task_page/presentation/show_app_date_picker.dart';

class DeadlineWidget extends StatelessWidget {
  const DeadlineWidget({super.key});

  Future<void> chooseDeadnlineSwitcher(bool value, BuildContext context) async {
    final bloc = context.read<NewTaskPageBloc>();
    if (!value) {
      bloc.add(const NewTasPageChooseDateEvent(null, hasDeadline: false));
      return;
    }

    final pickedDate = await showAppDatePicker(context);
    bloc.add(NewTasPageChooseDateEvent(pickedDate));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<NewTaskPageBloc, NewTaskPageState>(
        builder: (context, state) {
      final deadlineDate = state.deadlineDate;
      final deadlineDateFormatted = deadlineDate == null
          ? null
          : DateFormat('yyyy-MM-dd').format(deadlineDate);
      final hasDeadline = state.deadlineDate != null;

      return DecoratedContainer(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Сделать до',
                  style: textTheme.bodyLarge,
                ),
                if (deadlineDateFormatted != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      deadlineDateFormatted,
                      style:
                          textTheme.bodyMedium?.copyWith(color: AppColors.blue),
                    ),
                  ),
              ],
            ),
            Switch(
              value: hasDeadline,
              onChanged: (value) => chooseDeadnlineSwitcher(value, context),
            ),
          ],
        ),
      );
    });
  }
}
