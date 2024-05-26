import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/noti2_list_view.dart';
import 'package:reminder_app/widgets/noti_list_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text("All Notifications",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              )),
        ),
        leading: BackButton(color: Color(0xFF295c82)),
      ),
      body: Column(children: [noti2_list_view()]),
    );
  }
}
