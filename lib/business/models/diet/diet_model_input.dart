// To parse this JSON data, do
//
//     final dietOutputModel = dietOutputModelFromJson(jsonString);

import 'dart:convert';

DietInputModel dietOutputModelFromJson(String str) =>
    DietInputModel.fromJson(json.decode(str));

String dietOutputModelToJson(DietInputModel data) => json.encode(data.toJson());

class DietInputModel {
  DietInputModel({
    required this.dietTitle,
    required this.dietStartDate,
    required this.dietEndDate,
    required this.dietDayModel,
  });

  String dietTitle;
  DateTime dietStartDate;
  DateTime dietEndDate;
  List<DietDayModel> dietDayModel;

  factory DietInputModel.fromJson(Map<String, dynamic> json) => DietInputModel(
        dietTitle: json["dietTitle"],
        dietStartDate: DateTime.parse(json["dietStartDate"]),
        dietEndDate: DateTime.parse(json["dietEndDate"]),
        dietDayModel: List<DietDayModel>.from(
            json["dietDayModel"].map((x) => DietDayModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dietTitle": dietTitle,
        "dietStartDate": dietStartDate.toIso8601String(),
        "dietEndDate": dietEndDate.toIso8601String(),
        "dietDayModel": List<dynamic>.from(dietDayModel.map((x) => x.toJson())),
      };
}

class DietDayModel {
  DietDayModel({
    required this.dietTime,
    required this.dietMenus,
  });

  DateTime dietTime;
  List<DietMenu> dietMenus;

  factory DietDayModel.fromJson(Map<String, dynamic> json) => DietDayModel(
        dietTime: DateTime.parse(json["dietTime"]),
        dietMenus: List<DietMenu>.from(
            json["dietMenus"].map((x) => DietMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dietTime": dietTime.toIso8601String(),
        "dietMenus": List<dynamic>.from(dietMenus.map((x) => x.toJson())),
      };
}

class DietMenu {
  DietMenu({
    required this.dietMenuTitle,
    required this.dietMenuDetail,
    required this.dietMenuTime,
    required this.isNotification,
    required this.isCompleted,
  });

  String dietMenuTitle;
  String dietMenuDetail;
  DateTime dietMenuTime;
  bool isNotification;
  bool isCompleted;

  factory DietMenu.fromJson(Map<String, dynamic> json) => DietMenu(
        dietMenuTitle: json["dietMenuTitle"],
        dietMenuDetail: json["dietMenuDetail"],
        dietMenuTime: DateTime.parse(json["dietMenuTime"]),
        isNotification: json["isNotification"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "dietMenuTitle": dietMenuTitle,
        "dietMenuDetail": dietMenuDetail,
        "dietMenuTime": dietMenuTime.toIso8601String(),
        "isNotification": isNotification,
        "isCompleted": isCompleted,
      };
}
