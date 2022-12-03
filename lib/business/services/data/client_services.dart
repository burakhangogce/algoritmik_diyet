import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';

class ClientServices extends AlgoritmikServiceBase with ServiceMixin {
  ClientServices() {
    url = settingService.getRegisterUrl();
    path = 'client';
  }
  Future<List<MyClientsOutputModel>> getMyClients(int id) async {
    List map = await getMapAsync(
        getUri("myclients/$id").toString(), createHeaders(), null);
    return map.map((job) => MyClientsOutputModel.fromJson(job)).toList();
  }
}
