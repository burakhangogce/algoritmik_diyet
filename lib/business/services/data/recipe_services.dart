import 'dart:convert';
import 'package:algoritmik_diyet/business/models/recipe/recipe_input_model.dart';
import 'package:algoritmik_diyet/business/models/recipe/recipe_output_model.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';
import '../../models/response/response_model.dart';

class RecipeServices extends AlgoritmikServiceBase with ServiceMixin {
  RecipeServices() {
    url = settingService.getRegisterUrl();
    path = 'recipe';
  }
  Future<ResponseModel<List<RecipeOutputModel>>> getRecipes(int id) async {
    ResponseModel<dynamic> response =
        await getMapAsync(getUri("$id").toString(), createHeaders(), null);
    List saveMap = response.body;
    if (response.isSuccess && response.body.isNotEmpty) {
      return response.toBody(
          saveMap.map((job) => RecipeOutputModel.fromJson(job)).toList());
    } else {
      return response.toBody(null);
    }
  }

  Future<ResponseModel<RecipeOutputModel>> addRecipe(
      RecipeInputModel diet) async {
    ResponseModel<dynamic> response = await postMapAsync(
        getUri('addrecipe').toString(),
        createHeaders(),
        json.encode(diet.toJson()),
        null);
    Map<String, dynamic> saveMap = response.body;
    if (response.isSuccess) {
      return response.toBody(RecipeOutputModel.fromJson(saveMap));
    }
    return response.toBody(null);
  }
}
