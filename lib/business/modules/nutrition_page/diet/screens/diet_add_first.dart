import 'package:algoritmik_diyet/business/commons/widgets/dialogs/loading_dialog.dart';
import 'package:algoritmik_diyet/business/commons/widgets/filter/filter_view.dart';
import 'package:algoritmik_diyet/business/modules/nutrition_page/diet/controller/diet_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_theme.dart';
import '../../../../../main.dart';
import '../../../../commons/utils/validations.dart';
import '../../../../commons/widgets/buttons/primary_button.dart';
import '../../../../commons/widgets/textformfields/tap_text_form_field.dart';
import '../../../../models/client/my_clients_ouput_model.dart';
import '../../../../models/response/response_model.dart';

class DietAddFirst extends StatelessWidget {
  const DietAddFirst({super.key});

  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
              onTap: () async {
                LoadingDialog.openDialog();
                ResponseModel<List<MyClientsOutputModel>> clientList =
                    await controller.getClients();
                LoadingDialog.closeDialog();
                final result = await FilterView<MyClientsOutputModel>(
                        values: clientList.body!)
                    .showSheet<MyClientsOutputModel>(
                        context: context,
                        items: clientList.body!,
                        textTitle: "Titleee",
                        textFieldHint: "hinttt");
                if (result == null) return;
                controller.dietClient.text = result.clientName;
              },
              child: TapTextFormField(
                controller.dietClient,
                placeholder: 'Danışan',
                keyboardType: TextInputType.phone,
                icon: const Icon(Icons.person),
                validator: (value) =>
                    Validations.validateIsNotEmpty(value, null),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            controller.dietLastDate.text.isNotEmpty
                ? SizedBox(
                    width: pageWidht * 0.9,
                    child: PrimaryButton(
                      onPressed: () async {
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
