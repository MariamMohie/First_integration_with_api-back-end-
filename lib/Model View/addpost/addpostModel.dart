import 'package:project_api2/core/api/endPointes.dart';

class AddPostModel {
  final bool status;
  final String message;

  AddPostModel({required this.status, required this.message});

  factory AddPostModel.fromJson(Map<String, dynamic> jsonData) {
    return AddPostModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
    );
  }
}