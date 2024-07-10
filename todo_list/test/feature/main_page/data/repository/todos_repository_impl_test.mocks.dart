// Mocks generated by Mockito 5.4.4 from annotations
// in todo_list/test/feature/main_page/data/repository/todos_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_list/feature/main_page/data/data_provider/server_response.dart'
    as _i2;
import 'package:todo_list/feature/main_page/data/data_provider/todo_cache_data_provider.dart'
    as _i6;
import 'package:todo_list/feature/main_page/data/data_provider/todo_data_provider.dart'
    as _i4;
import 'package:todo_list/feature/main_page/data/model/task_model.dart' as _i5;
import 'package:todo_list/feature/main_page/data/repository/todos_repository_impl.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeServerResponse_0<T, S> extends _i1.SmartFake
    implements _i2.ServerResponse<T, S> {
  _FakeServerResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamSubscription_1<T> extends _i1.SmartFake
    implements _i3.StreamSubscription<T> {
  _FakeStreamSubscription_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoDataProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoDataProvider extends _i1.Mock implements _i4.TodoDataProvider {
  MockTodoDataProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void setRevision(int? value) => super.noSuchMethod(
        Invocation.method(
          #setRevision,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<_i2.ServerResponse<List<_i5.TaskModel>, String>> getList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getList,
          [],
        ),
        returnValue:
            _i3.Future<_i2.ServerResponse<List<_i5.TaskModel>, String>>.value(
                _FakeServerResponse_0<List<_i5.TaskModel>, String>(
          this,
          Invocation.method(
            #getList,
            [],
          ),
        )),
      ) as _i3.Future<_i2.ServerResponse<List<_i5.TaskModel>, String>>);

  @override
  _i3.Future<_i2.ServerResponse<List<_i5.TaskModel>, String>> patchList(
          List<_i5.TaskModel>? list) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchList,
          [list],
        ),
        returnValue:
            _i3.Future<_i2.ServerResponse<List<_i5.TaskModel>, String>>.value(
                _FakeServerResponse_0<List<_i5.TaskModel>, String>(
          this,
          Invocation.method(
            #patchList,
            [list],
          ),
        )),
      ) as _i3.Future<_i2.ServerResponse<List<_i5.TaskModel>, String>>);

  @override
  _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>> addTask(
          _i5.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTask,
          [task],
        ),
        returnValue:
            _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>.value(
                _FakeServerResponse_0<_i5.TaskModel, String>(
          this,
          Invocation.method(
            #addTask,
            [task],
          ),
        )),
      ) as _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>);

  @override
  _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>> updateTask(
          _i5.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTask,
          [task],
        ),
        returnValue:
            _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>.value(
                _FakeServerResponse_0<_i5.TaskModel, String>(
          this,
          Invocation.method(
            #updateTask,
            [task],
          ),
        )),
      ) as _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>);

  @override
  _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>> getTaskById(
          String? taskId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaskById,
          [taskId],
        ),
        returnValue:
            _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>.value(
                _FakeServerResponse_0<_i5.TaskModel, String>(
          this,
          Invocation.method(
            #getTaskById,
            [taskId],
          ),
        )),
      ) as _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>);

  @override
  _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>> deleteTaskById(
          String? taskId) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteTaskById,
          [taskId],
        ),
        returnValue:
            _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>.value(
                _FakeServerResponse_0<_i5.TaskModel, String>(
          this,
          Invocation.method(
            #deleteTaskById,
            [taskId],
          ),
        )),
      ) as _i3.Future<_i2.ServerResponse<_i5.TaskModel, String>>);
}

/// A class which mocks [TodoCacheDataProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoCacheDataProvider extends _i1.Mock
    implements _i6.TodoCacheDataProvider {
  MockTodoCacheDataProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i5.TaskModel> getList() => (super.noSuchMethod(
        Invocation.method(
          #getList,
          [],
        ),
        returnValue: <_i5.TaskModel>[],
      ) as List<_i5.TaskModel>);

  @override
  _i3.Future<void> saveTaskList(List<_i5.TaskModel>? list) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTaskList,
          [list],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> addTask(_i5.TaskModel? task) => (super.noSuchMethod(
        Invocation.method(
          #addTask,
          [task],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteTask(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTask,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateTask(_i5.TaskModel? task) => (super.noSuchMethod(
        Invocation.method(
          #updateTask,
          [task],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i5.TaskModel? getTaskById(String? id) =>
      (super.noSuchMethod(Invocation.method(
        #getTaskById,
        [id],
      )) as _i5.TaskModel?);

  @override
  _i3.StreamSubscription<List<_i5.TaskModel>> listenToBox(
          void Function(List<_i5.TaskModel>)? onEvent) =>
      (super.noSuchMethod(
        Invocation.method(
          #listenToBox,
          [onEvent],
        ),
        returnValue: _FakeStreamSubscription_1<List<_i5.TaskModel>>(
          this,
          Invocation.method(
            #listenToBox,
            [onEvent],
          ),
        ),
      ) as _i3.StreamSubscription<List<_i5.TaskModel>>);

  @override
  bool isSync() => (super.noSuchMethod(
        Invocation.method(
          #isSync,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i3.Future<void> setIsSync(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setIsSync,
          [value],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> setRevision(int? value) => (super.noSuchMethod(
        Invocation.method(
          #setRevision,
          [value],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [TodosRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodosRepositoryImpl extends _i1.Mock
    implements _i7.TodosRepositoryImpl {
  MockTodosRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i5.TaskModel>> get todoListStream => (super.noSuchMethod(
        Invocation.getter(#todoListStream),
        returnValue: _i3.Stream<List<_i5.TaskModel>>.empty(),
      ) as _i3.Stream<List<_i5.TaskModel>>);

  @override
  List<_i5.TaskModel> get currentList => (super.noSuchMethod(
        Invocation.getter(#currentList),
        returnValue: <_i5.TaskModel>[],
      ) as List<_i5.TaskModel>);

  @override
  _i3.FutureOr<void> addTask(_i5.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(
        #addTask,
        [task],
      )) as _i3.FutureOr<void>);

  @override
  _i3.FutureOr<void> deleteTaskById(String? id) =>
      (super.noSuchMethod(Invocation.method(
        #deleteTaskById,
        [id],
      )) as _i3.FutureOr<void>);

  @override
  _i3.FutureOr<void> updateTask(_i5.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(
        #updateTask,
        [task],
      )) as _i3.FutureOr<void>);

  @override
  _i3.Future<void> fetchData() => (super.noSuchMethod(
        Invocation.method(
          #fetchData,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> syncData() => (super.noSuchMethod(
        Invocation.method(
          #syncData,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  void getDataFromCache() => super.noSuchMethod(
        Invocation.method(
          #getDataFromCache,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> checkSyncDataAndFetchList() => (super.noSuchMethod(
        Invocation.method(
          #checkSyncDataAndFetchList,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.FutureOr<_i5.TaskModel?> getTaskById(
    String? id, {
    bool? checkFromCache = false,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #getTaskById,
        [id],
        {#checkFromCache: checkFromCache},
      )) as _i3.FutureOr<_i5.TaskModel?>);
}