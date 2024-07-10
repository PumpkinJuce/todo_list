import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app_http_client/app_http_client.dart';
import 'package:todo_list/app_ui_kit/components/app_theme_data.dart';
import 'package:todo_list/main_page/data/data_provider/todo_cache_data_provider.dart';
import 'package:todo_list/main_page/data/data_provider/todo_data_provider.dart';
import 'package:todo_list/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/main_page/domain/bloc/todos_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app_router/app_router.dart';

class App extends StatelessWidget {
  App(this._todoCacheDataProvider, {super.key});

  final TodoCacheDataProvider _todoCacheDataProvider;

  final routerDelegate = AppRouterDelegate();
  final apiHttpClient = AppHttpClient();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AppHttpClient>(create: (context) => apiHttpClient),
          RepositoryProvider<TodosRepository>(
            create: (context) => TodosRepository(
              TodoDataProvider(apiHttpClient),
              _todoCacheDataProvider,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  TodosBloc(RepositoryProvider.of<TodosRepository>(context))
                    ..add(const TodosFetchEvent(true)),
            ),
          ],
          child: AppRouter(
            notifier: routerDelegate,
            child: Router(
              routerDelegate: routerDelegate,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          ),
        ),
      ),
    );
  }
}
