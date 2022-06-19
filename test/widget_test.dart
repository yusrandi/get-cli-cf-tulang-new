import 'dart:convert';

import 'package:getx_tulang_cf/app/data/config/api.dart';
import 'package:http/http.dart' as http;

void main() async {
  print('hahahahha');
  var _response = await http.get(Uri.parse(Api().getUser));

  List data = (json.decode(_response.body) as Map<String, dynamic>)["data"];
  print(data);
}
