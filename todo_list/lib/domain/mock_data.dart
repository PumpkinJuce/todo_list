import 'package:todo_list/domain/data/task_model.dart';

final mockTasks = [
  const TaskModel(
    title: 'title',
    description: 'description',
    isDone: false,
    priority: PriorityLevel.low,
  ),
  TaskModel(
      title: 'New Task', description: 'description', date: DateTime.now(), isDone: true, priority: PriorityLevel.heigh),
  TaskModel(
    title: 'Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW ',
    description: 'description',
    date: DateTime.now(),
    isDone: false,
    priority: PriorityLevel.medium,
  ),
  const TaskModel(
    title: 'title',
    description: 'description',
    priority: PriorityLevel.low,
    isDone: true,
  ),
  const TaskModel(
    title: 'title',
    description: 'description',
    priority: PriorityLevel.low,
    isDone: false,
  ),
  TaskModel(
      title: 'New Task', description: 'description', date: DateTime.now(), isDone: true, priority: PriorityLevel.heigh),
  TaskModel(
    title: 'Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW ',
    description: 'description',
    date: DateTime.now(),
    isDone: false,
    priority: PriorityLevel.medium,
  ),
  const TaskModel(
    title: 'title',
    description: 'description',
    priority: PriorityLevel.low,
    isDone: true,
  ),
  const TaskModel(
    title: 'title',
    description: 'description',
    priority: PriorityLevel.low,
    isDone: false,
  ),
  TaskModel(
      title: 'New Task', description: 'description', date: DateTime.now(), isDone: true, priority: PriorityLevel.heigh),
  TaskModel(
    title: 'Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW Old TASK BUT MOW ',
    description: 'description',
    date: DateTime.now(),
    isDone: false,
    priority: PriorityLevel.medium,
  ),
  const TaskModel(
    title: 'title',
    description: 'description',
    priority: PriorityLevel.low,
    isDone: true,
  ),
];
