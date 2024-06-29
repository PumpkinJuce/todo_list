import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app_ui_kit/components/app_theme_data.dart';
import 'package:todo_list/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/main_page/domain/bloc/todos_bloc.dart';

import 'app_router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final routerDelegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      darkTheme: ThemeData(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodosBloc(TodosRepository())),
        ],
        child: AppRouter(
          notifier: routerDelegate,
          child: Router(
            routerDelegate: routerDelegate,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ),
      ),
    );
  }
}
