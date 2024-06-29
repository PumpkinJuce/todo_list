part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object?> get props => [];
}

class TodosGetEvent extends TodosEvent {
  const TodosGetEvent(this.showAllTasks);

  final bool showAllTasks;

  @override
  List<Object?> get props => [showAllTasks];
}

class TodosUpdateListEvent extends TodosEvent {
  const TodosUpdateListEvent(this.tasks, {this.isFiltered});

  final List<TaskModel> tasks;
  final bool? isFiltered;

  @override
  List<Object?> get props => [tasks, isFiltered];
}

class TodosSwitchFilterEvent extends TodosEvent {
  const TodosSwitchFilterEvent();
}

class TodosAddEvent extends TodosEvent {
  const TodosAddEvent(this.task);

  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TodosDeleteEvent extends TodosEvent {
  const TodosDeleteEvent(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

class TodosUpdateEvent extends TodosEvent {
  const TodosUpdateEvent(this.task);

  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class TodosChangeStatusEvent extends TodosEvent {
  const TodosChangeStatusEvent(this.task, this.isDone);

  final TaskModel task;
  final bool isDone;

  @override
  List<Object?> get props => [task, isDone];
}
