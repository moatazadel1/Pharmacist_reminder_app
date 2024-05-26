import 'package:reminder_app/core/api/end_points.dart';

class ExpiredProductModel {
  final List<ExpiredModel> data;

  ExpiredProductModel({required this.data});

  factory ExpiredProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<ExpiredModel> products = List<ExpiredModel>.from(
        jsonData['data'].map((productJson) => ExpiredModel.fromJson(productJson)));
    return ExpiredProductModel(data: products);
  }
}

class ExpiredModel {
  final int id;
  final int quantity;
  final String title;
  final String proDate;
  final String expDate;
  final String startReminder;
  final int code;
  final String description;
  final int categoryId;
  final String itemImage;
  final String type;

  ExpiredModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.proDate,
    required this.expDate,
    required this.startReminder,
    required this.code,
    required this.description,
    required this.categoryId,
    required this.itemImage,
    required this.type,
  });

  factory ExpiredModel.fromJson(Map<String, dynamic> json) {
    return ExpiredModel(
      id: json[ApiKey.id] ?? 0, // Provide a default value if null
      quantity: json[ApiKey.quantity] ?? 0, // Provide a default value if null
      title: json[ApiKey.title] ?? '', // Provide a default value if null
      proDate: json[ApiKey.pro_date] ?? '', // Provide a default value if null
      expDate: json[ApiKey.exp_date] ?? '', // Provide a default value if null
      startReminder: json[ApiKey.start_reminder] ?? '', // Provide a default value if null
      code: json[ApiKey.code] ?? 0, // Provide a default value if null
      description: json[ApiKey.description] ?? '', // Provide a default value if null
      categoryId: json[ApiKey.category_id] ?? 0, // Provide a default value if null
      itemImage: json[ApiKey.item_image] ?? '', // Provide a default value if null
      type: json[ApiKey.type] ?? '', // Provide a default value if null
    );
  }
}
