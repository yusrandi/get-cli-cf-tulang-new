// To parse this JSON data, do
//
//     final basisModel = basisModelFromJson(jsonString);

import 'dart:convert';

import 'gejala.dart';

BasisModel basisModelFromJson(String str) =>
    BasisModel.fromJson(json.decode(str));

String basisModelToJson(BasisModel data) => json.encode(data.toJson());

class BasisModel {
  BasisModel(
      {this.id, this.penyakitId, this.gejalaId, this.bobot, this.gejala});

  int? id;
  int? penyakitId;
  int? gejalaId;
  String? bobot;
  Gejala? gejala;

  factory BasisModel.fromJson(Map<String, dynamic> json) => BasisModel(
        id: json["id"],
        penyakitId: json["penyakit_id"],
        gejalaId: json["gejala_id"],
        bobot: (json["bobot"]),
        gejala: Gejala.fromJson(json["gejala"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakit_id": penyakitId,
        "gejala_id": gejalaId,
        "bobot": bobot,
        "gejala": gejala!.toJson(),
      };
}
