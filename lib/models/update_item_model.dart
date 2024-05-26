import 'package:reminder_app/core/api/end_points.dart';

class UpdateItemModel {
  final String title;
  final String description;
  final String item_image;
  final String pro_date;
  final String exp_date;
  final String start_reminder;
  final String code;
  final String category_id;

  UpdateItemModel(
      {required this.title,
      required this.description,
      required this.item_image,
      required this.category_id,
      required this.start_reminder,
      required this.pro_date,
      required this.code,
      required this.exp_date});

  factory UpdateItemModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateItemModel(
        title: jsonData['data'][ApiKey.title],
        description: jsonData['data'][ApiKey.description],
        item_image: jsonData['data'][ApiKey.item_image],
        pro_date: jsonData['data'][ApiKey.pro_date],
        exp_date: jsonData['data'][ApiKey.exp_date],
        start_reminder: jsonData['data'][ApiKey.start_reminder],
        code: jsonData['data'][ApiKey.code],
        category_id: jsonData['data'][ApiKey.category_id]);
  }
}