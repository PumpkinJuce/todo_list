import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_task_page_event.dart';
part 'new_task_page_state.dart';

class NewTaskPageBloc extends Bloc<NewTaskPageEvent, NewTaskPageState> {
  NewTaskPageBloc() : super(const NewTaskPageInitialState(isButtonActive: false)) {
    on<NewTasPageActivateButtonEvent>(_activateButtonEvent);
    on<NewTasPageChooseDateEvent>(_chooseDateEvent);
  }

  void _activateButtonEvent(NewTasPageActivateButtonEvent event, Emitter<NewTaskPageState> emit) {
    if (!state.isButtonActive) {
      emit(state.copyWith(isButtonActive: true));
    }
  }

  void _chooseDateEvent(NewTasPageChooseDateEvent event, Emitter<NewTaskPageState> emit) {
    if (event.hasDeadline) {
      emit(NewTaskPageChooseDateState(isButtonActive: state.isButtonActive, deadlineDate: event.date));
    } else {
      emit(NewTaskPageInitialState(isButtonActive: state.isButtonActive, deadlineDate: null));
    }
  }
}
