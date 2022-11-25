import 'package:algoritmik_diyet/business/commons/widgets/boxes/message_box.dart';
import 'package:algoritmik_diyet/business/commons/widgets/textformfields/general_text_form_field.dart';
import 'package:algoritmik_diyet/business/modules/recipe/controller/recipe_controller.dart';
import 'package:algoritmik_diyet/business/modules/recipe/screens/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RecipeController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Tarif Oluştur",
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Consumer<RecipeController>(
              builder: (BuildContext context, controller, Widget? child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      DuoToneFontAwesomeIcon(
                          iconSource: IconFont.utensilfork,
                          firstColor: firstIconColor,
                          iconSize: 17,
                          secondColor: secondIconColor,
                          iconSecondSource: SecondIconFont.utensilfork),
                      TextButton(
                        onPressed: () {},
                        style: AppTheme.textButtonStyle,
                        child: const Text(
                          "Tarif İsmi",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GeneralTextFormField(
                    controller.titleRecipeCont,
                    placeholder: "Tarif İsmi",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      DuoToneFontAwesomeIcon(
                          iconSource: IconFont.utensilfork,
                          firstColor: firstIconColor,
                          iconSize: 17,
                          secondColor: secondIconColor,
                          iconSecondSource: SecondIconFont.utensilfork),
                      TextButton(
                        onPressed: () {},
                        style: AppTheme.textButtonStyle,
                        child: const Text(
                          "Tarif Detayları",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: controller.descRecipeCont,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        hintText: "Tarif Detayı",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: firstIconColor))),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const MessageBox(
                      message:
                          "Danışanlarınız profilinizden oluşturduğunuz tarifleri görebilicek."),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: pageWidht * 0.9,
                    child: PrimaryButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "Tarif Ekle",
                      textStyle: AppTheme.notoSansMed18White,
                      style: AppTheme.elevatedButtonStyle,
                    ),
                  ),
                ]);
          }),
        ),
      ),
    );
  }
}
