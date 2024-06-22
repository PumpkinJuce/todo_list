import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';
import 'package:todo_list/main_page/data/repository/todos_repository.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc(this.repository) : super(const TodosInitialState([], false, 0)) {
    on<TodosGetEvent>(_getEvent);
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
    final result = isFiltered ? event.tasks.where((element) => !element.isDone).toList() : event.tasks;
    final doneTasksCount = event.tasks.where((element) => element.isDone).length;
    emit(TodosInitialState(result, isFiltered, doneTasksCount));
  }

  void _switchFilterEvent(TodosSwitchFilterEvent event, Emitter<TodosState> emit) {
    add(TodosUpdateListEvent(repository.currentList, isFiltered: !state.isFiltered));
  }

  void _getEvent(TodosGetEvent event, Emitter<TodosState> emit) {
    final currentList = repository.currentList;
    add(TodosUpdateListEvent(currentList));
  }

  void _addEvent(TodosAddEvent event, Emitter<TodosState> emit) {
    repository.addTask(event.task);
  }

  void _deleteEvent(TodosDeleteEvent event, Emitter<TodosState> emit) {
    repository.deleteTaskById(event.id);
  }

  void _updateEvent(TodosUpdateEvent event, Emitter<TodosState> emit) {
    repository.updateTask(event.task);
  }

  void _changeStatus(TodosChangeStatusEvent event, Emitter<TodosState> emit) {
    final newTask = event.task.copyWith(isDone: event.isDone);
    add(TodosUpdateEvent(newTask));
  }

  @override
  Future<void> close() {
    tasksStream?.cancel();
    return super.close();
  }
}
