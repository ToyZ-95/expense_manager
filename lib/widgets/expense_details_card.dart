import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseDetailsCard extends StatelessWidget {
  ExpenseModel? expenseModel;
  ExpenseDetailsCard({required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Image.asset(
            getCategoryIconPath(expenseModel!.category!),
            height: 24.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              height: 45.0,
              padding: const EdgeInsets.only(left: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFF6F6F6),
                      offset: Offset(-0.5, 0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1.2),
                  BoxShadow(
                      color: Color(0xFFF6F6F6),
                      offset: Offset(0.5, -0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1.2),
                  BoxShadow(
                      color: Color(0xFFF6F6F6),
                      offset: Offset(-0.5, -0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1.2),
                  BoxShadow(
                      color: Color(0xFFF6F6F6),
                      offset: Offset(0.5, 0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1.2),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    expenseModel!.expenseName!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    expenseModel!.amount.toString(),
                    style: const TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.attach_money_sharp,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getCategoryIconPath(ExpenseCategory category) {
    String iconPath = '';
    switch (category) {
      case ExpenseCategory.bills:
        iconPath = 'assets/bills.png';
        break;
      case ExpenseCategory.food:
        iconPath = 'assets/food.png';
        break;
      case ExpenseCategory.clothes:
        iconPath = 'assets/clothes.png';
        break;
      case ExpenseCategory.transport:
        iconPath = 'assets/transport.png';
        break;
      case ExpenseCategory.fun:
        iconPath = 'assets/fun.png';
        break;
      case ExpenseCategory.other:
        iconPath = 'assets/other.png';
        break;
    }
    return iconPath;
  }
}
