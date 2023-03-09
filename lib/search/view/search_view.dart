// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hivecache/manager/user_cache_manager.dart';

import '../../home/model/user_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ICacheManager<UserModel> model;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    List<UserModel> items = [];

    void findAndSet(String key) {
      items = widget.model
              .getValues()
              ?.where((element) => element.name?.toLowerCase().contains(key.toLowerCase()) ?? false)
              .toList() ??
          [];
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            findAndSet(value);
          },
        ),
      ),
      body: Center(child: Text(items.map((e) => '${e.name} - ${e.company}').join(','))),
    );
  }
}
