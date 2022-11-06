import 'package:mobkit_flutter_servicebase/services/setting_service_base.dart';

import '../../../main.dart';

class SettingService extends SettingServiceBase {
  SettingService();
  @override
  String getDataUrl() {
    return "https://www.algoritmikfikir.com/api";
  }

  @override
  String getPhysicalUrl() {
    throw UnimplementedError("Bu Projede mevcut değil.");
  }

  @override
  String getRegisterUrl() {
    return "https://www.algoritmikfikir.com/api";
  }

  @override
  Map<String, String> get requestHeaders {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json'
      // 'Accept-Language': 'tr-TR',
      // "Product": "CloudHR",
      // "Screen": "Flutter",
      // "Client": "Android"
    });

    if (loginInfo != null && loginInfo!.authToken.isNotEmpty) {
      String token = loginInfo!.authToken;
      headers.addAll({"Authorization": "Bearer $token"});
    }

    return headers;
  }
}
