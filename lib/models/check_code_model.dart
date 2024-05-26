import 'package:reminder_app/core/api/end_points.dart';

class CheckCodeModel {
  final String message;
  final String token;
  

  CheckCodeModel({required this.message,required this.token});

  
  factory CheckCodeModel.fromJson(Map<String, dynamic> jsonData) {
    return CheckCodeModel(
      message: jsonData[ApiKey.message],
      token: jsonData[ApiKey.token],
    );
  }
}