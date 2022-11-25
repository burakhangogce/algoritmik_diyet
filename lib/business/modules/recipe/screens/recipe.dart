import 'package:algoritmik_diyet/business/commons/widgets/dialogs/loading_dialog.dart';
import 'package:algoritmik_diyet/business/modules/recipe/controller/recipe_controller.dart';
import 'package:algoritmik_diyet/business/modules/recipe/screens/add_recipe.dart';
import 'package:algoritmik_diyet/core/services/navigation_service.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../../../models/recipe/recipe_model.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RecipeController>(context, listen: false);

    return SingleChildScrollView(
        child: Padding(
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChangeNotifierProvider<RecipeController>.value(
                      value: controller,
                      child: const AddRecipePage(),
                    ),
                  ),
                );
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
              future: controller.setListRecipeModel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<RecipeModel> data = snapshot.data!;
                  return SizedBox(
                    height: pageHeight * 0.6,
                    child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: GestureDetector(
                              onTap: () async {
                                LoadingDialog.openDialog();
                                await controller.fillRecipeDetail(data[index]);
                                LoadingDialog.closeDialog();
                                Navigator.of(NavigationService
                                        .navigatorKey.currentContext!)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChangeNotifierProvider<
                                            RecipeController>.value(
                                      value: controller,
                                      child: const AddRecipePage(),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Tarif 1",
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
                                    height: 2,
                                  ),
                                  Text(
                                    data[index].recipeDesc,
                                    style: AppTheme.notoSansMed14Primary2Text,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
