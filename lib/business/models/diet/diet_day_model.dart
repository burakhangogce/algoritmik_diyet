class DietDayModel {
  int dietId;
  int dietDayId;
  DateTime dietTime;
  List<DietMenuModel> dietMenus;

  DietDayModel(
    this.dietId,
    this.dietDayId,
    this.dietTime,
    this.dietMenus,
  );
}

class DietMenuModel {
  int dietDayId;
  String dietMenuTitle;
  String dietMenuDetail;
  DateTime dietMenuTime;
  bool isNotification;
  bool isCompleted;

  DietMenuModel(
    this.dietDayId,
    this.dietMenuTitle,
    this.dietMenuDetail,
    this.dietMenuTime,
    this.isNotification,
    this.isCompleted,
  );
}
