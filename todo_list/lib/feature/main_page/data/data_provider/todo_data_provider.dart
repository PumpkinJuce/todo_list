import 'package:dio/dio.dart';
import 'package:todo_list/core/app_http_client/app_http_client.dart';
import 'package:todo_list/core/app_loger/log.dart';
import 'package:todo_list/feature/main_page/data/data_provider/server_response.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';

const _tag = '[TodoDataProvider]';

class TodoDataProvider {
  TodoDataProvider(this._httpClient);

  static const _path = '/list';

  final AppHttpClient _httpClient;

  int? _revision;

  Map<String, int?> get _revisionHeader => {'X-Last-Known-Revision': _revision};

  void setRevision(int value) => _revision = value;

  Future<ServerResponse<List<TaskModel>, String>> getList() async {
    try {
      final response = await _httpClient.get(_path);

      if (response.statusCode != 200 || response.data['status'] != 'ok') {
        throw Exception(response.statusCode);
      }
      setRevision(response.data['revision']);

      final list = (response.data['list'] as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();

      return ServerResponse(data: list, revision: _revision);
    } on DioException catch (e) {
      Log.error('$_tag: getList - $e');
      return ServerResponse(error: e.toString());
    }
  }

  Future<ServerResponse<List<TaskModel>, String>> patchList(
      List<TaskModel> list) async {
    try {
      final response = await _httpClient.patch(
        _path,
        options: Options(headers: _revisionHeader),
        data: {"list": list.map((e) => e.toJson()).toList()},
      );
      if (response.statusCode != 200 || response.data['status'] != 'ok') {
        throw Exception(response.statusCode);
      }

      setRevision(response.data['revision']);

      final result = (response.data['list'] as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();

      return ServerResponse(data: result, revision: _revision);
    } on DioException catch (e) {
      Log.error('$_tag: patchList - $e');
      return ServerResponse(error: e.toString());
    }
  }

  Future<ServerResponse<TaskModel, String>> addTask(TaskModel task) async {
    try {
      final response = await _httpClient.post(
        _path,
        options: Options(headers: _revisionHeader),
        data: {"element": task.toJson()},
      );

      if (response.statusCode != 200 || response.data['status'] != 'ok') {
        throw Exception(response.statusCode);
      }
      final newTask = TaskModel.fromJson(response.data['element']);
      setRevision(response.data['revision']);

      return ServerResponse(data: newTask, revision: _revision);
    } on DioException catch (e) {
      Log.error('$_tag: addTask - $e');
      return ServerResponse(error: e.toString());
    }
  }

  Future<ServerResponse<TaskModel, String>> updateTask(TaskModel task) async {
    try {
      final url = '$_path/${task.id}';
      final response = await _httpClient.put(
        url,
        options: Options(headers: _revisionHeader),
        data: {"element": task.toJson()},
      );

      if (response.statusCode != 200 || response.data['status'] != 'ok') {
        throw Exception(response.statusCode);
      }
      final newTask = TaskModel.fromJson(response.data['element']);
      setRevision(response.data['revision']);

      return ServerResponse(data: newTask, revision: _revision);
    } on DioException catch (e) {
      Log.error('$_tag: updateTask -$e');
      return ServerResponse(error: e.toString());
    }
  }

  Future<ServerResponse<TaskModel, String>> getTaskById(String taskId) async {
    try {
      final url = '$_path/$taskId';
      final response = await _httpClient.get(url);

      if (response.statusCode != 200 || response.data['status'] != 'ok') {
        throw Exception(response.statusCode);
      }
      final newTask = TaskModel.fromJson(response.data['element']);
      setRevision(response.data['revision']);

      return ServerResponse(data: newTask, revision: _revision);
    } on DioException catch (e) {
      Log.error('$_tag: getTaskById - $e');
      return ServerResponse(error: e.toString());
    }
  }

  Future<ServerResponse<TaskModel, String>> deleteTaskById(
      String taskId) async {
    try {
      final url = '$_path/$taskId';
      final response = await _httpClient.delete(
        url,
        options: Options(headers: _revisionHeader),
      );

      if (response.statusCode != 200 || response.data['status'] != 'ok') {
        throw Exception(response.statusCode);
      }
      final newTask = TaskModel.fromJson(response.data['element']);
      setRevision(response.data['revision']);

      return ServerResponse(data: newTask, revision: _revision);
    } on DioException catch (e) {
      Log.error('$_tag: deleteTaskById - $e');
      return ServerResponse(error: e.toString());
    }
  }
}
