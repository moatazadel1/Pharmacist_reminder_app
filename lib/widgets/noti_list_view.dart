import 'package:flutter/material.dart';
import 'package:reminder_app/models/noti_model.dart';
import 'package:reminder_app/widgets/noti_card.dart';

// ignore: camel_case_types
class noti_list_view extends StatelessWidget {
  const noti_list_view({
    super.key,
  });

  final List<NotiModel> notifications = const [
    NotiModel(
        notification: "Today,25 boxes of panadol pills were introdused",
        time: "10:00 am",
        icon: Icon(Icons.notifications)),
    NotiModel(
        notification:
            "Today,20 boxes of panadol pills ", //have an expiration date of 6 months",
        time: "05:00 am",
        icon: Icon(Icons.notifications)),
    NotiModel(
        notification: "Yesterday,30 injections were tokenout",
        time: "01:00 am",
        icon: Icon(Icons.notifications)),
    NotiModel(
        notification: "Today,25 boxes of panadol pills were introdused",
        time: "10:00 am",
        icon: Icon(Icons.notifications)),
    NotiModel(
        notification:
            "Today,20 boxes of panadol pills ", //have an expiration date of 6 months",
        time: "05:00 am",
        icon: Icon(Icons.notifications)),
    NotiModel(
        notification: "Yesterday,30 injections were tokenout",
        time: "01:00 am",
        icon: Icon(Icons.notifications))
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotiCard(
            notificatin: notifications[index],
          );
        },
      ),
    );
  }
}
