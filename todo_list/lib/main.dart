import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/core/internal/app_configuration.dart';
import 'package:todo_list/core/app_cache.dart/cache_table_names.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(CacheTables.todoList.name);

  runApp(AppConfiguration());
}
