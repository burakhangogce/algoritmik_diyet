import 'package:algoritmik_diyet/business/commons/widgets/dialogs/loading_dialog.dart';
import 'package:algoritmik_diyet/business/models/recipe/recipe_input_model.dart';
import 'package:algoritmik_diyet/business/models/recipe/recipe_model.dart';
import 'package:algoritmik_diyet/business/models/recipe/recipe_output_model.dart';
import 'package:algoritmik_diyet/business/services/data/recipe_services.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class RecipeController with ChangeNotifier {
  PageController pageController = PageController();
  int selectedPageIndex = 0;
  TextEditingController titleRecipeCont = TextEditingController();
  TextEditingController descRecipeCont = TextEditingController();
  RecipeModel recipeModel = RecipeModel(1, "title", "Tarif açıklaması");

  List<RecipeModel> listRecipeModel = [];
  final RecipeServices _recipeServices = getIt.get<RecipeServices>();

  Future<List<RecipeOutputModel>> myRecipes(int id) async {
    List<RecipeOutputModel> myClients = await _recipeServices.getRecipes(id);
    return myClients;
  }

  Future<RecipeOutputModel> addRecipe(RecipeInputModel recipeInputModel) async {
    RecipeOutputModel recipe =
        await _recipeServices.addRecipe(recipeInputModel);
    return recipe;
  }

  Future fillRecipeDetail(RecipeOutputModel recipe) async {
    titleRecipeCont.text = recipe.recipeTitle;
    descRecipeCont.text = recipe.recipeDesc;
  }

  onNextPage(BuildContext context) {
    if (pageController.page! >= 5.0) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      selectedPageIndex++;
      notifyListeners();
      pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInToLinear);
    }
  }

  onJumpPage(int index) {
    selectedPageIndex = index;
    notifyListeners();
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInToLinear,
    );
  }
}
