import 'package:reminder_app/core/api/end_points.dart';

class ForgetModel {
  final String token;
  final bool status;

  ForgetModel({required this.token, required this.status});

  
  factory ForgetModel.fromJson(Map<String, dynamic> jsonData) {
    return ForgetModel(
      token: jsonData[ApiKey.token],
      status: jsonData[ApiKey.status],
    );
  }
}