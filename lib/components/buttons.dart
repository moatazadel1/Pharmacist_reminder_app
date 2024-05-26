import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  
    CustomButton({super.key, this.onPressed, required this.title});
    final void Function()? onPressed;
    final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF295c82),
                minimumSize: const Size(300, 50),
              ),
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            );
  }
}