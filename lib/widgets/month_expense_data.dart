import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/screens/add_expense_screen.dart';
import 'package:expense_manager/screens/stats.dart';
import 'package:expense_manager/widgets/remaining_expense_pie_chart_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'month_expense_list.dart';

class HomeExpenseData extends StatelessWidget {
  BudgetModel budgetModel;

  HomeController homeController = Get.find();

  HomeExpenseData({required this.budgetModel});

  List<Widget> getWidgets(BuildContext context) {
    List<Widget> list = [];

    list.add(
      RemainingExpensePieChartCard(
        budgetModel: budgetModel,
        editable: true,
      ),
    );

    if (homeController.getExpensesUsingMonthID(budgetModel.id!) == null ||
        homeController.getExpensesUsingMonthID(budgetModel.id!)!.isEmpty) {
      list.add(
        const SizedBox(
          height: 60.0,
        ),
      );
      list.add(
        FloatingActionButton(
          heroTag:
              budgetModel.monthName.toString() + budgetModel.year.toString(),
          onPressed: () {
            Get.to(
              () => AddExpense(
                monthId: budgetModel.id!,
                month: budgetModel.monthName!,
                year: budgetModel.year!,
              ),
            );
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.add,
          ),
        ),
      );
      list.add(
        const SizedBox(
          height: 18.0,
        ),
      );
      list.add(
        const Text(
          'Add Expense',
          textScaleFactor: 1.2,
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      list.add(
        const SizedBox(
          height: 16.0,
        ),
      );
      list.add(
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    'Last Expense',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => AddExpense(
                          monthId: budgetModel.id!,
                          month: budgetModel.monthName!,
                          year: budgetModel.year!,
                        ),
                      );
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => Stats(
                          budgetModel: budgetModel,
                          selectedTab: 2,
                        ),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            MonthExpenseList(budgetModel: budgetModel, onlyLast: true),
          ],
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: getWidgets(context),
      ),
    );
  }
}
