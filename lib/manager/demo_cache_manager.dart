import 'package:hivecache/home/model/demo_model.dart';
import 'package:hivecache/manager/user_cache_manager.dart';

class DemoCacheManager extends ICacheManager<DemoModel> {
  DemoCacheManager(super.key);

  @override
  Future<void> addItems(List items) {
    // TODO: implement addItems
    throw UnimplementedError();
  }

  @override
  getItem(String key) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> putItem(String key, item) {
    // TODO: implement putItem
    throw UnimplementedError();
  }

  @override
  Future<void> putItems(List items) {
    // TODO: implement putItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(String key) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }
  
  @override
  List<DemoModel>? getValues() {
    // TODO: implement getValues
    throw UnimplementedError();
  }
  
  @override
  void registerAdapters() {
    // TODO: implement registerAdapters
  }
}
