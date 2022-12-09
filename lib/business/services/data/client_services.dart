import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';
import '../../models/response/response_model.dart';

class ClientServices extends AlgoritmikServiceBase with ServiceMixin {
  ClientServices() {
    url = settingService.getRegisterUrl();
    path = 'client';
  }
  Future<ResponseModel<List<MyClientsOutputModel>>> getMyClients(int id) async {
    ResponseModel<dynamic> response = await getMapAsync(
        getUri("myclients/$id").toString(), createHeaders(), null);
    List saveMap = response.body;
    if (response.isSuccess && response.body.isNotEmpty) {
      return response.toBody(
          saveMap.map((job) => MyClientsOutputModel.fromJson(job)).toList());
    } else {
      return response.toBody(null);
    }
  }
}
