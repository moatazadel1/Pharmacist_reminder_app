import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/components/container.dart';
import 'package:reminder_app/components/searchfield.dart';
import 'package:reminder_app/cubit/user_cubit.dart';
import 'package:reminder_app/cubit/user_state.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class AllItems extends StatefulWidget {
  const AllItems({Key? key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  int index = 0;
  void initState() {
    super.initState();
    // Fetch all products when the widget is initialized
    context.read<UserCubit>().allData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is AddItemSuccess || state is DeleteSuccess) {
          // Item added successfully, trigger a refresh to display the new item
          
          context.read<UserCubit>().showOne();
          
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 244, 243, 243),
            title: const Text(
              "All Items",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: BackButton(color: Color(0xFF295c82)),
          ),
          body: state is AllProductsLoading
              ? CircularProgressIndicator()
              : state is AllProductsSuccess
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
                                children: state.products.data.map((product) {
                                  return CustomContainer(
                                    product: product,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (value) {
          //     setState(() {
          //       index = value;
          //       if (index == 0) {
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //           return HomePage();
          //         }));
          //       } else if (index == 1) {
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //           return Calender();
          //         }));
          //       } else if (index == 2) {
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //           return Add();
          //         }));
          //       } else if (index == 3) {
          //         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //           return Settings();
          //         }));
          //       }
          //     });
          //   },
          //   currentIndex: 0,
          //   unselectedFontSize: 15,
          //   unselectedItemColor: Colors.grey,
          //   selectedItemColor: Color(0xFF295c82),
          //   selectedLabelStyle: TextStyle(fontSize: 13),
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: "Home",
          //       backgroundColor: Color.fromARGB(255, 230, 230, 230),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.calendar_month),
          //       label: "Calendar",
          //       backgroundColor: Color.fromARGB(255, 230, 230, 230),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.add),
          //       label: "Add",
          //       backgroundColor: Color.fromARGB(255, 230, 230, 230),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings),
          //       label: "Settings",
          //       backgroundColor: Color.fromARGB(255, 230, 230, 230),
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}