import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app_router/app_router.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/main_page/domain/bloc/todos_bloc.dart';
import 'package:todo_list/main_page/presentation/widgets/sliver_app_bar.dart';
import 'package:todo_list/main_page/presentation/widgets/todo_list_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        final bloc = context.read<TodosBloc>();
        final tasks = state.tasks;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => AppRouter.of(context).pushNamed('/new-task'),
            shape: const CircleBorder(),
            backgroundColor: AppColors.purple,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: MyHeaderDelegate(
                  icon: state.isFiltered
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  doneTasksCount: state.doneTasksCount,
                  onIconTap: () => bloc.add(const TodosSwitchFilterEvent()),
                ),
              ),
              SliverList.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TodoListItem(
                          task: task,
                          onDone: () =>
                              bloc.add(TodosChangeStatusEvent(task, true)),
                          onDelete: () => bloc.add(TodosDeleteEvent(task.id)),
                          onCheckBoxChange: (value) => bloc.add(
                              TodosChangeStatusEvent(task, value ?? false)),
                        ),
                      ),
                      if (index == tasks.length - 1) const _AddNewTaskButton(),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AddNewTaskButton extends StatelessWidget {
  const _AddNewTaskButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () => AppRouter.of(context).pushNamed('/new-task'),
        child: Text(
          'Добавить задачу',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.labelTertiary),
        ),
      ),
    );
  }
}
