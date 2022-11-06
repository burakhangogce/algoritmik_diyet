import 'dart:convert';

class UserInfoModel {
  String? displayName;
  String? username;
  String? email;
  String? password;
  UserInfoModel({
    this.displayName,
    this.username,
    this.email,
    this.password,
  });

  UserInfoModel copyWith({
    String? displayName,
    String? username,
    String? email,
    String? password,
  }) {
    return UserInfoModel(
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DisplayName': displayName,
      'UserName': username,
      'Email': email,
      'Password': password,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      displayName: map['DisplayName'],
      username: map['UserName'],
      email: map['Email'],
      password: map['Password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserInfoModel(UserName: $username, Email: $email, DisplayName: $displayName, Password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfoModel &&
        other.username == username &&
        other.displayName == displayName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
