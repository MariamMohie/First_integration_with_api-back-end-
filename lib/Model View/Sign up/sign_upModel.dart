import 'package:project_api2/core/api/endPointes.dart';

class SignUpModel{
final bool status;
  final String message;
  final UserData data;

   SignUpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory  SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return  SignUpModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
      data: UserData.fromJson(jsonData[ApiKey.data]),
    );
  }
}

class UserData {
  final User user;
  final String token;

  UserData({
    required this.user,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> jsonData) {
    return UserData(
      user: User.fromJson(jsonData[ApiKey.user]),
      token: jsonData[ApiKey.token],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? createdAt;
  final String? updatedAt;
  final String? bio;
  final String? image;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.bio,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
        id: jsonData[ApiKey.id],
        name: jsonData[ApiKey.name],
        email: jsonData[ApiKey.email],
        createdAt: jsonData[ApiKey.created_at],
        updatedAt: jsonData[ApiKey.updated_at],
        image: jsonData[ApiKey.image],
        bio: jsonData[ApiKey.bio]);
  }
}