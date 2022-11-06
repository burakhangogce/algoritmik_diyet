import 'package:algoritmik_diyet/business/modules/diet/controller/diet_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/textformfields/tap_text_form_field.dart';

class DietAddFirst extends StatelessWidget {
  const DietAddFirst({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<DietController>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: pageHeight / 5),
      child: Consumer<DietController>(
          builder: (BuildContext context, controller, Widget? child) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
                controller.displayTimePicker(
                    context,
                    DateTime.now(),
                    controller.dietFirstDate,
                    DateTime.now().add(const Duration(days: 365)));
              },
              child: TapTextFormField(
                controller.dietFirstDate,
                placeholder: 'Diyet Başlangıç Tarihi',
                keyboardType: TextInputType.phone,
                icon: const Icon(Icons.date_range),
                validator: (value) =>
                    Validations.validateIsNotEmpty(value, null),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            controller.dietFirstDate.text.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      controller.displayTimePicker(
                          context,
                          DateFormat('dd-MM-yyyy')
                              .parse(controller.dietFirstDate.text)
                              .add(const Duration(days: 1)),
                          controller.dietLastDate,
                          DateFormat('dd-MM-yyyy')
                              .parse(controller.dietFirstDate.text)
                              .add(const Duration(days: 6)));
                    },
                    child: TapTextFormField(
                      controller.dietLastDate,
                      placeholder: 'Diyet Bitiş Tarihi',
                      keyboardType: TextInputType.phone,
                      icon: const Icon(Icons.date_range),
                      validator: (value) =>
                          Validations.validateIsNotEmpty(value, null),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 10,
            ),
            controller.dietLastDate.text.isNotEmpty
                ? SizedBox(
                    width: pageWidht * 0.9,
                    child: PrimaryButton(
                      onPressed: () {
                        controller.setSelectedDateList();
                        controller.onNextPage(context);
                      },
                      text: "Devam Et",
                      textStyle: AppTheme.notoSansMed18White,
                      style: AppTheme.elevatedButtonStyle,
                    ),
                  )
                : Container(),
          ]),
        );
      }),
    );
  }
}
