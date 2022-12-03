import 'package:algoritmik_diyet/business/models/diet/diet_day_model.dart';

class DietModel {
  int clientId;
  int dietId;
  String dietTitle;
  DateTime dietStartDate;
  DateTime dietEndDate;
  List<DietDayModel> dietDayModel;

  DietModel(
    this.clientId,
    this.dietId,
    this.dietTitle,
    this.dietStartDate,
    this.dietEndDate,
    this.dietDayModel,
  );
}
