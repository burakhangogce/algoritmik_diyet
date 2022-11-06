// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      json['authToken'] as String,
      (json['claims'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['rememberMe'] as bool,
    )..email = json['email'] as String;

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'authToken': instance.authToken,
      'email': instance.email,
      'claims': instance.claims,
      'rememberMe': instance.rememberMe,
    };
