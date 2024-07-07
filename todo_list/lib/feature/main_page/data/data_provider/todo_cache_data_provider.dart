import 'dart:async';
import 'package:collection/collection.dart';
import 'package:todo_list/core/app_cache.dart/app_cache.dart';
import 'package:todo_list/core/app_cache.dart/cache_table_names.dart';
import 'package:todo_list/core/app_loger/log.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';

const _logTag = '[TodoCacheDataProvider]';

class TodoCacheDataProvider {
  const TodoCacheDataProvider(this._appCache);

  final AppCache _appCache;

  static const _table = CacheTables.todoList;
  static const _listKey = 'list';
  static const _isSyncKey = 'isSync';
  static const _revisionKey = 'revision';

  List<TaskModel> getList() {
    try {
      final list = (_appCache.getData(_table, _listKey) ?? [])
          .cast<Map<String, dynamic>>();
      final result = (list as List).map((e) => TaskModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      Log.error('$_logTag: get error - $e');
      return [];
    }
  }

  Future<void> saveTaskList(List<TaskModel> list) async {
    try {
      await _appCache.putData(
          _table, _listKey, list.map((e) => e.toJson()).toList());
    } catch (e) {
      Log.error('$_logTag: save error - $e');
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      final list = getList();
      list.add(task);
      await saveTaskList(list);
    } catch (e) {
      Log.error('$_logTag: add task error - $e');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      final list = getList();
      final index = list.indexWhere((element) => element.id == id);
      list.removeAt(index);

      await saveTaskList(list);
    } catch (e) {
      Log.error('$_logTag: delete task error - $e');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      final list = getList();
      final index = list.indexWhere((element) => element.id == task.id);
      list[index] = task;

      await saveTaskList(list);
    } catch (e) {
      Log.error('$_logTag: update task error - $e');
    }
  }

  TaskModel? getTaskById(String id) {
    try {
      final list = getList();
      final task = list.firstWhereOrNull((element) => element.id == id);
      return task;
    } catch (e) {
      Log.error('$_logTag: getTaskById error - $e');
      return null;
    }
  }

  StreamSubscription<List<TaskModel>> listenToBox(
      void Function(List<TaskModel>) onEvent) {
    return _appCache.listen(_table, _listKey).asyncMap((event) async {
      final list = (event.value as List).cast<Map<String, dynamic>>();
      final tasks = list.map((e) => TaskModel.fromJson(e)).toList();
      return tasks;
    }).listen(onEvent);
  }

  bool isSync() {
    final isSync = _appCache.getData(_table, _isSyncKey) ?? true;
    Log.info('$_logTag: isSync - $isSync');
    return isSync;
  }

  Future<void> setIsSync(bool value) async {
    try {
      await _appCache.putData(_table, _isSyncKey, value);
    } catch (e) {
      Log.error('$_logTag: setIsSync error - $e');
    }
  }

  int? getStoredRevision() {
    try {
      final revision = _appCache.getData(_table, _revisionKey);
      return revision;
    } catch (e) {
      Log.error('$_logTag: getStoredRevision error - $e');
      return null;
    }
  }

  Future<void> setRevision(int value) async {
    try {
      await _appCache.putData(_table, _revisionKey, value);
    } catch (e) {
      Log.error('$_logTag: setRevision error - $e');
    }
  }
}
