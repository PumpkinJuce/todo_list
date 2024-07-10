import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/app.dart';
import 'package:todo_list/app_cache.dart/app_cache_hive_impl.dart';
import 'package:todo_list/app_cache.dart/cache_table_names.dart';
import 'package:todo_list/main_page/data/data_provider/todo_cache_data_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(CacheTables.todoList.name);
  const todoCache = TodoCacheDataProvider(HiveAppCache());

  runApp(App(todoCache));
}
