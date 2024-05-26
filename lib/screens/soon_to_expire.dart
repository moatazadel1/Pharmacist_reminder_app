import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/container.dart';
import 'package:reminder_app/components/searchfield.dart';
import 'package:reminder_app/components/soonContainer.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/root_screen.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class SoonToExpire extends StatefulWidget {
  const SoonToExpire({super.key});

  @override
  State<SoonToExpire> createState() => _SoonToExpireState();
}

class _SoonToExpireState extends State<SoonToExpire> {
  int index = 0;
  @override
  void initState() {
    super.initState();

    // Fetch all products when the widget is initialized
    context.read<UserCubit>().soonExpiredData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 244, 243, 243),
              title: const Text(
                "SoonToExpired",
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
                      arguments: BlocProvider.of<UserCubit>(context)
                          .getUserProfile()); // Navigate back to the previous screen
                },
              ),
            ),
            body: state is SoonExpiredLoading
                ? const CircularProgressIndicator()
                : state is SoonExpiredSuccess
                    ? CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SearchField(),
                                ),
                                Column(
                                  children: state.soonexproducts.data
                                      .map((soonexproduct) {
                                    return SoonExCustomContainer(
                                      soonexproducts: soonexproduct,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container(),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  index = value;
                  if (index == 0) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }));
                  } else if (index == 1) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Calender();
                    }));
                  } else if (index == 2) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Add();
                    }));
                  } else if (index == 3) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Settings();
                    }));
                  }
                });
              },
              currentIndex: 0,
              unselectedFontSize: 15,
              unselectedItemColor: Colors.grey,
              selectedItemColor: const Color(0xFF295c82),
              selectedLabelStyle: const TextStyle(fontSize: 13),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Color.fromARGB(255, 230, 230, 230)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: "Calender",
                    backgroundColor: Color.fromARGB(255, 230, 230, 230)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: "Add",
                    backgroundColor: Color.fromARGB(255, 230, 230, 230)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Settings",
                    backgroundColor: Color.fromARGB(255, 230, 230, 230)),
              ],
            ));
      },
    );
  }
}
