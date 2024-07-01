import 'dart:async';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';

abstract class TodosRepository {
  const TodosRepository();

  Stream<List<TaskModel>> get todoListStream;

  List<TaskModel> get currentList;

  FutureOr<void> addTask(TaskModel task);

  FutureOr<void> deleteTaskById(String id);

  FutureOr<void> updateTask(TaskModel task);

  Future<void> checkSyncDataAndFetchList();

  void dispose();
}
