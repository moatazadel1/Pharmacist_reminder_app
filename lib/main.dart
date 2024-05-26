import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cache/cache_helper.dart';
import 'package:reminder_app/core/Home/Presentation/views/main_home_view.dart';
import 'package:reminder_app/core/api/dio_consumer.dart';
import 'package:reminder_app/core/api/end_points.dart';
import 'package:reminder_app/core/functions/constant.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/root_screen.dart';
import 'package:reminder_app/screens/all_items.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/service/service_Locator.dart';
import 'package:reminder_app/views/home_view.dart';
import 'package:reminder_app/widgets/startup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();

  Widget widget;
  token = getIt<CacheHelper>().getData(key: ApiKey.token);

  if (token != null) {
    widget = const RootScreen();
  } else {
    widget = const StartUp();
  }
  runApp(
    ReminderApp(
      startWidget: widget,
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
      // ..allData()
      // ..soonExpiredData()
      // ..expiredData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
        routes: {
          HomePage.id: (context) => const HomePage(),
          RootScreen.id: (context) => const RootScreen(),
        },
      ),
    );
  }
}
