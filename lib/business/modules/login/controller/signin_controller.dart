import 'package:algoritmik_diyet/business/models/login_output_model.dart';
import 'package:algoritmik_diyet/business/models/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_flutter_servicebase/services/secure_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../main.dart';
import '../../../models/change_password_input_model.dart';
import '../../../models/event_output_model.dart';
import '../../../models/login_info.dart';
import '../../../models/login_input_model.dart';
import '../../../models/login_result.dart';
import '../../../models/response/response_model.dart';
import '../../../services/data/identity_services.dart';

class SigninController extends ChangeNotifier {
  final IdentityServices _identityServices = getIt.get<IdentityServices>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;
  static SharedPreferences? _prefs;
  bool rememberMe = false;
  final SecureStorageService _secureStorageService = SecureStorageService();
  UserInfoModel userInfoModel = UserInfoModel();
  void updateLoading(bool showLoading) {
    isLoading = showLoading;
    notifyListeners();
  }

  Future<LoginResult?> login(String username, String password) async {
    Map<String, String>? environment = {'Admin': 'Admin1'};
    LoginInputModel request =
        LoginInputModel(username: username, password: password);
    updateLoading(true);
    ResponseModel<LoginOutputModel> response =
        await _identityServices.login(request);
    updateLoading(false);
    if (response.body!.token.isNotEmpty) {
      loginInfo = LoginInfo(response.body!.token, List.empty(), false);
      //loginInfo?.authToken = response.token;
      //loginInfo?.email = email;

      userInfoModel = UserInfoModel(
          email: loginInfo!.email,
          displayName: "denemeDisplay",
          password: "ddd",
          username: "admin77713");
      setLoginEnvironment(userInfoModel, environment, rememberMe: rememberMe);
      return LoginResult.success;
    }
    return null;
  }

  // SharedPreferences loadPrefs() {
  //   return _prefs as SharedPreferences;
  // }

  // Future init() async {
  //   _prefs ??= await SharedPreferences.getInstance();
  // }

  Future<bool> removeAsync(String key) {
    return _prefs!.remove(key);
  }

  Future<bool> setAsync<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (T) {
      case bool:
        return prefs.setBool(key, value as bool);
      case double:
        return prefs.setDouble(key, value as double);
      case int:
        return prefs.setInt(key, value as int);
      case String:
        return prefs.setString(key, value.toString());
      case List<String>:
        return prefs.setStringList(key, value as List<String>);
      default:
        return prefs.setString(key, value.toString());
    }
  }

  void setLoginEnvironment(UserInfoModel user, Map<String, String>? environment,
      {bool? rememberMe}) {
    if (environment != null) {
      environment.forEach((key, value) {
        //removeAsync(key);
        setAsync(key, value.toString());
      });
    }
    this.rememberMe = rememberMe!;
    if (rememberMe) {
      _secureStorageService.addNewItemAsync(user.username!, user.password!);
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    ChangePasswordInputModel request = ChangePasswordInputModel(
        oldPassword: oldPassword, newPassword: newPassword);
    EventOutputModel response = await _identityServices.changePassword(request);
    return response.eventSuccess;
  }
}
