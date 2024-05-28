import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reminder_app/core/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notificationStrings =
        prefs.getStringList('notifications') ?? [];
    setState(() {
      notifications = notificationStrings
          .map((e) => NotificationModel.fromMap(json.decode(e)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scheduled Notifications'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(
                    '${notification.body}\nYou will receive a reminder notification on: ${notification.scheduledDate}'),
                isThreeLine: true,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemCount: notifications.length)

        //  ListView.builder(
        //   itemCount: notifications.length,
        //   itemBuilder: (context, index) {
        // final notification = notifications[index];
        // return ListTile(
        //   title: Text(notification.title),
        //   subtitle: Text(
        //       '${notification.body}\nYou will receive a reminder notification on: ${notification.scheduledDate}'),
        //   isThreeLine: true,
        // );
        //   },
        // ),
        );
  }
}
