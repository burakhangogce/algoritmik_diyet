import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/api_path.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../constants/localization.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/dialogs/loading_dialog.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../commons/widgets/textformfields/password_text_form_field.dart';
import '../../../models/login_result.dart';
import '../controller/signin_controller.dart';
import '../widgets/snackbar.dart';

class SecondarySignin extends StatelessWidget {
  const SecondarySignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    SigninController model = Provider.of<SigninController>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradientBackground),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 15.0, right: 16, bottom: 50),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () =>
                        navigatorKey.currentState!.pushReplacementNamed(login),
                    icon: const Icon(
                      Icons.close,
                      color: backgroundColor,
                    ),
                  ),
                ),
                const Image(
                  height: 80,
                  width: 85,
                  image: AssetImage('assets/images/gratz.png'),
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  Localization.of(context)!.secondary_signin_header,
                  style: AppTheme.notoSansMed16White,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: backgroundColor,
                      boxShadow: const [
                        BoxShadow(
                            color: containerShadowColor,
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 3)),
                      ]),
                  height: 319,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, right: 16, left: 16),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 37,
                          ),
                          GeneralTextFormField(
                            model.emailController,
                            keyboardType: TextInputType.emailAddress,
                            placeholder: Localization.of(context)!
                                .secondary_signin_email_placeholder,
                            validator: (value) =>
                                Validations.validateEmail(value),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          PasswordTextFormField(
                            passController: model.passController,
                            placeHolder: Localization.of(context)!
                                .secondary_signin_password_placeholder,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/newpassword'),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                Localization.of(context)!
                                    .secondary_signin_forgot_password,
                                style: AppTheme.notoSansReg12Primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                bool valid =
                                    formKey.currentState?.validate() ?? false;
                                if (valid) {
                                  LoadingDialog.openDialog();

                                  context
                                      .read<SigninController>()
                                      .login(model.emailController.text,
                                          model.passController.text)
                                      .then((result) {
                                    LoadingDialog.closeDialog();
                                    loginResult(result, context);
                                  });
                                }
                              },
                              style: AppTheme.elevatedButtonStyle,
                              child: Text(Localization.of(context)!
                                  .signin_login_button))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginResult(LoginResult? result, BuildContext context) {
    if (result != null) {
      switch (result) {
        case LoginResult.success:
          Navigator.pushNamed(context, '/boarding');
          break;

        case LoginResult.invalidLogin:
          showSnackbar(context);
          break;
        default:
      }
    } else {
      showSnackbar(context);
    }
  }
}
