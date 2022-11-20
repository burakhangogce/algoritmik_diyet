class DietDayModel {
  int dietId;
  DateTime dietTime;
  List<DietMenuModel> dietMenus;

  DietDayModel(
    this.dietId,
    this.dietTime,
    this.dietMenus,
  );
}

class DietMenuModel {
  String dietMenuTitle;
  String dietMenuDetail;
  DateTime dietMenuTime;
  bool isNotification;
  bool isCompleted;

  DietMenuModel(
    this.dietMenuTitle,
    this.dietMenuDetail,
    this.dietMenuTime,
    this.isNotification,
    this.isCompleted,
  );
}
