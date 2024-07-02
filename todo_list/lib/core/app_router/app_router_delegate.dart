import 'package:go_router/go_router.dart';
import 'package:todo_list/feature/error_screen/error_screen.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/presentation/main_page.dart';
import 'package:todo_list/feature/new_task_page/presentation/new_task_page.dart';

class AppRouterDelegate {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/task',
        builder: (context, state) {
          final task = state.extra as TaskModel?;
          return NewTaskPage(task: task);
        },
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
