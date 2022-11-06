// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordInputModel _$ChangePasswordInputModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordInputModel(
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordInputModelToJson(
        ChangePasswordInputModel instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
