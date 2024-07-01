import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/app_ui_kit/components/app_theme_data.dart';
import 'package:todo_list/core/internal/di_configuration_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/feature/main_page/domain/bloc/todos_bloc.dart';
import '../app_router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final delegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return DIConfigurationWidget(
      builder: (context) => MaterialApp(
        theme: AppThemeData.lightTheme,
        locale: const Locale('ru'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        darkTheme: ThemeData(),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TodosBloc(
                Provider.of<TodosRepository>(context, listen: false),
              )..add(const TodosFetchEvent(true)),
            ),
          ],
          child: AppRouter(
            notifier: delegate,
            child: Router(
              routerDelegate: delegate,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          ),
        ),
      ),
    );
  }
}
