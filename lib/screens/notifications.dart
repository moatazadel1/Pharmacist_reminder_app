import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/core/models/notification_model.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/root_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    super.key,
  });
  static String id = 'allItems';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).allData();
  }

  // Future<void> loadNotifications() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List<String> notificationStrings =
  //       prefs.getStringList('notifications') ?? [];
  //   setState(() {
  //     notifications = notificationStrings
  //         .map((e) => NotificationModel.fromMap(json.decode(e)))
  //         .toList();
  //   });
  //   // Debugging statement to verify loading notifications
  // }

  // Future<void> removeNotificationById(int productId) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List<String> notificationStrings =
  //       prefs.getStringList('notifications') ?? [];

  //   notificationStrings.removeWhere((notificationString) {
  //     final notification =
  //         NotificationModel.fromMap(json.decode(notificationString));
  //     return notification.id == productId;
  //   });

  //   await prefs.setStringList('notifications', notificationStrings);
  // }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      // if (state is AddItemSuccess) {}
      // if (state is DeleteSuccess) {}
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 244, 243, 243),
            title: const Text(
              "Scheduled Notifications",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF295c82)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RootScreen.id,
                    arguments:
                        BlocProvider.of<UserCubit>(context).getUserProfile());
              },
            ),
          ),
          body: state is AllProductsLoading
              ? const Center(child: CircularProgressIndicator())
              : state is AllProductsSuccess
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.products.data[index].title),
                          subtitle: Text(
                            'The product "${state.products.data[index].title}" will soon be about to expire on "${state.products.data[index].expDate}" \nYou will receive a reminder notification on: ${state.products.data[index].startReminder}',
                          ),
                          isThreeLine: true,
                          // trailing: IconButton(
                          //   icon: const Icon(Icons.delete),
                          //   onPressed: () async {
                          //     final notification = notifications[index];

                          //     await removeNotificationById(notification.id);
                          //   },
                          // ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 2,
                        );
                      },
                      itemCount: state.products.data.length,
                    )
                  : Container());
    });
  }
}
