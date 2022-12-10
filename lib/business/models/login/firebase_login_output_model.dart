// To parse this JSON data, do
//
//     final firebaseLoginOutputModel = firebaseLoginOutputModelFromJson(jsonString);

import 'dart:convert';

FirebaseLoginOutputModel firebaseLoginOutputModelFromJson(String str) =>
    FirebaseLoginOutputModel.fromJson(json.decode(str));

String firebaseLoginOutputModelToJson(FirebaseLoginOutputModel data) =>
    json.encode(data.toJson());

class FirebaseLoginOutputModel {
  FirebaseLoginOutputModel({
    required this.firebaseToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.created,
    required this.user,
  });

  String firebaseToken;
  String refreshToken;
  int expiresIn;
  DateTime created;
  User user;

  factory FirebaseLoginOutputModel.fromJson(Map<String, dynamic> json) =>
      FirebaseLoginOutputModel(
        firebaseToken: json["firebaseToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        created: DateTime.parse(json["created"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "firebaseToken": firebaseToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "created": created.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.localId,
    required this.federatedId,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.email,
    required this.isEmailVerified,
    required this.photoUrl,
  });

  String localId;
  String federatedId;
  String firstName;
  String lastName;
  String displayName;
  String email;
  bool isEmailVerified;
  String photoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        localId: json["localId"],
        federatedId: json["federatedId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        displayName: json["displayName"],
        email: json["email"],
        isEmailVerified: json["isEmailVerified"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "localId": localId,
        "federatedId": federatedId,
        "firstName": firstName,
        "lastName": lastName,
        "displayName": displayName,
        "email": email,
        "isEmailVerified": isEmailVerified,
        "photoUrl": photoUrl,
      };
}
