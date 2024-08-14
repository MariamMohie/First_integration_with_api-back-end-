import 'package:project_api2/core/api/endPointes.dart';

class LogoutModel {
  final String message;

  LogoutModel({ required this.message});

  factory LogoutModel.fromJson(Map<String, dynamic> jsonData) {
    return LogoutModel(
      message: jsonData[ApiKey.message],
    );
  }
}
