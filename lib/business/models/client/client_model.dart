import 'package:algoritmik_diyet/business/models/diet/diet_model.dart';

class ClientModel {
  int clientId;
  DateTime clientStartDate;
  String clientName;
  String clientAge;
  int firstWeight;
  int lastWeight;
  DietModel dietModel;

  ClientModel(
    this.clientId,
    this.clientStartDate,
    this.clientName,
    this.clientAge,
    this.firstWeight,
    this.lastWeight,
    this.dietModel,
  );
}
