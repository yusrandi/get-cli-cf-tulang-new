import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../modules/auth/controllers/authentication_manager.dart';
import '../config/api.dart';
import '../models/user_model.dart';

class AuthService extends GetConnect {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<String> loginUser(String phone, String password) async {
    var _response = await http.post(Uri.parse(Api().getUser + '/login'), body: {
      "phone": phone,
      "password": password,
    });

    print(_response);

    var data = json.decode(_response.body);
    print(data['responsecode']);
    if (data['responsecode'] == '1') {
      UserModel user = UserModel.fromJson(json.decode(_response.body)['user']);

      // login(user.id.toString());
      _authManager.login(user.id.toString());

      // await Get.offAndToNamed(Routes.HOME);
    }
    return data['responsemsg'];
  }
}
