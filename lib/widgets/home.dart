import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/screens/add_expense_screen.dart';
import 'package:expense_manager/widgets/month_expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: homeController.monthsCards
                      .map(
                        (e) => HomeExpenseCard(
                          monthsCardModel: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  Get.to(AddExpense());
                },
                backgroundColor: kPrimaryColor,
                child: const Icon(
                  Icons.add,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              const Text(
                'Add Expense',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
