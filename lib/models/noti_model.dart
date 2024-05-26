import 'package:flutter/material.dart';

class NotiModel {
  final String notification;
  final Icon icon;
  final String time;

  const NotiModel({
    required this.notification,
    required this.time,
    required this.icon,
  });
}
