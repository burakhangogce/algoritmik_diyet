import 'dart:convert';
import 'package:algoritmik_diyet/business/models/recipe/recipe_input_model.dart';
import 'package:algoritmik_diyet/business/models/recipe/recipe_output_model.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';

class RecipeServices extends AlgoritmikServiceBase with ServiceMixin {
  RecipeServices() {
    url = settingService.getRegisterUrl();
    path = 'recipe';
  }
  Future<List<RecipeOutputModel>> getRecipes(int id) async {
    List map =
        await getMapAsync(getUri("$id").toString(), createHeaders(), null);

    return map.map((job) => RecipeOutputModel.fromJson(job)).toList();
  }

  Future<RecipeOutputModel> addRecipe(RecipeInputModel diet) async {
    Map<String, dynamic> map = await postMapAsync<Map<String, dynamic>>(
        getUri('addrecipe').toString(),
        createHeaders(),
        json.encode(diet.toJson()),
        null);
    return RecipeOutputModel.fromJson(map);
  }
}
