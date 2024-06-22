import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app_router/app_router.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';
import 'package:todo_list/main_page/domain/bloc/todos_bloc.dart';
import 'package:todo_list/main_page/presentation/widgets/decorated_container.dart';
import 'package:todo_list/new_task_page/domain/bloc/new_task_page_bloc.dart';
import 'package:todo_list/new_task_page/presentation/show_app_date_picker.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({this.task, super.key});
  final TaskModel? task;

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final controller = TextEditingController();
  late bool isEditingMode;

  final bloc = NewTaskPageBloc();

  @override
  void initState() {
    super.initState();
    isEditingMode = widget.task != null;
    _setUpInitialData();
  }

  void _setUpInitialData() {
    final task = widget.task;
    if (isEditingMode && task != null) {
      controller.text = task.title;
      bloc.add(NewTasPageChooseDateEvent(task.date));
    }
  }

  Future<void> chooseDeadnlineSwitcher(bool value) async {
    if (!value) {
      bloc.add(const NewTasPageChooseDateEvent(null, hasDeadline: false));
      return;
    }

    final pickedDate = await showAppDatePicker(context);
    bloc.add(NewTasPageChooseDateEvent(pickedDate));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final todosBloc = context.read<TodosBloc>();
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
        child: BlocBuilder<NewTaskPageBloc, NewTaskPageState>(
          builder: (context, state) {
            final deadlineDate = state.deadlineDate;
            final deadlineDateFormatted = deadlineDate == null ? null : DateFormat('yyyy-MM-dd').format(deadlineDate);
            final hasDeadline = state.deadlineDate != null;

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
                      controller: controller,
                      maxLines: 30,
                      minLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Введите новую задачу...',
                      ),
                    ),
                    const SizedBox(height: 10),
                    DecoratedContainer(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Сделать до',
                                style: theme.textTheme.bodyLarge,
                              ),
                              if (deadlineDateFormatted != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    deadlineDateFormatted,
                                    style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.blue),
                                  ),
                                ),
                            ],
                          ),
                          Switch(
                            value: hasDeadline,
                            onChanged: (value) => chooseDeadnlineSwitcher(value),
                          ),
                        ],
                      ),
                    ),
                    DecoratedContainer(
                      child: Row(
                        children: [
                          DropdownButton(
                            items: [],
                            onChanged: (s) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: !isEditingMode
                              ? null
                              : () {
                                  final task = widget.task;
                                  if (task != null) {
                                    todosBloc.add(TodosDeleteEvent(task.id));
                                    AppRouter.of(context).pop();
                                  }
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.delete,
                                color: AppColors.red,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'УДАЛИТЬ',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'СОХРАНИТЬ',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
