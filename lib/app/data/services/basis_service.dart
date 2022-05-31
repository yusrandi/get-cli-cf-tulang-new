import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';
import '../models/basis.dart';

class BasisService extends GetConnect {
  Future<List<BasisModel>> fetchBasis() async {
    final response = await http.get(Uri.parse(Api.instance.getBasis));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => BasisModel.fromJson(e)).toList();
    }
  }
}
