import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';
import '../models/user_model.dart';

class UserService extends GetConnect {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(Api().getUser));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
  }
}
