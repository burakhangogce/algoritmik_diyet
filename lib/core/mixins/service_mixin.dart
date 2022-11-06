import 'package:get_it/get_it.dart';
import '../../business/services/general/setting_service.dart';

mixin ServiceMixin {
  String url = "";
  String path = "";
  final SettingService settingService = GetIt.instance<SettingService>();

  Map<String, String> createHeaders({bool isAuthorizedRequired = true}) {
    /*
    if (isAuthorizedRequired && loginInfo != null) {
      String token = loginInfo?.authToken ?? "";
      settingService.requestHeaders.addAll({"Authorization": "Bearer $token"});
    }
    */

    return settingService.requestHeaders;
  }

  Uri getUri(String methodName) {
    return Uri.parse("$url/$path/$methodName");
  }
}
