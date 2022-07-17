import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../modules/auth/controllers/authentication_manager.dart';
import '../config/api.dart';
import '../models/user_model.dart';

class UserService extends GetConnect {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(Api().getUser));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
  }

  Future<String> userRegis(UserModel user, String pass) async {
    var _response = await http.post(Uri.parse(Api().getUser), body: {
      "email": user.email,
      "password": pass,
      "name": user.name,
      "address": user.address,
      "phone": user.phone,
      "lahir": user.lahir,
      "pekerjaan": user.pekerjaan,
    });

    // print(_response.body);
    var data = json.decode(_response.body);
    if (data['responsecode'] == '1') {
      UserModel user = UserModel.fromJson(json.decode(_response.body)['data']);

      // login(user.id.toString());
      _authManager.login(user.id.toString());

      // await Get.offAndToNamed(Routes.HOME);
    }

    return data["responsemsg"];
  }

  Future<UserModel> getUser() async {
    final response = await http
        .get(Uri.parse(Api().getUser + '/' + _authManager.getToken()!));

    var data = json.decode(response.body);
    UserModel user = UserModel.fromJson(json.decode(response.body)['data']);
    return user;
  }
}
