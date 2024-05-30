import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static String id = 'rootScreen';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentTab = 0;
  late PageController controller;
  int currentPage = 0;
  bool _isLoading = true;
  List<Widget> widgets = [
    const HomePage(),
    const Calender(),
    const Add(),
    const Settings(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPage);
  }

  Future<void> fetchFCT() async {
    try {
      Future.wait({
        BlocProvider.of<UserCubit>(context).getUserProfile(),
      });
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  @override
  void didChangeDependencies() {
    if (_isLoading) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: widgets,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
      bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedIndex: currentPage,
          elevation: 2,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (value) {
            setState(() {
              currentPage = value;
            });
            controller.jumpToPage(currentPage);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
              selectedIcon: Icon(
                IconlyBold.home,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: "Calender",
              selectedIcon: Icon(
                IconlyBold.calendar,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.add),
              label: "Add",
              selectedIcon: Icon(
                IconlyBold.plus,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
              selectedIcon: Icon(
                IconlyBold.setting,
              ),
            ),
          ]),
    );
  }
}
