import 'package:reminder_app/core/api/end_points.dart';

class AddItemModel {
  final String title;
  final String code;
  final String id;

  AddItemModel(
      {required this.title,
      required this.code,
      required this.id});

  factory AddItemModel.fromJson(Map<String, dynamic> jsonData) {
    return AddItemModel(
        id: jsonData['data'][ApiKey.id].toString(),
        title: jsonData['data'][ApiKey.title]?? '',
        code: jsonData['data'][ApiKey.code]?? '',
        );
  }
}