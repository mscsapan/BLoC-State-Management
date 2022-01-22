import 'package:bloc_library/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserNetwork {
  final String uri = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<UserModel>> getUser() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final users = userModelFromJson(response.body);
      debugPrint('${users.length}');
      return users;
    } else {
      throw Exception('Something is wrong');
    }
  }
}
