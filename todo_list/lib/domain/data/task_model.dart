import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:todo_list/app_ui_kit/app_ui_kit.dart';

class TaskModel extends Equatable {
  const TaskModel({
    required this.title,
    required this.isDone,
    this.description,
    this.date,
    this.priority = PriorityLevel.low,
  });

  final String title;
  final String? description;
  final DateTime? date;
  final bool isDone;
  final PriorityLevel priority;

  @override
  List<Object?> get props => [
        title,
        description,
        date,
        isDone,
        priority,
      ];
}

enum PriorityLevel {
  low(0, AppColors.gray),
  medium(2, AppColors.blue),
  height(3, AppColors.red);

  const PriorityLevel(this.iconCount, this.color);
  final int iconCount;
  final Color color;
}
