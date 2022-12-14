// To parse this JSON data, do
//
//     final dietOutputModel = dietOutputModelFromJson(jsonString);

import 'dart:convert';

DietOutputModel dietOutputModelFromJson(String str) =>
    DietOutputModel.fromJson(json.decode(str));

String dietOutputModelToJson(DietOutputModel data) =>
    json.encode(data.toJson());

class DietOutputModel {
  DietOutputModel({
    required this.clientId,
    required this.dietId,
    required this.dietTitle,
    required this.dietStartDate,
    required this.dietEndDate,
    required this.dietDayModel,
  });

  int clientId;
  int dietId;
  String dietTitle;
  DateTime dietStartDate;
  DateTime dietEndDate;
  List<DietOutputDayModel> dietDayModel;

  factory DietOutputModel.fromJson(Map<String, dynamic> json) =>
      DietOutputModel(
        clientId: json["clientId"],
        dietId: json["dietId"],
        dietTitle: json["dietTitle"],
        dietStartDate: DateTime.parse(json["dietStartDate"]),
        dietEndDate: DateTime.parse(json["dietEndDate"]),
        dietDayModel: List<DietOutputDayModel>.from(
            json["dietDayModel"].map((x) => DietOutputDayModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "dietId": dietId,
        "dietTitle": dietTitle,
        "dietStartDate": dietStartDate.toIso8601String(),
        "dietEndDate": dietEndDate.toIso8601String(),
        "dietDayModel": List<dynamic>.from(dietDayModel.map((x) => x.toJson())),
      };
}

class DietOutputDayModel {
  DietOutputDayModel({
    required this.dietDayId,
    required this.dietId,
    required this.dietTime,
    required this.dietMenus,
  });

  int dietDayId;
  int dietId;
  DateTime dietTime;
  List<DietOutputMenu> dietMenus;
  dynamic dietModel;

  factory DietOutputDayModel.fromJson(Map<String, dynamic> json) =>
      DietOutputDayModel(
        dietDayId: json["dietDayId"],
        dietId: json["dietId"],
        dietTime: DateTime.parse(json["dietTime"]),
        dietMenus: List<DietOutputMenu>.from(
            json["dietMenus"].map((x) => DietOutputMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dietDayId": dietDayId,
        "dietId": dietId,
        "dietTime": dietTime.toIso8601String(),
        "dietMenus": List<dynamic>.from(dietMenus.map((x) => x.toJson())),
      };
}

class DietOutputMenu {
  DietOutputMenu({
    required this.dietMenuId,
    required this.dietDayId,
    required this.dietMenuTitle,
    required this.dietMenuDetail,
    required this.dietMenuTime,
    required this.isNotification,
    required this.isCompleted,
  });

  int dietMenuId;
  int dietDayId;
  String dietMenuTitle;
  String dietMenuDetail;
  DateTime dietMenuTime;
  bool isNotification;
  bool isCompleted;

  factory DietOutputMenu.fromJson(Map<String, dynamic> json) => DietOutputMenu(
        dietMenuId: json["dietMenuId"],
        dietDayId: json["dietDayId"],
        dietMenuTitle: json["dietMenuTitle"],
        dietMenuDetail: json["dietMenuDetail"],
        dietMenuTime: DateTime.parse(json["dietMenuTime"]),
        isNotification: json["isNotification"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "dietMenuId": dietMenuId,
        "dietDayId": dietDayId,
        "dietMenuTitle": dietMenuTitle,
        "dietMenuDetail": dietMenuDetail,
        "dietMenuTime": dietMenuTime.toIso8601String(),
        "isNotification": isNotification,
        "isCompleted": isCompleted,
      };
}
