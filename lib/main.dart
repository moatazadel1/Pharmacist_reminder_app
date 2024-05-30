import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cache/cache_helper.dart';
import 'package:reminder_app/core/api/dio_consumer.dart';
import 'package:reminder_app/core/api/end_points.dart';
import 'package:reminder_app/core/functions/constant.dart';
import 'package:reminder_app/core/utils/notification/local_notification_service.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/root_screen.dart';
import 'package:reminder_app/screens/all_items.dart';
import 'package:reminder_app/screens/edit.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';
import 'package:reminder_app/service/service_Locator.dart';
import 'package:reminder_app/widgets/startup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init(); // Initialize the notification service

  setupServiceLocator();
  await getIt<CacheHelper>().init();

  Widget startWidget;
  token = getIt<CacheHelper>().getData(key: ApiKey.token);

  if (token != null) {
    startWidget = const RootScreen();
  } else {
    startWidget = const StartUp();
  }
  runApp(
    ReminderApp(
      startWidget: startWidget,
    ),
  );
}

class ReminderApp extends StatelessWidget {
  const ReminderApp({super.key, required this.startWidget});
  final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio()))..getUserProfile(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
        routes: {
          HomePage.id: (context) => const HomePage(),
          RootScreen.id: (context) => const RootScreen(),
          Edit.id: (context) => const Edit(),
          Settings.id: (context) => const Settings(),
          AllItems.id: (context) => const AllItems(),
          StartUp.id: (context) => const StartUp(),
        },
      ),
    );
  }
}
