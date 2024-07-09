import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/app_router/app_router.dart';
import 'package:todo_list/core/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/feature/main_page/domain/bloc/todos_bloc.dart';
import 'package:todo_list/feature/new_task_page/domain/bloc/new_task_page_bloc.dart';
import 'package:todo_list/feature/new_task_page/presentation/widgets/deadline_widget.dart';
import 'package:todo_list/feature/new_task_page/presentation/widgets/priority_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({this.task, this.taskId, super.key});
  final TaskModel? task;
  final String? taskId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        shadowColor: theme.scaffoldBackgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => AppRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: theme.iconTheme.color,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => NewTaskPageBloc(
          Provider.of<TodosRepository>(context, listen: false),
        )..add(
            NewTasPageInit(task, taskId),
          ),
        child: BlocBuilder<NewTaskPageBloc, NewTaskPageState>(builder: (context, state) {
          final bloc = context.read<NewTaskPageBloc>();

          if (state is NewTaskPageLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(color: AppColors.purple),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: bloc.controller,
                    maxLines: 20,
                    minLines: 5,
                    decoration: InputDecoration(
                      hintText: '${localization.addNewTask}...',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DeadlineWidget(),
                  const PriorityWidget(),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DeleteButton(task),
                      _SaveButton(task: task),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.task});

  final TaskModel? task;

  bool isValid(BuildContext context) {
    return context.read<NewTaskPageBloc>().controller.text.trim().isNotEmpty;
  }

  void _updateOrSaveTask(NewTaskPageState state, BuildContext context) {
    final bloc = context.read<TodosBloc>();
    final pageBloc = context.read<NewTaskPageBloc>();
    final task = this.task;
    if (task != null) {
      bloc.add(
        TodosUpdateEvent(
          task: task,
          hasDeadline: state.deadlineDate != null,
          date: state.deadlineDate,
          priorityLevel: state.priorityLevel,
          title: pageBloc.controller.text,
        ),
      );
    } else {
      bloc.add(
        TodosAddEvent(
          date: state.deadlineDate,
          title: pageBloc.controller.text,
          priorityLevel: state.priorityLevel,
        ),
      );
    }
  }

  void _onSave(NewTaskPageState state, BuildContext context) {
    if (!isValid(context)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.addTask),
      ));
      return;
    }

    _updateOrSaveTask(state, context);
    AppRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskPageBloc, NewTaskPageState>(
      builder: (context, state) {
        return TextButton(
          key: const Key('save_button'),
          onPressed: () => _onSave(state, context),
          child: Text(
            AppLocalizations.of(context)!.save,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.purple,
                  fontWeight: FontWeight.w500,
                ),
          ),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton(this.task);

  final TaskModel? task;

  bool get isEditingMode => task != null;

  Color deleteButtonColor() {
    if (isEditingMode) {
      return AppColors.red;
    }
    return AppColors.labelDisable;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !isEditingMode
          ? null
          : () {
              if (task != null) {
                context.read<TodosBloc>().add(TodosDeleteEvent(task!.id));
                AppRouter.of(context).pop();
              }
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.delete,
            color: deleteButtonColor(),
          ),
          const SizedBox(width: 12),
          Text(
            AppLocalizations.of(context)!.delete,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: deleteButtonColor(),
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
