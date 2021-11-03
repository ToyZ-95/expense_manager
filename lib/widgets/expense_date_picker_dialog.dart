import 'package:expense_manager/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'expense_date_picker.dart';

class ExpenseDatePickerDialog extends StatelessWidget {
  String month;
  ExpenseDatePickerDialog({required this.month});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      month,
                      style: const TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      DateTime.now().year.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                          fontSize: 20.0),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: ExpenseDatePicker(
                month: month,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 30.0),
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                primary: kPrimaryColor,
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              child: const Text(
                'Select',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
