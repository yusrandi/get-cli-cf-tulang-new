import 'dart:convert';

import 'package:getx_tulang_cf/app/data/config/api.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:getx_tulang_cf/app/data/services/user_service.dart';

import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(Uri.parse(Api.instance.getGejalas));

  print(response.headers);
}

generateRule() {
  var a = ['CT01', 'CT02', 'CT03', 'CT04', 'GT06'];
  print('Penyakit Osteoporosis');
  print('Gejala-Gejala : ');
  a.forEach((element) {
    print(element);
  });

  for (var i = 0; i < a.length; i++) {
    for (var x = 0; x < i; x++) {
      print('IF ${a[i]} AND ${a[x]}');
      for (var y = 0; y < x; y++) {
        print('IF ${a[i]} AND ${a[x]} AND ${a[y]}');
        for (var z = 0; z < y; z++) {
          print('IF ${a[i]} AND ${a[x]} AND ${a[y]} AND ${a[z]}');
          for (var b = 0; b < z; b++) {
            print('IF ${a[i]} AND ${a[x]} AND ${a[y]} AND ${a[z]} AND ${a[b]}');
            for (var c = 0; c < b; c++) {
              print(
                  'IF ${a[i]} AND ${a[x]} AND ${a[y]} AND ${a[z]} AND ${a[b]} AND ${a[c]}');
            }
          }
        }
      }
    }
  }
}
