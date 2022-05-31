import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';
import '../models/penyakit.dart';

class PenyakitService extends GetConnect {
  Future<List<Penyakit>> fetchPenyakit() async {
    final response = await http.get(Uri.parse(Api.instance.getPenyakits));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Penyakit.fromJson(e)).toList();
    }
  }
}
