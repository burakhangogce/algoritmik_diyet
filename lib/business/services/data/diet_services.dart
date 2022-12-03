import 'dart:convert';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';
import '../../models/diet/diet_model_input.dart';

class DietServices extends AlgoritmikServiceBase with ServiceMixin {
  DietServices() {
    url = settingService.getRegisterUrl();
    path = 'diet';
  }
  Future<DietOutputModel> getDiet(int id) async {
    Map<String, dynamic> map = await getMapAsync<Map<String, dynamic>>(
        getUri("mydiets/$id").toString(), createHeaders(), null);

    return DietOutputModel.fromJson(map);
  }

  Future<DietOutputModel> changePassword(DietInputModel diet) async {
    Map<String, dynamic> map = await postMapAsync<Map<String, dynamic>>(
        getUri('User/sendotp').toString(),
        createHeaders(),
        json.encode(diet.toJson()),
        null);
    return DietOutputModel.fromJson(map);
  }
}
