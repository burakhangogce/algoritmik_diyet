import 'package:flutter/material.dart';
import '../../../../constants/api_path.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loginBtnEnable = false;
  bool rememberMe = false;
  bool infoWrongValidate = false;
  bool accountLockedValidate = false;

  void registerClicked() {
    navigatorKey.currentState!.pushReplacementNamed("/register");
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  void changeButtonText({bool isReset = false}) {
    if (isReset) {
    } else {}
    notifyListeners();
  }

  String? emailValidator(String? email) {
    if (infoWrongValidate || accountLockedValidate) {
      return '';
    }
    return null;
  }

  notificationCallback() {}

  void showActivationPopup() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return Container();
        },
        backgroundColor: Colors.transparent);
  }

  emailNotConfirmed() {
    showActivationPopup();
  }
}
