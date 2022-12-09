class ErrorModel {
  String errorMessage;

  ErrorModel(this.errorMessage);

  Map<String, dynamic> toMap() {
    return {'errorMessage': errorMessage};
  }
}
