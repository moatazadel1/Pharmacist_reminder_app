//هستقبل هنا الريسبوند اللي بيرجع من البوست مان v006
import 'package:reminder_app/core/api/end_points.dart';

class SignInModel {
  final String status;
  final String token;

  SignInModel({required this.status, required this.token});

  //from json علشان هستقبلهم من الجيسون
  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      status: jsonData[ApiKey.status],
      token: jsonData[ApiKey.token],
    );
  }
}
