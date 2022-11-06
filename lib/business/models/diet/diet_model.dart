class DietModel {
  int dietId;
  DateTime dietTime;
  List<DietMenuModel> dietMenus;

  DietModel(
    this.dietId,
    this.dietTime,
    this.dietMenus,
  );
}

class DietMenuModel {
  String dietMenuTitle;
  String dietMenuDetail;
  bool isNotification;

  DietMenuModel(
    this.dietMenuTitle,
    this.dietMenuDetail,
    this.isNotification,
  );
}
