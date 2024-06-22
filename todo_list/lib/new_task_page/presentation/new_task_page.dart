import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app_router/app_router.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';
import 'package:todo_list/main_page/domain/bloc/todos_bloc.dart';
import 'package:todo_list/new_task_page/domain/bloc/new_task_page_bloc.dart';
import 'package:todo_list/new_task_page/presentation/widgets/deadline_widget.dart';
import 'package:todo_list/new_task_page/presentation/widgets/priority_widget.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({this.task, super.key});
  final TaskModel? task;

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final controller = TextEditingController();

  final bloc = NewTaskPageBloc();

  @override
  void initState() {
    super.initState();
    _setUpInitialData();
  }

  void _setUpInitialData() {
    final task = widget.task;
    if (task != null) {
      controller.text = task.title;
      bloc.add(NewTasPageChooseDateEvent(task.date));
      bloc.add(NewTasPageChoosePriorityLevelEvent(task.priority));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        create: (context) => bloc,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller,
                  maxLines: 20,
                  minLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Введите новую задачу...',
                  ),
                ),
                const SizedBox(height: 10),
                const DeadlineWidget(),
                const PriorityWidget(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DeleteButton(widget.task),
                    _SaveButton(controller: controller, task: widget.task),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.controller,
    required this.task,
    super.key,
  });
  final TaskModel? task;
  final TextEditingController controller;

  bool isValid() {
    return controller.text.trim().isNotEmpty;
  }

  void _updateOrSaveTask(NewTaskPageState state, BuildContext context) {
    final bloc = context.read<TodosBloc>();
    final task = this.task;
    if (task != null) {
      bloc.add(
        TodosUpdateEvent(
          task.copyWith(
              date: state.deadlineDate,
              priority: state.priorityLevel,
              title: controller.text),
        ),
      );
    } else {
      bloc.add(
        TodosAddEvent(TaskModel(
          id: UniqueKey().toString(),
          title: controller.text,
          isDone: false,
          priority: state.priorityLevel,
        )),
      );
    }
  }

  void _onSave(NewTaskPageState state, BuildContext context) {
    if (!isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Введите задачу'),
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
        onPressed: () => _onSave(state, context),
        child: Text(
          'СОХРАНИТЬ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.purple,
                fontWeight: FontWeight.w500,
              ),
        ),
      );
    });
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton(this.task, {super.key});

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
            'УДАЛИТЬ',
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
