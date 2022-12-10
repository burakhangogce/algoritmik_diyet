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
  List<DietInputDayModel> dietDayModel;

  factory DietInputModel.fromJson(Map<String, dynamic> json) => DietInputModel(
        dietTitle: json["dietTitle"],
        dietStartDate: DateTime.parse(json["dietStartDate"]),
        dietEndDate: DateTime.parse(json["dietEndDate"]),
        dietDayModel: List<DietInputDayModel>.from(
            json["dietDayModel"].map((x) => DietInputDayModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dietTitle": dietTitle,
        "dietStartDate": dietStartDate.toIso8601String(),
        "dietEndDate": dietEndDate.toIso8601String(),
        "dietDayModel": List<dynamic>.from(dietDayModel.map((x) => x.toJson())),
      };
}

class DietInputDayModel {
  DietInputDayModel({
    required this.dietTime,
    required this.dietMenus,
  });

  DateTime dietTime;
  List<DietInputMenu> dietMenus;

  factory DietInputDayModel.fromJson(Map<String, dynamic> json) =>
      DietInputDayModel(
        dietTime: DateTime.parse(json["dietTime"]),
        dietMenus: List<DietInputMenu>.from(
            json["dietMenus"].map((x) => DietInputMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dietTime": dietTime.toIso8601String(),
        "dietMenus": List<dynamic>.from(dietMenus.map((x) => x.toJson())),
      };
}

class DietInputMenu {
  DietInputMenu({
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

  factory DietInputMenu.fromJson(Map<String, dynamic> json) => DietInputMenu(
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
