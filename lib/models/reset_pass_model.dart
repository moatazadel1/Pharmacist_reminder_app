import 'package:reminder_app/core/api/end_points.dart';

class ResetPassModel {
  final String message;
  

  ResetPassModel({required this.message});

  
  factory ResetPassModel.fromJson(Map<String, dynamic> jsonData) {
    return ResetPassModel(
      message: jsonData[ApiKey.message],
      
    );
  }
}