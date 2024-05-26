import 'package:flutter/material.dart';
import 'package:reminder_app/models/category_model.dart';
import 'package:reminder_app/models/noti_model.dart';

class NotiCard extends StatelessWidget {
  const NotiCard({super.key, required this.notificatin});
  final NotiModel notificatin;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                Icons.notifications,
                size: 25,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(notificatin.notification,
                    style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              Text(notificatin.time,
                  style: const TextStyle(fontSize: 15, color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
}
