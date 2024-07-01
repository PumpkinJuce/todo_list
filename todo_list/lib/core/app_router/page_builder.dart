import 'package:flutter/material.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/presentation/main_page.dart';
import 'package:todo_list/feature/new_task_page/presentation/new_task_page.dart';

Page? pageBuilder(String path, [Object? arguments]) {
  switch (path) {
    case '/main':
      return MaterialPage(
        key: UniqueKey(),
        child: const MainPage(),
      );
    case '/new-task':
      final task = arguments is TaskModel ? arguments : null;
      return MaterialPage(
        key: UniqueKey(),
        child: NewTaskPage(task: task),
      );
    default:
      return null;
  }
}
