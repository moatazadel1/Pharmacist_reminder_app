import 'package:reminder_app/core/api/end_points.dart';

class SignUpModel {
  final String status;
  final String token;
  

  SignUpModel( {required this.status, required this.token});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      status: jsonData[ApiKey.status],
      token: jsonData[ApiKey.token],
      
    );
  }
}
