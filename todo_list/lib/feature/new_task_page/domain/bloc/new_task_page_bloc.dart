import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository.dart';

part 'new_task_page_event.dart';
part 'new_task_page_state.dart';

class NewTaskPageBloc extends Bloc<NewTaskPageEvent, NewTaskPageState> {
  NewTaskPageBloc(this.repository)
      : super(const NewTaskPageInitialState(
          isButtonActive: false,
          priorityLevel: PriorityLevel.low,
        )) {
    on<NewTasPageInit>(_init);
    on<NewTasPageActivateButtonEvent>(_activateButtonEvent);
    on<NewTasPageChooseDateEvent>(_chooseDateEvent);
    on<NewTasPageChoosePriorityLevelEvent>(_choosePriorityLevelEvent);
    on<NewTasPageSetUpInitialData>(_setUpInitialData);
    on<NewTasPageLoadTaskById>(_loadTaskById);
  }

  final TodosRepository repository;

  final controller = TextEditingController();

  void _init(NewTasPageInit event, Emitter<NewTaskPageState> emit) {
    emit(const NewTaskPageLoadingState());
    if (event.task != null) {
      add(NewTasPageSetUpInitialData(event.task!));
    } else if (event.taskId != null) {
      add(NewTasPageLoadTaskById(event.taskId!));
    } else {
      emit(
        const NewTaskPageInitialState(
          isButtonActive: false,
          priorityLevel: PriorityLevel.low,
        ),
      );
    }
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

  void _setUpInitialData(
      NewTasPageSetUpInitialData event, Emitter<NewTaskPageState> emit) {
    emit(
      const NewTaskPageInitialState(
        isButtonActive: false,
        priorityLevel: PriorityLevel.low,
      ),
    );
    controller.text = event.task.title;
    add(NewTasPageChooseDateEvent(event.task.date));
    add(NewTasPageChoosePriorityLevelEvent(event.task.priority));
  }

  Future<void> _loadTaskById(
      NewTasPageLoadTaskById event, Emitter<NewTaskPageState> emit) async {
    final task =
        await repository.getTaskById(event.taskId, checkFromCache: true);
    if (task != null) {
      add(NewTasPageSetUpInitialData(task));
    }
  }
}
