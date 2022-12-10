// To parse this JSON data, do
//
//     final firebaseLoginInputModel = firebaseLoginInputModelFromJson(jsonString);

import 'dart:convert';

FirebaseLoginInputModel firebaseLoginInputModelFromJson(String str) =>
    FirebaseLoginInputModel.fromJson(json.decode(str));

String firebaseLoginInputModelToJson(FirebaseLoginInputModel data) =>
    json.encode(data.toJson());

class FirebaseLoginInputModel {
  FirebaseLoginInputModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory FirebaseLoginInputModel.fromJson(Map<String, dynamic> json) =>
      FirebaseLoginInputModel(
        email: json["Email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "password": password,
      };
}
