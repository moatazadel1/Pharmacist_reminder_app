import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/container.dart';
import 'package:reminder_app/components/exContainer.dart';
import 'package:reminder_app/components/searchfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/root_screen.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class Expired extends StatefulWidget {
  const Expired({super.key});

  @override
  State<Expired> createState() => _ExpiredState();
}

class _ExpiredState extends State<Expired> {
  int index = 0;
  @override
  void initState() {
    super.initState();

    // Fetch all products when the widget is initialized
    context.read<UserCubit>().expiredData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 244, 243, 243),
              title: const Text(
                "Expired",
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
            body: state is ExpiredLoading
                ? const CircularProgressIndicator()
                : state is ExpiredSuccess
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
                                  children:
                                      state.exproducts.data.map((exproduct) {
                                    return ExCustomContainer(
                                      exproducts: exproduct,
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
