import 'package:algoritmik_diyet/business/modules/homework/controller/homework_controller.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../commons/widgets/buttons/main_button_group.dart';

class HomeWorkAddSecond extends StatelessWidget {
  HomeWorkAddSecond({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: pageHeight / 5, left: 16, right: 16),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diyet Detayı",
            style: AppTheme.notoSansReg24PrimaryText,
          ),
          Text(
              "Öğrencilerine göndermeden önce ödevin detaylarını belirtmelisin.",
              style: AppTheme.notoSansMed14White
                  .copyWith(color: primary2TextColor)),
          Consumer<HomeWorkController>(
              builder: (BuildContext context, controller, Widget? child) {
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  GeneralTextFormField(
                    controller.homeworkTitle,
                    keyboardType: TextInputType.text,
                    placeholder: "Diyet Başlığı",
                    validator: (value) =>
                        Validations.validateIsNotEmpty(value, null),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GeneralTextFormField(
                    controller.homeworkDetails,
                    keyboardType: TextInputType.text,
                    placeholder: "Diyet Açıklaması",
                    validator: (value) =>
                        Validations.validateIsNotEmpty(value, null),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MainButtonGroup(
                    borderColor: Colors.white,
                    uSelectedIndex: 1,
                    unSelectedColor: softBorderColor,
                    selectedTextColor: Colors.white,
                    unSelectedTextColor: Colors.black,
                    spacing: 0,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    buttons: ['günlük', 'haftalık', 'haftalık'],
                    onchanged: (int index) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButtonGroup(
                    borderColor: Colors.white,
                    uSelectedIndex: 1,
                    unSelectedColor: softBorderColor,
                    selectedTextColor: Colors.white,
                    unSelectedTextColor: Colors.black,
                    spacing: 0,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    buttons: ['günlük', 'haftalık'],
                    onchanged: (int index) {},
                  ),
                  controller.selectedId != -1
                      ? SizedBox(
                          width: pageWidht * 0.9,
                          child: PrimaryButton(
                            onPressed: () {
                              bool valid =
                                  formKey.currentState?.validate() ?? false;
                              if (valid) {
                                controller.createHomeWork();

                                controller.onNextPage(context);
                              }
                            },
                            text: "Devam",
                            textStyle: AppTheme.notoSansMed18White,
                            style: AppTheme.elevatedButtonStyle,
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          }),
        ],
      )),
    );
  }
}
