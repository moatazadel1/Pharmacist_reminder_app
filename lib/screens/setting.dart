import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/searchfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/log_in.dart';
import 'package:reminder_app/screens/notifications.dart';
import 'package:reminder_app/screens/profile.dart';
import 'package:reminder_app/screens/sign_up.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static String id = 'settingsScreen';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int index = 3;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('logged out success'),
            ),
          );

          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return LogIn();
            }),
          );
        } else if (state is LogOutFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errmessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,

            backgroundColor: const Color.fromARGB(255, 244, 243, 243),
            title: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            // leading: const BackButton(color: Color(0xFF295c82)),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: SearchField(),
                  ),
                  const SizedBox(height: 1),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const PersonalProfile();
                      }));
                    },
                    title: const Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.person,
                      color: Color(0xFF295c82),
                      size: 25,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                  ),
                  const SizedBox(height: 1),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const NotificationsScreen();
                      }));
                    },
                    title: const Text(
                      "Notifications",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.notifications,
                      color: Color(0xFF295c82),
                      size: 25,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                  ),
                  const SizedBox(height: 1),
                  const ListTile(
                    title: Text(
                      "Privacy",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.lock,
                      color: Color(0xFF295c82),
                      size: 25,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                  ),
                  const SizedBox(height: 1),
                  const ListTile(
                    title: Text(
                      "Security",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.security,
                      color: Color(0xFF295c82),
                      size: 25,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                  ),
                  const SizedBox(height: 1),
                  const ListTile(
                    title: Text(
                      "About",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.error_outline,
                      color: Color(0xFF295c82),
                      size: 25,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                  ),
                  const SizedBox(height: 1),
                  const ListTile(
                    title: Text(
                      "Help",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.help,
                      color: Color(0xFF295c82),
                      size: 25,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                  ),
                  const SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(right: 250, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.read<UserCubit>().logOut();
                      },
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF295c82),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (value) {
          //     setState(() {
          //       index = value;
          //       if (index == 0) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const HomePage();
          //         }));
          //       } else if (index == 1) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const Calender();
          //         }));
          //       } else if (index == 2) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const Add();
          //         }));
          //       } else if (index == 3) {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (context) {
          //           return const Settings();
          //         }));
          //       }
          //     });
          //   },
          //   currentIndex: 3,
          //   unselectedFontSize: 15,
          //   unselectedItemColor: Colors.grey,
          //   selectedItemColor: const Color(0xFF295c82),
          //   selectedLabelStyle: const TextStyle(fontSize: 13),
          //   items: const [
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: "Home",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.calendar_month),
          //         label: "Calender",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.add),
          //         label: "Add",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.settings),
          //         label: "Settings",
          //         backgroundColor: Color.fromARGB(255, 230, 230, 230)),
          //   ],
          // ),
        );
      },
    );
  }
}
