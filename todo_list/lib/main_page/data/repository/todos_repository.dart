import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_list/app_loger/log.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';

const _logTag = '[TodosRepository]';

class TodosRepository {
  TodosRepository() {
    _mockData();
  }

  final _todosStream = BehaviorSubject<List<TaskModel>>.seeded([]);

  Stream<List<TaskModel>> get todoListStream => _todosStream.stream;

  List<TaskModel> get currentList => _todosStream.value;

  FutureOr<void> addTask(TaskModel task) async {
    final currentTasks = await getAllTasks();
    currentTasks.add(task);
    _todosStream.add(currentTasks);
    Log.info('$_logTag: add item with id: ${task.id}');
  }

  FutureOr<void> deleteTaskById(String id) async {
    final currentTasks = await getAllTasks();
    currentTasks.removeWhere((task) => task.id == id);
    _todosStream.add(currentTasks);
    Log.info('$_logTag: delete item with id: $id');
  }

  FutureOr<List<TaskModel>> getAllTasks() {
    return [..._todosStream.value];
  }

  FutureOr<void> updateTask(TaskModel task) async {
    final currentTasks = await getAllTasks();
    final taskIndex =
        currentTasks.indexWhere((element) => element.id == task.id);
    currentTasks[taskIndex] = task;
    _todosStream.add(currentTasks);
    Log.info('$_logTag: update item with id: ${task.id}');
  }

  void _mockData() {
    final list = List.generate(10, (index) {
      return TaskModel(
        id: UniqueKey().toString(),
        title: 'Task $index',
        isDone: index % 2 == 0,
        priority: PriorityLevel.values[index % PriorityLevel.values.length],
        date: DateTime.now().add(Duration(days: index)),
      );
    });
    _todosStream.add(list);
  }

  void dispose() {
    _todosStream.close();
  }
}
