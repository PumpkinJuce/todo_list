part of 'new_task_page_bloc.dart';

abstract class NewTaskPageEvent extends Equatable {
  const NewTaskPageEvent();

  @override
  List<Object?> get props => [];
}

class NewTasPageActivateButtonEvent extends NewTaskPageEvent {
  const NewTasPageActivateButtonEvent();
}

class NewTasPageChooseDateEvent extends NewTaskPageEvent {
  const NewTasPageChooseDateEvent(this.date, {this.hasDeadline = true});

  final DateTime? date;
  final bool hasDeadline;

  @override
  List<Object?> get props => [date];
}

class NewTasPageChoosePriorityLevelEvent extends NewTaskPageEvent {
  const NewTasPageChoosePriorityLevelEvent(this.priorityLevel);

  final PriorityLevel priorityLevel;

  @override
  List<Object?> get props => [priorityLevel];
}
