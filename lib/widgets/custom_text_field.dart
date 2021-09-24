import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController textFieldontroller;
  bool obsecure;
  CustomTextField(
      {required this.label,
      required this.textFieldontroller,
      required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure,
      controller: textFieldontroller,
      style: const TextStyle(
        color: Color(0xFF1441F1),
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF9ba5f8),
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF1441F1),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF9ba5f8),
          ),
        ),
      ),
    );
  }
}
