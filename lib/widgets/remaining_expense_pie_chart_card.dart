import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'indicator.dart';

class RemainingExpensePieChartCard extends StatelessWidget {
  MonthsCardModel monthsCardModel;

  HomeController homeController = Get.find();

  RemainingExpensePieChartCard({required this.monthsCardModel});

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
      height: MediaQuery.of(context).size.height / 2 + 50.0,
      padding: const EdgeInsetsDirectional.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            monthsCardModel.monthName!,
            textScaleFactor: 1.2,
            style: const TextStyle(
              letterSpacing: 1.2,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            monthsCardModel.year!.toString(),
            textScaleFactor: 1.2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 50.0,
                // read about it in the PieChartData section
                sections: [
                  if (homeController.getTotalExpenses(monthsCardModel) <=
                      homeController.getBudget(monthsCardModel))
                    PieChartSectionData(
                      value: double.parse(
                          homeController.getRemainingPercent(monthsCardModel)),
                      showTitle: false,
                      color: kPrimaryColor,
                      //title: remainingPercent + '%',
                      badgeWidget: Text(
                        homeController.getRemainingPercent(monthsCardModel) +
                            '%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      badgePositionPercentageOffset: homeController
                              .getRemainingPercent(monthsCardModel)
                              .contains('100')
                          ? 1.8
                          : 1.5,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  if (homeController.getTotalExpenses(monthsCardModel) > 0.0)
                    PieChartSectionData(
                      value: double.parse(
                          homeController.getExpensePercent(monthsCardModel)),
                      showTitle: false,
                      //title: expensePercent + '%',
                      color: kSecondaryColor,
                      badgeWidget: Text(
                        homeController.getExpensePercent(monthsCardModel) + '%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      badgePositionPercentageOffset: homeController
                              .getExpensePercent(monthsCardModel)
                              .contains('100')
                          ? 1.8
                          : 1.5,
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
          const SizedBox(
            height: 10.0,
          ),
          Row(
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
          const SizedBox(
            height: 10.0,
          ),
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
        ],
      ),
    );
  }
}
