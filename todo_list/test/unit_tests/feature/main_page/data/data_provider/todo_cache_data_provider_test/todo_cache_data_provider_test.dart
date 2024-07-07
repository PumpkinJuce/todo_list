import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/core/app_cache.dart/app_cache_hive_impl.dart';
import 'package:todo_list/core/app_cache.dart/cache_table_names.dart';
import 'package:todo_list/feature/main_page/data/data_provider/todo_cache_data_provider.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';

import '../../../../../mock_data/task_model_list_mock.dart';
import 'todo_cache_data_provider_test.mocks.dart';

@GenerateMocks([HiveAppCache])
void main() {
  late MockHiveAppCache mockAppCache;
  late TodoCacheDataProvider dataProvider;

  setUp(() {
    mockAppCache = MockHiveAppCache();
    dataProvider = TodoCacheDataProvider(mockAppCache);
    when(mockAppCache.putData(CacheTables.todoList, 'list', any))
        .thenAnswer((_) => Future.value());
  });

  group('getList', () {
    test('returns list of TaskModel', () async {
      final mockData = taskModelListMock(jsonFormat: true);
      when(mockAppCache.getData(CacheTables.todoList, 'list'))
          .thenReturn(mockData);

      final result = dataProvider.getList();

      expect(result, isA<List<TaskModel>>());
    });

    test('returns list of 3 elements', () async {
      final mockData = taskModelListMock(jsonFormat: true);
      when(mockAppCache.getData(CacheTables.todoList, 'list'))
          .thenReturn(mockData);

      final result = dataProvider.getList();

      expect(result.length, 3);
    });
  });

  group('addTask', () {
    test('calls appCache.putData', () async {
      const task = TaskModel(
          id: '1',
          title: 'Title1',
          isDone: false,
          priority: PriorityLevel.important);
      await dataProvider.addTask(task);

      verify(mockAppCache.putData(CacheTables.todoList, 'list', any)).called(1);
    });

    test('calls with data params', () async {
      const task = TaskModel(
          id: '1',
          title: 'Title1',
          isDone: false,
          priority: PriorityLevel.important);
      await dataProvider.addTask(task);
      final expectedJson = [task.toJson()];

      verify(
        mockAppCache.putData(
          CacheTables.todoList,
          'list',
          argThat(equals(expectedJson)),
        ),
      ).called(1);
    });
  });

  group('deleteTask', () {
    test('calls appCache.putData', () async {
      final mockData = [
        const TaskModel(
                id: '1',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson(),
        const TaskModel(
                id: '2',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson()
      ];
      when(mockAppCache.getData(CacheTables.todoList, 'list'))
          .thenReturn(mockData);

      await dataProvider.deleteTask('1');

      verify(mockAppCache.putData(CacheTables.todoList, 'list', any)).called(1);
    });

    test('calls without deleted task', () async {
      final mockData = [
        const TaskModel(
                id: '1',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson(),
        const TaskModel(
                id: '2',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson()
      ];
      final expectedData = [
        const TaskModel(
                id: '2',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson()
      ];
      when(mockAppCache.getData(CacheTables.todoList, 'list'))
          .thenReturn(mockData);

      await dataProvider.deleteTask('1');

      verify(
        mockAppCache.putData(
          CacheTables.todoList,
          'list',
          argThat(equals(expectedData)),
        ),
      ).called(1);
    });
  });

  test('updateTask calls appCache.putData with updated params', () async {
    final mockData = [
      const TaskModel(
              id: '1',
              title: 'Title1',
              isDone: false,
              priority: PriorityLevel.important)
          .toJson(),
      const TaskModel(
              id: '2',
              title: 'Title1',
              isDone: false,
              priority: PriorityLevel.important)
          .toJson()
    ];
    final expectedData = [
      const TaskModel(
              id: '1',
              title: 'Title1',
              isDone: true,
              priority: PriorityLevel.basic)
          .toJson(),
      const TaskModel(
              id: '2',
              title: 'Title1',
              isDone: false,
              priority: PriorityLevel.important)
          .toJson(),
    ];
    when(mockAppCache.getData(CacheTables.todoList, 'list'))
        .thenReturn(mockData);

    await dataProvider.updateTask(
      const TaskModel(
          id: '1',
          title: 'Title1',
          isDone: true,
          priority: PriorityLevel.basic),
    );

    verify(
      mockAppCache.putData(
        CacheTables.todoList,
        'list',
        argThat(equals(expectedData)),
      ),
    ).called(1);
  });

  group('getTaskById', () {
    test('return TaskModel by id', () {
      final mockData = [
        const TaskModel(
                id: '1',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson(),
        const TaskModel(
                id: '2',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson()
      ];
      when(mockAppCache.getData(CacheTables.todoList, 'list'))
          .thenReturn(mockData);

      final result = dataProvider.getTaskById('1');

      const expectedModel = TaskModel(
          id: '1',
          title: 'Title1',
          isDone: false,
          priority: PriorityLevel.important);
      expect(result, expectedModel);
    });

    test('return null with wrong id', () {
      final mockData = [
        const TaskModel(
                id: '1',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson(),
        const TaskModel(
                id: '2',
                title: 'Title1',
                isDone: false,
                priority: PriorityLevel.important)
            .toJson()
      ];
      when(mockAppCache.getData(CacheTables.todoList, 'list'))
          .thenReturn(mockData);

      final result = dataProvider.getTaskById('3');
      expect(result, null);
    });
  });

  test('setIsSync callss putData with params', () {
    const value = true;

    dataProvider.setIsSync(value);

    verify(
      mockAppCache.putData(
        CacheTables.todoList,
        'isSync',
        argThat(equals(value)),
      ),
    ).called(1);
  });

  test('setRevision callss putData with params', () {
    const value = 1;

    dataProvider.setRevision(value);

    verify(
      mockAppCache.putData(
        CacheTables.todoList,
        'revision',
        argThat(equals(value)),
      ),
    ).called(1);
  });
}
