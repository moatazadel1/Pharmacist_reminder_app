import 'package:reminder_app/core/api/end_points.dart';

class UserModel {
  final String image;
  final String email;
  final String name;

  UserModel({required this.image, required this.email, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        image: jsonData['user'][ApiKey.image],
        email: jsonData['user'][ApiKey.email],
        name: jsonData['user'][ApiKey.name]);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'user': {
  //       ApiKey.image: image,
  //       ApiKey.email: email,
  //       ApiKey.name: name,
  //     },
  //   };
  // }
}
