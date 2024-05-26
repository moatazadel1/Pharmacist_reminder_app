import 'package:reminder_app/core/api/end_points.dart';

class DeleteModel {
  final String status;
  final String msg;

  DeleteModel({required this.status, required this.msg});

  //from json علشان هستقبلهم من الجيسون
  factory DeleteModel.fromJson(Map<String, dynamic> jsonData) {
    return DeleteModel(
      status: jsonData[ApiKey.status]?? '',
      msg: jsonData[ApiKey.message]?? '',
    );
  }
}