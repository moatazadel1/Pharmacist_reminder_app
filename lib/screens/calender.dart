import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            // leading: const BackButton(color: Color(0xFF295c82)),
            title: const Text(
              "Calender",
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 31,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 265,
                            width: 282,
                            child: CalendarDatePicker2(
                              config: CalendarDatePicker2Config(
                                calendarType: CalendarDatePicker2Type.range,
                                rangeBidirectional: true,
                                firstDate: DateTime(DateTime.now().year - 5),
                                lastDate: DateTime(DateTime.now().year + 5),
                                selectedDayHighlightColor:
                                    const Color(0XFFFFFFFF),
                                centerAlignModePicker: true,
                                firstDayOfWeek: 0,
                                controlsHeight: 20.83,
                                weekdayLabelTextStyle: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                                selectedDayTextStyle: const TextStyle(
                                  color: Color(0XFF252C33),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                                controlsTextStyle: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                                disabledDayTextStyle: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                                weekdayLabels: [
                                  "Sun",
                                  "Mon",
                                  "Tue",
                                  "Wed",
                                  "Thu",
                                  "Fri",
                                  "Sat"
                                ],
                              ),
                              value: const [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // CustomContainer(
                    //     title: "",
                    //     cType: "cType",
                    //     pdate: '29/9/2002',
                    //     exdate: "10/11/2002"),
                  ],
                ),
              )
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
          //   currentIndex: 1,
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
