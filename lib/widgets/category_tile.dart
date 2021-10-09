import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/utilities/helper_class.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  String? label;
  ExpenseCategory? expenseCategory;
  bool? selected;

  CategoryTile(
      {required this.label,
      required this.expenseCategory,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      width: 95.0,
      height: 90.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(
          width: selected! ? 2.0 : 1.0,
          color: selected! ? kPrimaryColor : kSecondaryColor,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            HelperClass.getCategoryIconPath(expenseCategory!),
            height: selected! ? 30.0 : 25.0,
          ),
          const SizedBox(
            height: 13.0,
          ),
          Text(
            label!,
            style: selected!
                ? const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold)
                : const TextStyle(
                    color: kSecondaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
