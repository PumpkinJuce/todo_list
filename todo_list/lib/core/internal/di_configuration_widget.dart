import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/app_cache.dart/app_cache.dart';
import 'package:todo_list/core/app_cache.dart/app_cache_hive_impl.dart';
import 'package:todo_list/core/app_http_client/app_http_client.dart';
import 'package:todo_list/feature/main_page/data/data_provider/todo_cache_data_provider.dart';
import 'package:todo_list/feature/main_page/data/data_provider/todo_data_provider.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository.dart';
import 'package:todo_list/feature/main_page/data/repository/todos_repository_impl.dart';

class DIConfigurationWidget extends StatelessWidget {
  const DIConfigurationWidget({
    required this.builder,
    super.key,
  });
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppHttpClient>(create: (_) => AppHttpClient()),
        Provider<AppCache>(create: (_) => const HiveAppCache()),
        ProxyProvider<AppCache, TodoCacheDataProvider>(
          update: (_, appCache, __) => TodoCacheDataProvider(appCache),
        ),
        ProxyProvider<AppHttpClient, TodoDataProvider>(
          update: (_, appHttpClient, __) => TodoDataProvider(appHttpClient),
        ),
        ProxyProvider2<TodoDataProvider, TodoCacheDataProvider,
            TodosRepository>(
          update: (_, todoDataProvider, todoCacheDataProvider, __) =>
              TodosRepositoryImpl(
            todoDataProvider,
            todoCacheDataProvider,
          ),
        ),
      ],
      child: Builder(builder: builder),
    );
  }
}
