// To parse this JSON data, do
//
//     final myClientsOutputModel = myClientsOutputModelFromJson(jsonString);

import 'dart:convert';

List<MyClientsOutputModel> myClientsOutputModelFromJson(String str) =>
    List<MyClientsOutputModel>.from(
        json.decode(str).map((x) => MyClientsOutputModel.fromJson(x)));

String myClientsOutputModelToJson(List<MyClientsOutputModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyClientsOutputModel {
  MyClientsOutputModel({
    required this.clientId,
    required this.nutritionistId,
    required this.clientStartDate,
    required this.clientName,
    required this.clientAge,
    required this.firstWeight,
    required this.lastWeight,
    required this.token,
    this.nutritionistModel,
  });

  int clientId;
  int nutritionistId;
  DateTime clientStartDate;
  String clientName;
  int clientAge;
  int firstWeight;
  int lastWeight;
  String token;
  dynamic nutritionistModel;

  factory MyClientsOutputModel.fromJson(Map<String, dynamic> json) =>
      MyClientsOutputModel(
        clientId: json["clientId"],
        nutritionistId: json["nutritionistId"],
        clientStartDate: DateTime.parse(json["clientStartDate"]),
        clientName: json["clientName"],
        clientAge: json["clientAge"],
        firstWeight: json["firstWeight"],
        lastWeight: json["lastWeight"],
        token: json["token"],
        nutritionistModel: json["nutritionistModel"],
      );

  Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "nutritionistId": nutritionistId,
        "clientStartDate": clientStartDate.toIso8601String(),
        "clientName": clientName,
        "clientAge": clientAge,
        "firstWeight": firstWeight,
        "lastWeight": lastWeight,
        "token": token,
        "nutritionistModel": nutritionistModel,
      };
}
