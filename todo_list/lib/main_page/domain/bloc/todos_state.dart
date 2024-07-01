part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState(this.tasks, this.isFiltered, this.doneTasksCount);

  final List<TaskModel> tasks;
  final bool isFiltered;
  final int doneTasksCount;

  @override
  List<Object?> get props => [tasks, isFiltered, doneTasksCount];
}

class TodosInitialState extends TodosState {
  const TodosInitialState(super.tasks, super.isFiltered, super.doneTasksCount);
}

class TodosLoadingState extends TodosState {
  const TodosLoadingState(super.tasks, super.isFiltered, super.doneTasksCount);
}

class TodosErrorState extends TodosState {
  const TodosErrorState(super.tasks, super.isFiltered, super.doneTasksCount);
}
