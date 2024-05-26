import 'package:reminder_app/core/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.errorMessage,required this.status});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.error],
    );
  }
}
