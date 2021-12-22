import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/utilities/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ExpenseDetailsCard extends StatelessWidget {
  ExpenseModel? expenseModel;

  HomeController homeController = Get.find();

  ExpenseDetailsCard({required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => homeController.deleteExpense(expenseModel!),
            backgroundColor: Colors.transparent,
            foregroundColor: kPrimaryColor,
            icon: Icons.delete_outline_outlined,
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Image.asset(
              HelperClass.getCategoryIconPath(expenseModel!.category!),
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
      ),
    );
  }
}
