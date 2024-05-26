// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:reminder_app/core/Home/Presentation/manager/nav_bar_cubit/nav_bar_cubit.dart';

// class MainHomeView extends StatelessWidget {
//   const MainHomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       return PersistentTabView(
//         context,
//         screens: _buildScreens(context),
//         items: _navBarsItems(context),
//         controller: BlocProvider.of<NavBarCubit>(context).controller,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         hideNavigationBarWhenKeyboardShows: true,
//         confineInSafeArea: true,
//         handleAndroidBackButtonPress: true,
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle: NavBarStyle.style8,
//         decoration: const NavBarDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//       );
//     });
//   }
// }

// List<Widget> _buildScreens(BuildContext context) {
//   return [
//     // const StoreView(),
//     const SizedBox(),
//     const SizedBox(),
//     // const LaboratoriesView(), // TODO: change it to the chat view
//   ];
// }

// List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Container(
//         padding: const EdgeInsets.all(6.0),
//         decoration:
//             const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//         child: const Icon(Icons.home,
//             // colorFilter: ColorFilter.mode(
//             //   Colors.white,
//             // BlendMode.color
//             // ),
//             color: Colors.white),
//       ),
//       inactiveIcon: const Icon(Icons.home, color: Color(0xff858EA9)),
//     ),
//     PersistentBottomNavBarItem(
//       icon: Container(
//         padding: const EdgeInsets.all(6.0),
//         decoration:
//             const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//         child: const Icon(Icons.calendar_month, color: Colors.white),
//       ),
//       inactiveIcon: const Icon(Icons.calendar_month, color: Color(0xff858EA9)),
//     ),
//     PersistentBottomNavBarItem(
//       icon: Container(
//         padding: const EdgeInsets.all(6.0),
//         decoration:
//             const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//       inactiveIcon: const Icon(Icons.add, color: Color(0xff858EA9)),
//     ),
//     PersistentBottomNavBarItem(
//       icon: Container(
//         padding: const EdgeInsets.all(6.0),
//         decoration:
//             const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//         child: const Icon(Icons.settings, color: Colors.white),
//       ),
//       inactiveIcon: const Icon(Icons.settings, color: Color(0xff858EA9)),
//     ),
//   ];
// }
