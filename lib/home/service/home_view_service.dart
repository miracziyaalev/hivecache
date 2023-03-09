// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hivecache/home/model/user_model.dart';

// https://jsonplaceholder.typicode.com/users

abstract class IHomeService {
  late final Dio _dio;
  IHomeService(Dio dio) {
    _dio = dio;
  }

  Future<List<UserModel>?> fetchUsers();
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<List<UserModel>?> fetchUsers() async {
    final response = await _dio.get(Query.users.name);
    if (response.statusCode == HttpStatus.ok) {
      final responses = response.data;
      if (responses is List) {
        return responses.map((e) => UserModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum Query {
  users,
}
