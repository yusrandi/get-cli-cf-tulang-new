// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.roleId,
    this.pekerjaan,
    this.lahir,
    this.email,
  });

  int? id;
  String? name;
  String? address;
  String? phone;
  String? pekerjaan;
  String? lahir;
  String? email;
  int? roleId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        roleId: json["role_id"],
        pekerjaan: json["pekerjaan"],
        lahir: json["lahir"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "role_id": roleId,
        "pekerjaan": pekerjaan,
        "lahir": lahir,
        "email": email,
      };
}
