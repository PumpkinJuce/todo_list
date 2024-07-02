import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/internal/app.dart';
import 'package:todo_list/core/internal/di_configuration_widget.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/feature/main_page/domain/bloc/todos_bloc.dart';
import '../app_router/app_router.dart';

class AppConfiguration extends StatelessWidget {
  AppConfiguration({super.key});

  final delegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return DIConfigurationWidget(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodosBloc(
              Provider.of<TodosRepository>(context, listen: false),
            )..add(const TodosFetchEvent(true)),
          ),
        ],
        child: AppRouter(
          router: AppRouterDelegate.router,
          child: const App(),
        ),
      ),
    );
  }
}
