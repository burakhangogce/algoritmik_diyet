import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants/app_color.dart';
import '../../../../../../../constants/app_theme.dart';
import '../../../../../../../constants/localization.dart';
import '../../../../../../../main.dart';
import '../../../../../../commons/utils/validations.dart';
import '../../../../../../commons/widgets/dialogs/loading_dialog.dart';
import '../../../../../../commons/widgets/textformfields/password_text_form_field.dart';
import '../../../../../../models/change_password_input_model.dart';
import '../../../../../../services/data/identity_services.dart';

class NewPassCreatePassword extends StatefulWidget {
  const NewPassCreatePassword({Key? key}) : super(key: key);

  @override
  State<NewPassCreatePassword> createState() => _NewPassCreatePasswordState();
}

class _NewPassCreatePasswordState extends State<NewPassCreatePassword> {
  final formKey = GlobalKey<FormState>();
  final IdentityServices _identityServices = getIt.get<IdentityServices>();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passRepeatController = TextEditingController();

  @override
  void initState() {
    passController = TextEditingController();
    passRepeatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passController.dispose();
    passRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double pagerHeight = pageHeight / 5;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: pagerHeight, right: 16, left: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: containerShadowColor,
                              spreadRadius: 0,
                              blurRadius: 6,
                              offset: Offset(0, 3)),
                        ]),
                    height: 210,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.6),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 11,
                            ),
                            Text(Localization.of(context)!
                                .create_password_warning_title),
                            const SizedBox(
                              height: 16,
                            ),
                            TextLine(Localization.of(context)!
                                .create_password_warning_line1),
                            const SizedBox(
                              height: 13,
                            ),
                            TextLine(Localization.of(context)!
                                .create_password_warning_line2),
                            const SizedBox(
                              height: 13,
                            ),
                            TextLine(Localization.of(context)!
                                .create_password_warning_line3),
                            const SizedBox(
                              height: 13,
                            ),
                            TextLine(Localization.of(context)!
                                .create_password_warning_line4),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  PasswordTextFormField(
                    passController: oldPassController,
                    placeHolder: Localization.of(context)!
                        .create_password_warning_old_pass_placeholder,
                  ),
                  PasswordTextFormField(
                    passController: passController,
                    placeHolder: Localization.of(context)!
                        .create_password_warning_pass_placeholder,
                  ),
                  PasswordTextFormField(
                    passController: passRepeatController,
                    placeHolder: Localization.of(context)!
                        .create_password_warning_pass_re_placheholder,
                    validator: (val) => Validations.validatePasswordsAreSame(
                        passController.text, val, null),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        bool valid = formKey.currentState!.validate();
                        if (!valid) {
                          return;
                        }

                        if (await changePassword()) {
                          navigatorKey.currentState!.pushNamed(secondaryLogin);
                        }
                      },
                      style: AppTheme.elevatedButtonStyle,
                      child: Text(Localization.of(context)!
                          .create_password_warning_button))
                ]),
          ),
        ),
      ),
    );
  }

  Future<bool> changePassword() async {
    LoadingDialog.openDialog();
    var request = ChangePasswordInputModel(
        oldPassword: oldPassController.text, newPassword: passController.text);
    var result = await _identityServices.changePassword(request);
    LoadingDialog.closeDialog();
    return result.eventSuccess;
  }
}

class TextLine extends StatelessWidget {
  final String text;
  const TextLine(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 6,
          color: secondaryColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            text,
            maxLines: 2,
            style: AppTheme.notoSansReg14PrimaryText
                .copyWith(height: 1.4, overflow: TextOverflow.clip),
          ),
        ),
      ],
    );
  }
}
