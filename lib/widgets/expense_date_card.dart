import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpenseDateCard extends StatelessWidget {
  ExpenseModel? expenseModel;
  ExpenseDateCard({required this.expenseModel});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    DateTime expenseDateTime = DateTime.parse(expenseModel!.timeStamp!);

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) =>
                homeController.deleteExpense(expenseModel!, wholeDay: true),
            backgroundColor: Colors.transparent,
            foregroundColor: kPrimaryColor,
            icon: Icons.delete_outline_outlined,
          )
        ],
      ),
      child: Container(
        height: 45.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: const [
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
          border: Border.all(color: kSecondaryColor),
        ),
        child: Row(
          children: [
            Text(
              DateFormat('d').format(expenseDateTime),
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              DateFormat('EEEE').format(expenseDateTime),
              style: const TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
