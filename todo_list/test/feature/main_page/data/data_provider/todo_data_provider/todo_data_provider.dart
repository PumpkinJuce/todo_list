import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/core/app_http_client/app_http_client.dart';
import 'package:todo_list/feature/main_page/data/data_provider/todo_data_provider.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';

import 'todo_data_provider.mocks.dart';

@GenerateMocks([AppHttpClient])
void main() {
  late MockAppHttpClient mockAppHttpClient;
  late TodoDataProvider dataProvider;

  setUp(() {
    mockAppHttpClient = MockAppHttpClient();
    dataProvider = TodoDataProvider(mockAppHttpClient);
  });

  group('getList', () {
    test('returns list of TaskModel on success', () async {
      final mockResponse = Response(
        data: {
          'status': 'ok',
          'revision': 1,
          'list': [],
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: '/list'),
      );

      when(mockAppHttpClient.get('/list'))
          .thenAnswer((_) async => mockResponse);

      final result = await dataProvider.getList();

      expect(result.data, isNotNull);
      expect(result.data, isA<List<TaskModel>>());
      expect(result.revision, 1);
    });

    test('returns error when response fails', () async {
      final mockResponse = Response(
        data: {'status': 'error'},
        statusCode: 500,
        requestOptions: RequestOptions(path: '/list'),
      );

      when(mockAppHttpClient.get('/list'))
          .thenAnswer((_) async => mockResponse);

      final result = await dataProvider.getList();

      expect(result.error, isNotNull);
      expect(result.data, isNull);
    });
  });

  test('addTask returns task when response is successful', () async {
    const mockTask = TaskModel(
        id: '1',
        title: 'Test Task',
        isDone: true,
        priority: PriorityLevel.basic);
    final mockResponse = Response(
      data: {
        'status': 'ok',
        'revision': 1,
        'element': mockTask.toJson(),
      },
      statusCode: 200,
      requestOptions: RequestOptions(path: '/list'),
    );

    when(mockAppHttpClient.post(
      '/list',
      options: anyNamed('options'),
      data: anyNamed('data'),
    )).thenAnswer((_) async => mockResponse);

    final result = await dataProvider.addTask(mockTask);

    expect(result.data, isNotNull);
    expect(result.data, isA<TaskModel>());
    expect(result.revision, 1);
  });

  test('getTaskById returns the task when response is successful', () async {
    const mockTask = TaskModel(
        id: '1',
        title: 'Test Task',
        isDone: true,
        priority: PriorityLevel.basic);
    final mockResponse = Response(
      data: {
        'status': 'ok',
        'revision': 1,
        'element': mockTask.toJson(),
      },
      statusCode: 200,
      requestOptions: RequestOptions(path: '/list/1'),
    );

    when(mockAppHttpClient.get(any)).thenAnswer((_) async => mockResponse);

    final result = await dataProvider.getTaskById('1');

    expect(result.data, isNotNull);
    expect(result.data, isA<TaskModel>());
    expect(result.revision, 1);
    expect(result.data?.id, '1');
    expect(result.data?.title, 'Test Task');
  });
}
