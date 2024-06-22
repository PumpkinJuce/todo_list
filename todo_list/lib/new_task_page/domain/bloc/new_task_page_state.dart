part of 'new_task_page_bloc.dart';

abstract class NewTaskPageState extends Equatable {
  final bool isButtonActive;
  final DateTime? deadlineDate;
  final PriorityLevel priorityLevel;

  const NewTaskPageState({
    required this.isButtonActive,
    required this.priorityLevel,
    this.deadlineDate,
  });

  @override
  List<Object?> get props => [isButtonActive, deadlineDate, priorityLevel];

  NewTaskPageState copyWith(
      {bool? isButtonActive,
      DateTime? deadlineDate,
      PriorityLevel? priorityLevel});
}

class NewTaskPageInitialState extends NewTaskPageState {
  const NewTaskPageInitialState({
    required super.isButtonActive,
    required super.priorityLevel,
    super.deadlineDate,
  });

  @override
  NewTaskPageInitialState copyWith(
      {bool? isButtonActive,
      DateTime? deadlineDate,
      PriorityLevel? priorityLevel}) {
    return NewTaskPageInitialState(
      isButtonActive: isButtonActive ?? this.isButtonActive,
      deadlineDate: deadlineDate ?? this.deadlineDate,
      priorityLevel: priorityLevel ?? this.priorityLevel,
    );
  }
}

// class NewTaskPageLoadedState extends NewTaskPageState {
//   const NewTaskPageLoadedState({
//     required super.hasDeadline,
//     super.deadlineDate,
//   }) : super(isButtonActive: true);
// }

// class NewTaskPageChooseDateState extends NewTaskPageState {
//   const NewTaskPageChooseDateState({
//     required super.isButtonActive,
//     super.deadlineDate,
//   });

//   @override
//   NewTaskPageChooseDateState copyWith({bool? isButtonActive, DateTime? deadlineDate}) {
//     return NewTaskPageChooseDateState(
//       isButtonActive: isButtonActive ?? this.isButtonActive,
//       deadlineDate: deadlineDate ?? this.deadlineDate,
//     );
//   }
// }
