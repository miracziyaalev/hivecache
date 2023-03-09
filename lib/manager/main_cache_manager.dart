import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<T>? _box;

  ICacheManager(this.key);

  Future<void> init() async {
    if (!(_box?.isOpen ?? true)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);
  T? getItem(String key);
  Future<void> putItem(String key, T item);
  Future<void> removeItem(String key);
  Future<void> clearAll() async {
  await _box?.clear();
  }
}