// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// part 'nav_bar_state.dart';

// class NavBarCubit extends Cubit<NavBarState> {
//   NavBarCubit() : super(NavBarInitial());

//   PersistentTabController? controller =
//       PersistentTabController(initialIndex: 0);

//   void changeIndex(int index, BuildContext context) {
//     ChangeBottomNavBarLoadingState();
//     controller!.jumpToTab(index);
//     emit(ChangeBottomNavBarSuccessState());
//   }
// }
