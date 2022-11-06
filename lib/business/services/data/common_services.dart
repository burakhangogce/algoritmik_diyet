import '../../../core/mixins/service_mixin.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';

class CommonServices extends AlgoritmikServiceBase with ServiceMixin {
  CommonServices() {
    url = settingService.getDataUrl();
    path = 'common';
  }
}
