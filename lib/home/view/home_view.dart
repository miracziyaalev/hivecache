import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivecache/home/service/home_view_service.dart';
import 'package:hivecache/manager/user_cache_manager.dart';
import 'package:hivecache/search/view/search_view.dart';
import 'package:kartal/kartal.dart';

import '../model/user_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final IHomeService _homeService;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  List<UserModel>? _items;
  late final ICacheManager<UserModel> _cacheManager;

  @override
  void initState() {
    _homeService = HomeService(Dio(BaseOptions(baseUrl: _baseUrl)));
    _cacheManager = UserCacheManager('userCacheNew2');
    fetchDatas();
    super.initState();
  }

  Future<void> fetchDatas() async {
    await Hive.initFlutter();
    await _cacheManager.init();
    //await _cacheManager.clearAll();

    if (_cacheManager.getValues()?.isNotEmpty ?? false) {
      _items = _cacheManager.getValues();
    } else {
      _items = await _homeService.fetchUsers();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.navigateToPage(SearchView(model: _cacheManager));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('aa'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if ((_items?.isNotEmpty) ?? false) {
            await _cacheManager.putItems(_items!);
            final cacheItems = _cacheManager.getValues();
            print(cacheItems);
            print('onTapped');
          }
        },
      ),
      body: (_items?.isNotEmpty ?? false)
          ? ListView.builder(
              itemCount: _items?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(child: ListTile(title: Text(_items?[index].name ?? '')));
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
