import 'package:reminder_app/core/api/end_points.dart';

class EditUserModel {
  final String status;
  final String name;
  final String email;
  final String image;

  EditUserModel(
      {required this.status,
      required this.name,
      required this.email,
      required this.image});
  factory EditUserModel.fromJson(Map<String, dynamic> jsonData) {
    return EditUserModel(
      status: jsonData[ApiKey.status],
      name: jsonData['user'][ApiKey.name] ?? '',
      email: jsonData['user'][ApiKey.email] ?? '',
      image: jsonData['user'][ApiKey.image] ?? '',
    );
  }
}
