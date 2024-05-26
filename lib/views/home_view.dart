import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/startup.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: StartUp(),
    );
  }
}