import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';
import '../models/gejala.dart';

class GejalaService extends GetConnect {
  Future<List<Gejala>> fetchGejala() async {
    final response = await http.get(Uri.parse(Api.instance.getGejalas));
    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Gejala.fromJson(e)).toList();
    }
  }
}
