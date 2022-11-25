import 'package:algoritmik_diyet/business/models/recipe/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeController with ChangeNotifier {
  PageController pageController = PageController();
  int selectedPageIndex = 0;
  TextEditingController titleRecipeCont = TextEditingController();
  TextEditingController descRecipeCont = TextEditingController();
  RecipeModel recipeModel = RecipeModel(1, "title", "Tarif açıklaması");

  List<RecipeModel> listRecipeModel = [];

  Future<List<RecipeModel>> setListRecipeModel() async {
    listRecipeModel.add(recipeModel);
    return listRecipeModel;
  }

  Future fillRecipeDetail(RecipeModel recipe) async {
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
