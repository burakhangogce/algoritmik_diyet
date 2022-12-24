import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';
import '../../../core/mixins/service_mixin.dart';
import '../../models/response/response_model.dart';

class PdfServices extends AlgoritmikServiceBase with ServiceMixin {
  PdfServices() {
    url = settingService.getRegisterUrl();
    path = 'pdf';
  }

  Future<ResponseModel<String>> getDietPdf(int id) async {
    ResponseModel<dynamic> response =
        await getMapAsync(getUri("$id").toString(), createHeaders(), null);
    String saveMap = response.body;
    if (response.isSuccess && response.body.isNotEmpty) {
      return response.toBody(saveMap);
    } else {
      return response.toBody(null);
    }
  }
}
