import 'package:equatable/equatable.dart';

enum PriorityLevel { low, medium, heigh }

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
