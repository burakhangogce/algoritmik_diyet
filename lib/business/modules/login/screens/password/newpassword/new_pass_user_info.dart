import 'package:flutter/material.dart';
import '../../../../../../constants/app_color.dart';
import '../../../../../../constants/app_theme.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../main.dart';
import '../../../../../commons/utils/validations.dart';
import '../../../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../widgets/divider_widget.dart';

class NewPassUserInfo extends StatefulWidget {
  final PageController controller;
  const NewPassUserInfo({Key? key, required this.controller}) : super(key: key);

  @override
  State<NewPassUserInfo> createState() => _NewPassUserInfoState();
}

class _NewPassUserInfoState extends State<NewPassUserInfo> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController tcknController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    tcknController = TextEditingController();
    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    tcknController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            right: 16, left: 16, bottom: 39, top: (pageHeight / 5) + 50),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  Localization.of(context)!.new_password_header,
                  style: AppTheme.notoSansMed16PrimaryText
                      .copyWith(letterSpacing: 0.03),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GeneralTextFormField(
                tcknController,
                keyboardType: TextInputType.number,
                placeholder:
                    Localization.of(context)!.new_password_tckn_placeholder,
                validator: (value) => Validations.validateTckn(value, null),
              ),
              const SizedBox(
                height: 10,
              ),
              GeneralTextFormField(
                emailController,
                keyboardType: TextInputType.emailAddress,
                placeholder:
                    Localization.of(context)!.new_password_email_placeholder,
                validator: (value) => Validations.validateEmail(value),
              ),
              const SizedBox(
                height: 10,
              ),
              GeneralTextFormField(
                phoneController,
                keyboardType: TextInputType.phone,
                placeholder:
                    Localization.of(context)!.new_password_phone_placeholder,
                validator: (value) => Validations.validatePhone(value, null),
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        bool valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          widget.controller.animateToPage(1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        }
                      },
                      style: AppTheme.elevatedButtonStyle,
                      child: Text(Localization.of(context)!
                          .new_password_continue_button)),
                  const SizedBox(
                    height: 40,
                  ),
                  DividerWidget(Localization.of(context)!.new_password_divider),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: loginGradientStartColor,
                          side: const BorderSide(
                            width: 1.0,
                            color: loginGradientStartColor,
                            style: BorderStyle.solid,
                          )),
                      onPressed: () async {
                        //await AksisService.openAksis(context);
                      },
                      child: Text(
                          Localization.of(context)!.signin_company_button)),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
