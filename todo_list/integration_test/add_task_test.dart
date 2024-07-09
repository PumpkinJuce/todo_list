import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_list/core/app_router/app_router.dart';
import 'package:todo_list/core/internal/app.dart';
import 'package:todo_list/feature/main_page/data/model/task_model.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/feature/main_page/domain/bloc/todos_bloc.dart';
import 'package:todo_list/feature/main_page/presentation/main_page.dart';
import 'package:todo_list/feature/main_page/presentation/widgets/priority_indicator.dart';
import 'package:todo_list/feature/new_task_page/presentation/new_task_page.dart';

import '../test/feature/main_page/data/data_provider/todo_cache_data_provider_test/todo_cache_data_provider_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockTodosRepositoryImpl todosRepository;
  final BehaviorSubject<List<TaskModel>> todosStream =
      BehaviorSubject<List<TaskModel>>.seeded([]);
  late TodosBloc todosBloc;

  setUp(() {
    todosRepository = MockTodosRepositoryImpl();
    when(todosRepository.todoListStream).thenAnswer((_) => todosStream.stream);

    when(todosRepository.addTask(any)).thenAnswer((invocation) async {
      final task = invocation.positionalArguments[0] as TaskModel;
      final currentTasks = List<TaskModel>.from(todosStream.value);
      currentTasks.add(task);
      todosStream.add(currentTasks);
    });

    todosBloc = TodosBloc(todosRepository);
  });

  testWidgets('Add task and see it in the list on MainPage',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      mockDiConfigurationWidget(todosRepository, todosBloc),
    );

    final Finder addTaskButton = find.byWidgetPredicate(
      (widget) => widget is FloatingActionButton,
    );

    await widgetTester.tap(addTaskButton);
    await widgetTester.pumpAndSettle();

    expect(find.byType(NewTaskPage), findsOneWidget);

    // Find the TextField and enter text
    final Finder taskTextField = find.byType(TextField);
    const String taskText = 'New Task';

    await widgetTester.enterText(taskTextField, taskText);

    // Find the save button and tap it
    final Finder saveButton = find.byKey(const Key('save_button'));
    await widgetTester.tap(saveButton);
    await widgetTester.pumpAndSettle();

    // Verify navigation to the MainPage
    expect(find.byType(MainPage), findsOneWidget);

    // Verify the task  in the list
    expect(find.text(taskText), findsOneWidget);

    final Finder priorityIndicatorFinder = find.byType(PriorityIndicator);
    final PriorityIndicator indicator =
        widgetTester.widget<PriorityIndicator>(priorityIndicatorFinder);
    // Verify the task  PriorityIndicator widget
    expect(priorityIndicatorFinder, findsOneWidget);

    // Verify the PriorityLevel
    expect(indicator.level, PriorityLevel.low);
  });
}

Widget mockDiConfigurationWidget(
    MockTodosRepositoryImpl todosRepository, TodosBloc todosBloc) {
  return MultiProvider(
    providers: [
      Provider<TodosRepository>(create: (_) => todosRepository),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => todosBloc,
        ),
      ],
      child: AppRouter(
        router: AppRouterDelegate.router,
        child: const App(),
      ),
    ),
  );
}
