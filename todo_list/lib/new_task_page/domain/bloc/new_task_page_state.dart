part of 'new_task_page_bloc.dart';

abstract class NewTaskPageState extends Equatable {
  final bool isButtonActive;
  final DateTime? deadlineDate;

  const NewTaskPageState({
    required this.isButtonActive,
    this.deadlineDate,
  });

  @override
  List<Object?> get props => [isButtonActive, deadlineDate];

  NewTaskPageState copyWith({bool? isButtonActive, DateTime? deadlineDate});
}

class NewTaskPageInitialState extends NewTaskPageState {
  const NewTaskPageInitialState({required super.isButtonActive, super.deadlineDate});

  @override
  NewTaskPageInitialState copyWith({bool? isButtonActive, DateTime? deadlineDate}) {
    return NewTaskPageInitialState(
      isButtonActive: isButtonActive ?? this.isButtonActive,
      deadlineDate: deadlineDate ?? this.deadlineDate,
    );
  }
}

// class NewTaskPageLoadedState extends NewTaskPageState {
//   const NewTaskPageLoadedState({
//     required super.hasDeadline,
//     super.deadlineDate,
//   }) : super(isButtonActive: true);
// }

class NewTaskPageChooseDateState extends NewTaskPageState {
  const NewTaskPageChooseDateState({
    required super.isButtonActive,
    super.deadlineDate,
  });

  @override
  NewTaskPageChooseDateState copyWith({bool? isButtonActive, DateTime? deadlineDate}) {
    return NewTaskPageChooseDateState(
      isButtonActive: isButtonActive ?? this.isButtonActive,
      deadlineDate: deadlineDate ?? this.deadlineDate,
    );
  }
}
