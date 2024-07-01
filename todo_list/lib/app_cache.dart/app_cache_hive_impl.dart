import 'package:hive/hive.dart';
import 'package:todo_list/app_cache.dart/app_cache.dart';
import 'package:todo_list/app_cache.dart/cache_table_names.dart';

class HiveAppCache extends AppCache {
  const HiveAppCache();

  @override
  Future<void> initBoxes(List<CacheTables> listNames) async {
    for (final element in listNames) {
      await Hive.openBox(element.name);
    }
  }

  @override
  dynamic getData(CacheTables table, String key) {
    final box = Hive.box(table.name);
    final value = box.get(key);

    if (value is List) {
      return value.map((e) => Map<String, dynamic>.from(e)).toList();
    } else if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return value;
  }

  @override
  Future<void> putData(CacheTables table, String key, dynamic value) async {
    final box = Hive.box(table.name);
    await box.put(key, value);
  }

  @override
  Future<void> deleteData(CacheTables table, String key) async {
    var box = Hive.box(table.name);
    await box.delete(key);
  }

  @override
  Stream<BoxEvent> listen(CacheTables table, [String? key]) {
    var box = Hive.box(table.name);
    return box.watch(key: key);
  }
}
