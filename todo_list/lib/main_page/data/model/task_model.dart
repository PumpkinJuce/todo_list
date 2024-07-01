// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

enum PriorityLevel {
  low,

  basic,

  important
}

@freezed
class TaskModel with _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    required String id,
    @JsonKey(name: 'text') required String title,
    @JsonKey(name: 'done') required bool isDone,
    @JsonKey(name: 'importance') required PriorityLevel priority,
    @UnixDateTimeConverter() @JsonKey(name: 'deadline') DateTime? date,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'changed_at') int? changedAt,
    @JsonKey(name: 'last_updated_by') String? deviceId,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  bool get isDeadlinePassed {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    return date?.isBefore(today) ?? false;
  }
}

class UnixDateTimeConverter implements JsonConverter<DateTime?, int?> {
  const UnixDateTimeConverter();

  @override
  DateTime? fromJson(int? json) {
    if (json == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(json * 1000);
  }

  @override
  int? toJson(DateTime? object) {
    if (object == null) return null;
    return object.millisecondsSinceEpoch ~/ 1000;
  }
}
