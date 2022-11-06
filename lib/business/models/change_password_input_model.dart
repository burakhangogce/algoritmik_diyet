import 'package:json_annotation/json_annotation.dart';
part 'change_password_input_model.g.dart';

@JsonSerializable()
class ChangePasswordInputModel {
  String oldPassword;
  String newPassword;
  ChangePasswordInputModel({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordInputModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordInputModelToJson(this);
}
