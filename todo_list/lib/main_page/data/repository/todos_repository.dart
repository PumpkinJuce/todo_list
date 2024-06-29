import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:todo_list/app_loger/log.dart';
import 'package:todo_list/main_page/data/data_provider/server_response.dart';
import 'package:todo_list/main_page/data/data_provider/todo_cache_data_provider.dart';
import 'package:todo_list/main_page/data/data_provider/todo_data_provider.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';

const _logTag = '[TodosRepository]';

class TodosRepository {
  TodosRepository(this._todoDataProvider, this._cacheDataProvider) {
    _cacheListener = _cacheDataProvider.listenToBox((event) {
      _todosStream.add(event);
    });
  }

  final TodoDataProvider _todoDataProvider;
  final TodoCacheDataProvider _cacheDataProvider;

  final _todosStream = BehaviorSubject<List<TaskModel>>.seeded([]);

  Stream<List<TaskModel>> get todoListStream => _todosStream.stream;

  StreamSubscription<List<TaskModel>>? _cacheListener;

  List<TaskModel> get currentList => _todosStream.value;

  FutureOr<void> addTask(TaskModel task) async {
    _cacheDataProvider.addTask(task);

    final response = await _todoDataProvider.addTask(task);
    _checkErrorAndSetRevision(response);
  }

  FutureOr<void> deleteTaskById(String id) async {
    _cacheDataProvider.deleteTask(id);

    final response = await _todoDataProvider.deleteTaskById(id);
    _checkErrorAndSetRevision(response);

    Log.info('$_logTag: delete item with id: $id');
  }

  FutureOr<void> updateTask(TaskModel task) async {
    _cacheDataProvider.updateTask(task);

    final response = await _todoDataProvider.updateTask(task);
    _checkErrorAndSetRevision(response);

    Log.info('$_logTag: update item with id: ${task.id}');
  }

  Future<void> fetchData() async {
    final response = await _todoDataProvider.getList();

    _checkErrorAndSetRevision(response);

    if (response.isSuccess) {
      _cacheDataProvider.saveTaskList(response.data ?? []);
    }
  }

  Future<void> syncData() async {
    final response = await _todoDataProvider.patchList(_cacheDataProvider.getList());

    _cacheDataProvider.setIsSync(true);

    _checkErrorAndSetRevision(response);
  }

  void getDataFromCache() {
    final list = _cacheDataProvider.getList();
    _todosStream.add(list);
  }

  Future<void> checkSyncDataAndFetchList() async {
    final isSync = _cacheDataProvider.isSync();
    final revision = _cacheDataProvider.getStoredRevision();

    if (revision == null) {
      fetchData();
    } else {
      getDataFromCache();

      _todoDataProvider.setRevision(revision);

      if (!isSync) {
        syncData();
      }
    }
  }

  void _checkErrorAndSetRevision(ServerResponse response) {
    if (response.isError) {
      _cacheDataProvider.setIsSync(false);
    }
    final revision = response.revision;
    if (revision != null) {
      _cacheDataProvider.setRevision(revision);
    }
  }

  void dispose() {
    _todosStream.close();
    _cacheListener?.cancel();
  }
}
