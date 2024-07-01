import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/main_page/data/model/task_model.dart';

part 'new_task_page_event.dart';
part 'new_task_page_state.dart';

class NewTaskPageBloc extends Bloc<NewTaskPageEvent, NewTaskPageState> {
  NewTaskPageBloc()
      : super(const NewTaskPageInitialState(
          isButtonActive: false,
          priorityLevel: PriorityLevel.low,
        )) {
    on<NewTasPageActivateButtonEvent>(_activateButtonEvent);
    on<NewTasPageChooseDateEvent>(_chooseDateEvent);
    on<NewTasPageChoosePriorityLevelEvent>(_choosePriorityLevelEvent);
  }

  void _activateButtonEvent(
      NewTasPageActivateButtonEvent event, Emitter<NewTaskPageState> emit) {
    if (!state.isButtonActive) {
      emit(state.copyWith(isButtonActive: true));
    }
  }

  void _chooseDateEvent(
      NewTasPageChooseDateEvent event, Emitter<NewTaskPageState> emit) {
    if (!event.hasDeadline) {
      emit(NewTaskPageInitialState(
          isButtonActive: state.isButtonActive,
          priorityLevel: state.priorityLevel));
    } else {
      emit(state.copyWith(deadlineDate: event.date));
    }
  }

  void _choosePriorityLevelEvent(NewTasPageChoosePriorityLevelEvent event,
      Emitter<NewTaskPageState> emit) {
    emit(state.copyWith(priorityLevel: event.priorityLevel));
  }
}
