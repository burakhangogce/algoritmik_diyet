import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../constants/localization.dart';
import '../../../../main.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/dialogs/loading_dialog.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../commons/widgets/textformfields/password_text_form_field.dart';
import '../../../models/login_result.dart';
import '../controller/signin_controller.dart';
import '../widgets/divider_widget.dart';
import '../widgets/snackbar.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    if (kDebugMode && !isTest) {
      emailController.text = "admin20125@hotmail.com";
      passController.text = 'deneme123';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localization.of(context)!.signin_login_button,
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 15.0, right: 16, bottom: 50),
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, right: 16, left: 16),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 37,
                          ),
                          GeneralTextFormField(
                            emailController,
                            keyboardType: TextInputType.emailAddress,
                            placeholder: Localization.of(context)!
                                .signin_email_placeholder,
                            validator: (value) =>
                                Validations.validateEmail(value),
                            key: const Key('email-textfield'),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          PasswordTextFormField(
                            passController: passController,
                            placeHolder: Localization.of(context)!
                                .signin_password_placeholder,
                            key: const Key('password-textfield'),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/newpassword'),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                Localization.of(context)!
                                    .signin_forgot_password,
                                style: AppTheme.notoSansReg12Primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                                minHeight: 120, maxHeight: 240),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        bool valid =
                                            formKey.currentState?.validate() ??
                                                false;
                                        if (valid) {
                                          LoadingDialog.openDialog();

                                          context
                                              .read<SigninController>()
                                              .login(emailController.text,
                                                  passController.text)
                                              .then((result) {
                                            LoadingDialog.closeDialog();
                                            loginResult(result,
                                                emailController.text, context);
                                          });
                                        }
                                      },
                                      key: const Key('login'),
                                      style: AppTheme.elevatedButtonStyle,
                                      child: Text(Localization.of(context)!
                                          .signin_login_button)),
                                ),
                                const DividerWidget("Hesabınız yok mu?"),
                                Flexible(
                                  flex: 1,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          foregroundColor:
                                              loginGradientStartColor,
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: loginGradientStartColor,
                                            style: BorderStyle.solid,
                                          )),
                                      onPressed: () {},
                                      child: const Text("Hesap Oluşturun")),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginResult(LoginResult? result, String email, BuildContext context) {
    if (result != null) {
      switch (result) {
        case LoginResult.success:
          navigatorKey.currentState!.pushNamed(dashboard);

          break;
        case LoginResult.requiresTwoFactor:
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
