// To parse this JSON data, do
//
//     final laporanModel = laporanModelFromJson(jsonString);

import 'dart:convert';

import 'penyakit.dart';
import 'user_model.dart';

LaporanModel laporanModelFromJson(String str) =>
    LaporanModel.fromJson(json.decode(str));

String laporanModelToJson(LaporanModel data) => json.encode(data.toJson());

class LaporanModel {
  LaporanModel({
    this.id,
    this.penyakitId,
    this.userId,
    this.cf,
    this.tanggal,
    this.penyakit,
    this.user,
  });

  int? id;
  int? penyakitId;
  int? userId;
  String? cf;
  String? tanggal;
  Penyakit? penyakit;
  UserModel? user;

  factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
        id: json["id"],
        penyakitId: json["penyakit_id"],
        userId: json["user_id"],
        cf: json["cf"],
        tanggal: (json["tanggal"]),
        penyakit: Penyakit.fromJson(json["penyakit"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakit_id": penyakitId,
        "user_id": userId,
        "cf": cf,
        "tanggal": tanggal,
        "penyakit": penyakit!.toJson(),
        "user": user!.toJson(),
      };
}
