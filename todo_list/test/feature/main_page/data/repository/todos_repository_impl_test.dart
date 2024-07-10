import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/feature/main_page/data/data_provider/server_response.dart';
import 'package:todo_list/feature/main_page/data/data_provider/todo_cache_data_provider.dart';
import 'package:todo_list/feature/main_page/data/data_provider/todo_data_provider.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository_impl.dart';

import 'todos_repository_impl_test.mocks.dart';

@GenerateMocks([TodoDataProvider, TodoCacheDataProvider, TodosRepositoryImpl])
class MockStreamSubscription extends Mock
    implements StreamSubscription<List<TaskModel>> {}

void main() {
  late MockTodoDataProvider mockTodoDataProvider;
  late MockTodoCacheDataProvider mockTodoCacheDataProvider;
  late TodosRepositoryImpl todosRepository;

  setUp(() {
    mockTodoDataProvider = MockTodoDataProvider();
    mockTodoCacheDataProvider = MockTodoCacheDataProvider();

    when(mockTodoCacheDataProvider.listenToBox(any))
        .thenAnswer((Invocation invocation) {
      var callback =
          invocation.positionalArguments[0] as void Function(List<TaskModel>);

      return Stream<List<TaskModel>>.periodic(Duration.zero, (_) => [])
          .listen(callback);
    });

    todosRepository =
        TodosRepositoryImpl(mockTodoDataProvider, mockTodoCacheDataProvider);
  });

  test('addTask should add task and update revision', () async {
    const task = TaskModel(
      id: '1',
      title: 'Title1',
      isDone: false,
      priority: PriorityLevel.important,
    );
    const serverResponse =
        ServerResponse<TaskModel, String>(data: task, revision: 1);

    when(mockTodoDataProvider.addTask(task))
        .thenAnswer((_) async => serverResponse);

    await todosRepository.addTask(task);

    verify(mockTodoCacheDataProvider.addTask(task)).called(1);
    verify(mockTodoDataProvider.addTask(task)).called(1);
    verify(mockTodoCacheDataProvider.setRevision(1)).called(1);
  });

  test('deleteTaskById should delete task and update revision', () async {
    const task = TaskModel(
      id: '1',
      title: 'Title1',
      isDone: false,
      priority: PriorityLevel.important,
    );
    const serverResponse =
        ServerResponse<TaskModel, String>(data: task, revision: 1);

    final taskId = task.id;

    when(mockTodoDataProvider.deleteTaskById(taskId))
        .thenAnswer((_) async => serverResponse);

    await todosRepository.deleteTaskById(taskId);

    verify(mockTodoCacheDataProvider.deleteTask(taskId)).called(1);
    verify(mockTodoDataProvider.deleteTaskById(taskId)).called(1);
    verify(mockTodoCacheDataProvider.setRevision(1)).called(1);
  });

  test('updateTask should update task and update revision', () async {
    const task = TaskModel(
      id: '1',
      title: 'Title1',
      isDone: false,
      priority: PriorityLevel.important,
    );
    const serverResponse =
        ServerResponse<TaskModel, String>(data: task, revision: 1);

    when(mockTodoDataProvider.updateTask(task))
        .thenAnswer((_) async => serverResponse);

    await todosRepository.updateTask(task);

    verify(mockTodoCacheDataProvider.updateTask(task)).called(1);
    verify(mockTodoDataProvider.updateTask(task)).called(1);
    verify(mockTodoCacheDataProvider.setRevision(1)).called(1);
  });
}
