import 'package:flutter/material.dart';
import 'package:reminder_app/components/buttons.dart';
import 'package:reminder_app/screens/add_item.dart';
import 'package:reminder_app/screens/calender.dart';
import 'package:reminder_app/screens/homepage.dart';
import 'package:reminder_app/screens/setting.dart';

class CreateAdmin extends StatefulWidget {
  const CreateAdmin({super.key});

  @override
  State<CreateAdmin> createState() => _CreateAdminState();
}

class _CreateAdminState extends State<CreateAdmin> {
  @override
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 243, 243),
          title: const Text(
            "Create Admin",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: const BackButton(color: Color(0xFF5DADEC)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage("images/createAdmin.png"),
                  height: 200,
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF295c82)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'UserName',
                    hintText: 'UserName',
                    prefixIcon: const Icon(Icons.person_2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF295c82)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF295c82)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: CustomButton(
                  title: "Create",
                  onPressed: () {
                    Navigator.pushNamed(context, 'HomePage');
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
              if (index == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              } else if (index == 1) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Calender();
                }));
              } else if (index == 2) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Add();
                }));
              } else if (index == 3) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              }
            });
          },
          currentIndex: 0,
          unselectedFontSize: 15,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xFF295c82),
          selectedLabelStyle: TextStyle(fontSize: 13),
          items: [
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
  }
}
