import 'dart:convert';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';
import '../../models/change_password_input_model.dart';
import '../../models/event_output_model.dart';
import '../../models/login_input_model.dart';
import '../../models/login_output_model.dart';
import '../../models/response/response_model.dart';
import '../../models/user_info_model.dart';

class IdentityServices extends AlgoritmikServiceBase with ServiceMixin {
  IdentityServices() {
    url = settingService.getRegisterUrl();
    path = 'account';
  }

  // Future login(LoginInputModel request) async {
  //   Map<String, dynamic> loginMap = await postMapAsync<Map<String, dynamic>>(
  //       getUri('').toString(), createHeaders(), request.toJson(), null);
  //   return loginMap;
  // }

  Future<ResponseModel<LoginOutputModel>> login(LoginInputModel request) async {
    ResponseModel<dynamic> response = await postMapAsync<Map<String, dynamic>>(
        getUri('login').toString(), createHeaders(), request.toJson(), null);
    Map<String, dynamic> saveMap = response.body;
    if (response.isSuccess) {
      return response.toBody(LoginOutputModel.fromMap(saveMap));
    }
    return response.toBody(null);
  }

  Future<UserInfoModel> getUser() async {
    ResponseModel<dynamic> response = await getMapAsync<Map<String, dynamic>>(
        getUri("connect/userinfo").toString(), createHeaders(), null);

    return UserInfoModel.fromMap(response.body);
  }

  Future<EventOutputModel> changePassword(
      ChangePasswordInputModel request) async {
    ResponseModel<dynamic> response = await postMapAsync<Map<String, dynamic>>(
        getUri('User/sendotp').toString(),
        createHeaders(),
        json.encode(request.toJson()),
        null);
    return EventOutputModel.fromJson(response.body);
  }
}
