import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/feature/main_page/presentation/widgets/decorated_container.dart';
import 'package:todo_list/feature/new_task_page/domain/bloc/new_task_page_bloc.dart';
import 'package:todo_list/feature/new_task_page/presentation/widgets/show_app_date_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String? _deadlineDateFormatted(DateTime? deadlineDate) {
    return deadlineDate == null
        ? null
        : DateFormat('yyyy-MM-dd').format(deadlineDate);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<NewTaskPageBloc, NewTaskPageState>(
        builder: (context, state) {
      final deadlineDateFormatted = _deadlineDateFormatted(state.deadlineDate);
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
                  AppLocalizations.of(context)!.doBefore,
                  style: textTheme.bodyLarge,
                ),
                if (deadlineDateFormatted != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      deadlineDateFormatted,
                      style: textTheme.bodyMedium
                          ?.copyWith(color: AppColors.purple),
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
