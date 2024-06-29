import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

enum PriorityLevel { none, medium, heigh }

@freezed
class TaskModel with _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    required String id,
    required String title,
    required bool isDone,
    required PriorityLevel priority,
    DateTime? date,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  bool get isDeadlinePassed {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    return date?.isBefore(today) ?? false;
  }
}
