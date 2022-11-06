class HomeWorkModel {
  String homeworkTitle;
  String homeworkDesc;
  int homeworkClassId;
  bool homeworkIsNotification;
  bool homeworkIsReminder;

  HomeWorkModel(
    this.homeworkTitle,
    this.homeworkDesc,
    this.homeworkClassId,
    this.homeworkIsNotification,
    this.homeworkIsReminder,
  );
}
