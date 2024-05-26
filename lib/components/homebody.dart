// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:reminder_app/components/searchfield.dart';
// import 'package:reminder_app/core/functions/userProfileProvider.dart';
// import 'package:reminder_app/cubit/user_cubit.dart';
// import 'package:reminder_app/cubit/user_state.dart';
// import 'package:reminder_app/models/user_model.dart';
// import 'package:reminder_app/screens/add_item.dart';
// import 'package:reminder_app/screens/homepage.dart';
// import 'package:reminder_app/screens/all_items.dart';
// import 'package:reminder_app/screens/calender.dart';
// import 'package:reminder_app/screens/expired.dart';
// import 'package:reminder_app/screens/profile.dart';
// import 'package:reminder_app/screens/see_all.dart';
// import 'package:reminder_app/screens/setting.dart';
// import 'package:reminder_app/screens/soon_to_expire.dart';

// import 'package:reminder_app/widgets/categories_list_view.dart';

// import 'package:reminder_app/widgets/noti_list_view.dart';

// class homeViewBody extends StatelessWidget {
//   const homeViewBody({
//     super.key,
//     required this.user3,
//   });
//   final UserModel user3;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) {
//                     return const PersonalProfile();
//                   }));
//                 },
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 30, left: 15, right: 3),
//                       child: CircleAvatar(
//                         radius: 30,
//                         child: CircleAvatar(
//                           radius: 80,
//                           backgroundImage: NetworkImage(user3.image),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 30, left: 10, right: 70),
//                       child: Text(user3.name,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.blueGrey,
//                           )),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 30, left: 60),
//                       child: Icon(Icons.person, color: Colors.grey, size: 35),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(12),
//                 child: SearchField(),
//               ),
//               // ignore: prefer_const_constructors
//               Padding(
//                 padding: const EdgeInsets.only(right: 250),
//                 child: const Text("Recent",
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: categoris_list_view(),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               Container(
//                 height: 50,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   border:
//                       Border.all(color: const Color(0xFF295c82), width: 1.5),
//                 ),
//                 child: ListTile(
//                   title: const Text(
//                     "All Items",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   leading: const Icon(
//                     Icons.list,
//                     color: Color(0xFF295c82),
//                     size: 25,
//                   ),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 25),
//                   onTap: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) {
//                       return const AllItems();
//                     }));
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               Container(
//                 height: 50,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   border:
//                       Border.all(color: const Color(0xFF295c82), width: 1.5),
//                 ),
//                 child: ListTile(
//                   title: const Text(
//                     "Soon To Expired",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   leading: const Icon(
//                     Icons.timelapse,
//                     color: Color(0xFF295c82),
//                     size: 25,
//                   ),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 25),
//                   onTap: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) {
//                       return const SoonToExpire();
//                     }));
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               Container(
//                 height: 50,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   border:
//                       Border.all(color: const Color(0xFF295c82), width: 1.5),
//                 ),
//                 child: ListTile(
//                   title: const Text(
//                     "Expired",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   leading: const Icon(
//                     Icons.format_indent_increase,
//                     color: Color(0xFF295c82),
//                     size: 25,
//                   ),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 25),
//                   onTap: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) {
//                       return const Expired();
//                     }));
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8),
//                 child: Row(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(top: 3, left: 10),
//                       child: Text("All Reminders",
//                           style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold)),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           return const SeeAll();
//                         }));
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.only(left: 120),
//                         child: Text("See All",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Color(0xFF295c82),
//                             )),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 0),
//                 child: noti_list_view(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
