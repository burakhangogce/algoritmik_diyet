import '../diet/diet_model_input.dart';

class ClientModel {
  int clientId;
  DateTime clientStartDate;
  String clientName;
  String clientAge;
  int firstWeight;
  int lastWeight;
  DietInputModel dietModel;

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
