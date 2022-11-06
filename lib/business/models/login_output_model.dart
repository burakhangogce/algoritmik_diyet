import 'dart:convert';

import 'login_result.dart';

class LoginOutputModel {
  String username;
  String token;
  LoginOutputModel({
    required this.username,
    required this.token,
  });

  LoginOutputModel copyWith({
    String? token,
    bool? success,
    LoginResult? result,
  }) {
    return LoginOutputModel(
      token: token ?? this.token,
      username: username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'token': token,
    };
  }

  factory LoginOutputModel.fromMap(Map<String, dynamic> map) {
    return LoginOutputModel(
      username: map['username'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginOutputModel.fromJson(String source) =>
      LoginOutputModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginOutputModel(username: $username, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginOutputModel &&
        other.token == token &&
        other.username == username;
  }

  @override
  int get hashCode => token.hashCode ^ username.hashCode;
}
