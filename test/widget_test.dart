import 'dart:convert';

import 'package:getx_tulang_cf/app/data/config/api.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:getx_tulang_cf/app/data/services/auth_service.dart';
import 'package:http/http.dart' as http;

void main() async {
  var _response = await http.post(Uri.parse(Api().getUser + '/login'), body: {
    "phone": "000",
    "password": "87654321",
  });

  var data = json.decode(_response.body);
  print(data);
  UserModel user = UserModel.fromJson(json.decode(_response.body)['user']);
  print(user.name);

  if (data['responsecode'] == 1) {
    // login(user.id.toString());
    // _authManager.login(user.id.toString());

    // await Get.offAndToNamed(Routes.HOME);

    print(user.name);
  } else {
    print(data['responsecode']);
  }
}
