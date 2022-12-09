import 'package:mobkit_flutter_servicebase/responses/response_base.dart';

import 'error_model.dart';

class ResponseModel<T extends dynamic> extends ResponseBase<T> {
  bool isSuccess;
  int statusCode;
  ErrorModel? errorModel;
  T? body;
  ResponseModel(
      {this.isSuccess = false,
      this.statusCode = 900,
      this.errorModel,
      this.body});
  Map<String, dynamic> toMap() {
    return {
      'isSuccess': isSuccess,
      'errorModel': errorModel,
      'statusCode': statusCode
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      isSuccess: map['isSuccess'],
      errorModel: map['errorModel'],
      statusCode: map['statusCode'],
      body: map['body'],
    );
  }
}

extension BodyParsing on ResponseModel {
  ResponseModel<T> toBody<T>(T? model) {
    return ResponseModel<T>(
        body: model, isSuccess: isSuccess, errorModel: errorModel);
  }
}
