import 'package:hive/hive.dart';
import 'package:todo_list/core/app_cache.dart/cache_table_names.dart';

abstract class AppCache {
  const AppCache();

  Future<void> initBoxes(List<CacheTables> listNames);

  dynamic getData(CacheTables table, String key);

  Future<void> putData(CacheTables table, String key, dynamic value);

  Future<void> deleteData(CacheTables table, String key);

  Stream<BoxEvent> listen(CacheTables table, [String? key]);
}
