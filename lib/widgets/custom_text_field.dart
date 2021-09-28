import 'package:expense_manager/constants/constants.dart';
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
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: kSecondaryColor,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
