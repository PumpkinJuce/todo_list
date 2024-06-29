part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object?> get props => [];
}

class TodosFetchEvent extends TodosEvent {
  const TodosFetchEvent(this.showAllTasks);

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
  const TodosAddEvent({
    required this.title,
    required this.date,
    required this.priorityLevel,
  });

  final String title;
  final DateTime? date;
  final PriorityLevel priorityLevel;

  @override
  List<Object?> get props => [title, date, priorityLevel];
}

class TodosDeleteEvent extends TodosEvent {
  const TodosDeleteEvent(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

class TodosUpdateEvent extends TodosEvent {
  const TodosUpdateEvent({
    required this.task,
    this.date,
    this.priorityLevel,
    this.title,
    this.isDone,
  });

  final TaskModel task;
  final String? title;
  final DateTime? date;
  final PriorityLevel? priorityLevel;
  final bool? isDone;

  @override
  List<Object?> get props => [task, title, date, priorityLevel, isDone];
}

class TodosChangeStatusEvent extends TodosEvent {
  const TodosChangeStatusEvent(this.task, this.isDone);

  final TaskModel task;
  final bool isDone;

  @override
  List<Object?> get props => [task, isDone];
}
