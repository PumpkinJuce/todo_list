import 'package:flutter/widgets.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';

final mockTasks = List.generate(15, (index) {
    return TaskModel(
      id: UniqueKey().toString(),
      title: 'Task $index',
      isDone: index % 2 == 0,
      priority: PriorityLevel.values[index % PriorityLevel.values.length],
      description: index % 3 == 0 ? 'Description for Task $index' : null,
      date: DateTime.now().add(Duration(days: index)),
    );
  });
