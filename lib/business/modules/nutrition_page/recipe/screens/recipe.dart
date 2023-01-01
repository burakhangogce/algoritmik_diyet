import 'package:algoritmik_diyet/business/commons/widgets/dialogs/loading_dialog.dart';
import 'package:algoritmik_diyet/business/models/recipe/recipe_output_model.dart';
import 'package:algoritmik_diyet/business/modules/nutrition_page/recipe/controller/recipe_controller.dart';
import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';
import '../../../../commons/utils/icon_font.dart';
import '../../../../commons/utils/second_icon_font.dart';
import '../../../../commons/widgets/buttons/primary_button.dart';
import '../../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RecipeController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: pageHeight / 10,
          ),
          SizedBox(
            width: pageWidht * 0.9,
            child: PrimaryButton(
              onPressed: () {
                navigatorKey.currentState!.pushNamed(addRecipePage);
              },
              text: "Tarif Oluştur",
              textStyle: AppTheme.notoSansMed18White,
              style: AppTheme.elevatedButtonStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FutureBuilder<dynamic>(
              future: controller.myRecipes(nutritionistId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<RecipeOutputModel> data = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            child: GestureDetector(
                              onTap: () async {
                                LoadingDialog.openDialog();
                                await controller.fillRecipeDetail(data[index]);
                                LoadingDialog.closeDialog();
                                navigatorKey.currentState!
                                    .pushNamed(addRecipePage);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index].recipeTitle,
                                        style:
                                            AppTheme.notoSansMed14PrimaryText,
                                      ),
                                      DuoToneFontAwesomeIcon(
                                          iconSource: IconFont.edit,
                                          firstColor: firstIconColor,
                                          iconSize: 20,
                                          secondColor: secondIconColor,
                                          iconSecondSource:
                                              SecondIconFont.edit),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data[index].recipeDesc,
                                    style: AppTheme.notoSansMed14Primary2Text,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator(
                  color: primaryColor,
                );
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
