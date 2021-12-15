import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/screens/stats.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'indicator.dart';

class RemainingExpensePieChartCard extends StatelessWidget {
  BudgetModel budgetModel;
  bool editable;

  HomeController homeController = Get.find();

  RemainingExpensePieChartCard(
      {required this.budgetModel, required this.editable});

  List<Widget> getWidgets(BuildContext context, bool editable) {
    List<Widget> list = [];
    list.add(
      Text(
        budgetModel.monthName!,
        style: const TextStyle(
          letterSpacing: 1.2,
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
    );
    list.add(
      Text(
        budgetModel.year!.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kSecondaryColor,
            fontSize: 20.0),
      ),
    );
    list.add(
      Expanded(
        child: GestureDetector(
          onTap: () {
            Get.to(() => Stats(
                  budgetModel: budgetModel,
                  selectedTab: 1,
                ));
          },
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 35.0,
              // read about it in the PieChartData section
              sections: [
                if (homeController.getTotalExpenses(budgetModel.id!) <
                    homeController.getBudget(budgetModel))
                  PieChartSectionData(
                    value: double.parse(
                        homeController.getRemainingPercent(budgetModel)),
                    showTitle: false,
                    color: kPrimaryColor,
                    //title: remainingPercent + '%',
                    badgeWidget: Text(
                      homeController.getRemainingPercent(budgetModel) + '%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    badgePositionPercentageOffset: homeController
                            .getRemainingPercent(budgetModel)
                            .contains('100')
                        ? 1.8
                        : 1.7,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                if (homeController.getTotalExpenses(budgetModel.id!) > 0.0)
                  PieChartSectionData(
                    value: double.parse(
                        homeController.getExpensePercent(budgetModel)),
                    showTitle: false,
                    //title: expensePercent + '%',
                    color: kSecondaryColor,
                    badgeWidget: Text(
                      homeController.getExpensePercent(budgetModel) + '%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    badgePositionPercentageOffset: homeController
                            .getExpensePercent(budgetModel)
                            .contains('100')
                        ? 1.8
                        : 1.7,
                    titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
              ],
            ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        ),
      ),
    );
    list.add(
      const SizedBox(
        height: 5,
      ),
    );
    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Indicator(
              color: kPrimaryColor,
              text: 'Remaining',
              isSquare: true,
            ),
            SizedBox(
              width: 8.0,
            ),
            Indicator(
              color: kSecondaryColor,
              text: 'Expense',
              isSquare: true,
            ),
          ],
        ),
      ),
    );
    list.add(
      const SizedBox(
        height: 10.0,
      ),
    );

    if (editable) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Edit Budget',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: kSecondaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
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
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height / 1.8,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getWidgets(context, editable),
      ),
    );
  }
}
