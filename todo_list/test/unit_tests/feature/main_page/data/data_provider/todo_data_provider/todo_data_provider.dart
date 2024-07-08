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
    // when(mockAppCache.putData(CacheTables.todoList, 'list', any))
    //     .thenAnswer((_) => Future.value());
  });

  group('getList', () {
    test('returns list of TaskModel on success', () async {
      final mockResponse = Response(
        data: {
          'status': 'ok',
          'revision': 1,
          'list': [
            {'id': '1', 'title': 'Task 1', 'isDone': false, 'priority': 'important'}
          ],
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: '/'),
      );

      when(mockAppHttpClient.get(any)).thenAnswer((_) async => mockResponse);

      final result = await dataProvider.getList();

      expect(result.data, isA<List<TaskModel>>());
    });
  });
}
