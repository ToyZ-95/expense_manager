import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/screens/add_expense_screen.dart';
import 'package:expense_manager/screens/stats.dart';
import 'package:expense_manager/widgets/remaining_expense_pie_chart_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'month_expense_list.dart';

class HomeExpenseData extends StatelessWidget {
  MonthsCardModel monthsCardModel;

  HomeController homeController = Get.find();

  HomeExpenseData({required this.monthsCardModel});

  List<Widget> getWidgets(BuildContext context) {
    List<Widget> list = [];

    list.add(
      GestureDetector(
        onTap: () {
          Get.to(() => Stats(
                monthsCardModel: monthsCardModel,
                selectedTab: 1,
              ));
        },
        child: RemainingExpensePieChartCard(
          monthsCardModel: monthsCardModel,
          editable: true,
        ),
      ),
    );

    if (monthsCardModel.expenses == null || monthsCardModel.expenses!.isEmpty) {
      list.add(
        const SizedBox(
          height: 60.0,
        ),
      );
      list.add(
        FloatingActionButton(
          heroTag: monthsCardModel.monthName.toString() +
              monthsCardModel.year.toString(),
          onPressed: () {
            Get.to(
              () => AddExpense(
                guid: monthsCardModel.guid,
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
                          guid: monthsCardModel.guid,
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
                          monthsCardModel: monthsCardModel,
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
            MonthExpenseList(monthsCardModel: monthsCardModel, onlyLast: true),
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
