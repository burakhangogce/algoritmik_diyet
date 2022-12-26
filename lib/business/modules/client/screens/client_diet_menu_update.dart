import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/api_path.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../models/diet/diet_model_output.dart';
import '../controller/client_controller.dart';

class ClientDietMenuUpdatePage extends StatelessWidget {
  const ClientDietMenuUpdatePage({super.key, required this.dietOutputMenu});
  final DietOutputMenu dietOutputMenu;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ClientController>(context, listen: false);
    controller.dietMenuTitleTxt.text = dietOutputMenu.dietMenuTitle;
    controller.dietMenuDetailTxt.text = dietOutputMenu.dietMenuDetail;
    controller.dietMenuTimeTxt.text =
        "${dietOutputMenu.dietMenuTime.hour}:${dietOutputMenu.dietMenuTime.minute}";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        title: Text(
          "Güncelle",
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: Consumer<ClientController>(
          builder: (BuildContext context, controller, Widget? child) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              GeneralTextFormField(
                                controller.dietMenuTitleTxt,
                                keyboardType: TextInputType.text,
                                placeholder: dietOutputMenu.dietMenuTitle,
                                validator: (value) =>
                                    Validations.validateIsNotEmpty(value, null),
                              ),
                              TextField(
                                controller: controller.dietMenuDetailTxt,
                                keyboardType: TextInputType.multiline,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    hintText: dietOutputMenu.dietMenuDetail,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: firstIconColor))),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Saat",
                              style: AppTheme.notoSansMed18PrimaryText,
                            ),
                            Text(controller.dietMenuTimeTxt.text),
                            TextButton(
                              onPressed: () async {
                                final TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 7, minute: 15),
                                );
                                if (newTime != null) {
                                  controller.setDietMenuTime(newTime);
                                }
                              },
                              style: AppTheme.textButtonStyle,
                              child: const Text(
                                "Saat belirle",
                                style: AppTheme.notoSansMed14Primary2Text,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  DuoToneFontAwesomeIcon(
                                      iconSource: IconFont.utensilsalt,
                                      firstColor: firstIconColor,
                                      iconSize: 20,
                                      secondColor: secondIconColor,
                                      iconSecondSource:
                                          SecondIconFont.utensilsalt),
                                  TextButton(
                                    onPressed: () {
                                      bool valid =
                                          formKey.currentState?.validate() ??
                                              false;
                                      if (valid) {
                                        controller.updateDiet();
                                      }
                                    },
                                    style: AppTheme.textButtonStyle,
                                    child: Text(
                                      "Güncelle",
                                      style: AppTheme.notoSansMed18PrimaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
