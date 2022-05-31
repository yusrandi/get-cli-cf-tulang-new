// To parse this JSON data, do
//
//     final gejala = gejalaFromJson(jsonString);

import 'dart:convert';

Gejala gejalaFromJson(String str) => Gejala.fromJson(json.decode(str));

String gejalaToJson(Gejala data) => json.encode(data.toJson());

class Gejala {
  Gejala({
    this.id,
    this.gejalaKode,
    this.gejalaNama,
    this.status,
  });

  int? id;
  String? gejalaKode;
  String? gejalaNama;
  String? status;

  factory Gejala.fromJson(Map<String, dynamic> json) => Gejala(
        id: json["id"],
        gejalaKode: json["gejala_kode"],
        gejalaNama: json["gejala_nama"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gejala_kode": gejalaKode,
        "gejala_nama": gejalaNama,
        "status": status,
      };
}
