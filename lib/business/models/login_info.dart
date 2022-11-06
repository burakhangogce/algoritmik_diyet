import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  String authToken = "";
  String email = "";
  List<String>? claims = List.empty();
  bool rememberMe = false;

  static LoginInfo? _instance;
  factory LoginInfo(String authToken, List<String>? claims, bool rememberMe) {
    return _instance ??= LoginInfo._internal(authToken, claims, rememberMe);
  }
  LoginInfo._internal(this.authToken, this.claims, this.rememberMe);

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}
