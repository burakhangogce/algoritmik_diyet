import 'dart:convert';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import 'package:algoritmik_diyet/main.dart';
import '../../../core/mixins/service_mixin.dart';
import '../../models/diet/diet_model_input.dart';
import '../../models/response/response_model.dart';

class DietServices extends AlgoritmikServiceBase with ServiceMixin {
  DietServices() {
    url = settingService.getRegisterUrl();
    path = 'diet';
  }
  Future<ResponseModel<DietOutputModel>> getDiet(int id) async {
    ResponseModel<dynamic> response = await getMapAsync(
        getUri("mydiets/$id").toString(), createHeaders(), null);
    Map<String, dynamic> saveMap = response.body;
    if (response.isSuccess) {
      return response.toBody(DietOutputModel.fromJson(saveMap));
    }
    return response.toBody(null);
  }

  Future<ResponseModel<DietOutputModel>> addDiet(DietInputModel diet) async {
    ResponseModel<dynamic> response = await postMapAsync(
        getUri('mydiets/adddiet').toString(),
        createHeaders(),
        json.encode(diet.toJson()),
        null);
    Map<String, dynamic> saveMap = response.body;
    if (response.isSuccess) {
      return response.toBody(DietOutputModel.fromJson(saveMap));
    }
    return response.toBody(null);
  }

  Future<ResponseModel<DietOutputModel>> updateDiet(
      DietOutputModel diet) async {
    ResponseModel<dynamic> response = await putMapAsync(
        getUri('mydiets/update/$clientId').toString(),
        createHeaders(),
        json.encode(diet.toJson()),
        null);
    Map<String, dynamic> saveMap = response.body;
    if (response.isSuccess) {
      return response.toBody(DietOutputModel.fromJson(saveMap));
    }
    return response.toBody(null);
  }
}
