// To parse this JSON data, do
//
//     final penyakit = penyakitFromJson(jsonString);

import 'dart:convert';

Penyakit penyakitFromJson(String str) => Penyakit.fromJson(json.decode(str));

String penyakitToJson(Penyakit data) => json.encode(data.toJson());

class Penyakit {
  Penyakit({
    this.id,
    this.penyakitKode,
    this.penyakitNama,
    this.status,
  });

  int? id;
  String? penyakitKode;
  String? penyakitNama;
  String? status;

  factory Penyakit.fromJson(Map<String, dynamic> json) => Penyakit(
        id: json["id"],
        penyakitKode: json["penyakit_kode"],
        penyakitNama: json["penyakit_nama"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakit_kode": penyakitKode,
        "penyakit_nama": penyakitNama,
        "status": status,
      };
}
