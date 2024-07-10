import 'package:todo_list/feature/main_page/data/model/task_model.dart';

List<dynamic> taskModelListMock({bool jsonFormat = true}) => [
      const TaskModel(
              id: '1',
              title: 'Title1',
              isDone: false,
              priority: PriorityLevel.important)
          .toJson(),
      const TaskModel(
              id: '2',
              title: 'Title2',
              isDone: true,
              priority: PriorityLevel.basic)
          .toJson(),
      const TaskModel(
              id: '3',
              title: 'Title3',
              isDone: false,
              priority: PriorityLevel.low)
          .toJson(),
    ];
