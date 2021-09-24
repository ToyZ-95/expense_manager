import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String title;
  final VoidCallback onPressed;
  CustomElevatedButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: const Color(0xFF1441F1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Text(
          title,
          textScaleFactor: 1.2,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
