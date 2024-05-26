import 'package:reminder_app/core/api/end_points.dart';

class LogOutModel {
  final String status;
  final String message;

  LogOutModel({required this.status, required this.message});

  
  factory LogOutModel.fromJson(Map<String, dynamic> jsonData) {
    return LogOutModel(
      status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
    );
  }
}