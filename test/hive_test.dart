import 'package:flutter_test/flutter_test.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('database');
  });
  test('name box create and put', () async {
    final box = await Hive.openBox<String>('hwa');

    await box.add('veli');

    expect(box.values.first, 'veli');
  });

  test('theme test', () async {
    final themeBox = await Hive.openBox<bool>('theme');

    await themeBox.put('theme', true);

    expect(themeBox.get('theme'), true);
  });

  test('name box add list', () async {
    final listBox = await Hive.openBox<String>('listAdd');

    List<String> items = List.generate(100, (index) => '$index');

    await listBox.addAll(items);

    expect(listBox.values.first, '0');
  });

  test('name box put items', () async {
    final box = await Hive.openBox<String>('demos');

    List<MapEntry<String, String>> items = List.generate(100, (index) => MapEntry('$index - $index', 'veli $index'));

    await box.putAll(Map.fromEntries(items));

    expect(box.get('99 - 99'), 'veli 99');
  });
}

class DemoModel {
  final int id;
  final String name;

  DemoModel({required this.id, required this.name});
}
