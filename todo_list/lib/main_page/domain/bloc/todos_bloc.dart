import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';
import 'package:todo_list/main_page/data/repository/todos_repository.dart';
import 'package:uuid/uuid.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc(this.repository) : super(const TodosInitialState([], false, 0)) {
    on<TodosFetchEvent>(_fetchEvent);
    on<TodosUpdateListEvent>(_updateListEvent);
    on<TodosSwitchFilterEvent>(_switchFilterEvent);
    on<TodosAddEvent>(_addEvent);
    on<TodosDeleteEvent>(_deleteEvent);
    on<TodosUpdateEvent>(_updateEvent);
    on<TodosChangeStatusEvent>(_changeStatus);

    tasksStream = repository.todoListStream.listen((event) {
      add(TodosUpdateListEvent(event));
    });
  }

  final TodosRepository repository;

  StreamSubscription? tasksStream;

  void _updateListEvent(TodosUpdateListEvent event, Emitter<TodosState> emit) {
    final isFiltered = event.isFiltered ?? state.isFiltered;
    final result = isFiltered
        ? event.tasks.where((element) => !element.isDone).toList()
        : event.tasks;
    final doneTasksCount =
        event.tasks.where((element) => element.isDone).length;
    emit(TodosInitialState(result, isFiltered, doneTasksCount));
  }

  void _switchFilterEvent(
      TodosSwitchFilterEvent event, Emitter<TodosState> emit) {
    add(TodosUpdateListEvent(repository.currentList,
        isFiltered: !state.isFiltered));
  }

  Future<void> _fetchEvent(
      TodosFetchEvent event, Emitter<TodosState> emit) async {
    emit(
        TodosLoadingState(state.tasks, state.isFiltered, state.doneTasksCount));
    await repository.checkSyncDataAndFetchList();
  }

  Future<void> _addEvent(TodosAddEvent event, Emitter<TodosState> emit) async {
    final nowUnixTimestamp = _nowInixTimeStamp();
    final deviceId = await _getDeviceId();

    final newTask = TaskModel(
      id: _getUiId(),
      title: event.title,
      isDone: false,
      priority: event.priorityLevel,
      createdAt: nowUnixTimestamp,
      changedAt: nowUnixTimestamp,
      deviceId: deviceId,
    );
    repository.addTask(newTask);
  }

  void _deleteEvent(TodosDeleteEvent event, Emitter<TodosState> emit) {
    repository.deleteTaskById(event.id);
  }

  void _updateEvent(TodosUpdateEvent event, Emitter<TodosState> emit) {
    final task = event.task;
    final updatedTask = event.task.copyWith(
      title: event.title ?? task.title,
      priority: event.priorityLevel ?? task.priority,
      changedAt: _nowInixTimeStamp(),
      isDone: event.isDone ?? task.isDone,
    );

    repository.updateTask(updatedTask);
  }

  void _changeStatus(TodosChangeStatusEvent event, Emitter<TodosState> emit) {
    final newTask = event.task.copyWith(isDone: event.isDone);
    add(TodosUpdateEvent(task: newTask));
  }

  _nowInixTimeStamp() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch ~/ 1000;
  }

  Future<String> _getDeviceId() async {
    var deviceInfo = await DeviceInfoPlugin().deviceInfo;

    return deviceInfo.data['id'].toString();
  }

  String _getUiId() {
    return const Uuid().v4();
  }

  @override
  Future<void> close() {
    tasksStream?.cancel();
    repository.dispose();
    return super.close();
  }
}
