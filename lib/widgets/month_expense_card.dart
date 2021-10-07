import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/screens/add_expense_screen.dart';
import 'package:expense_manager/widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeExpenseCard extends StatelessWidget {
  MonthsCardModel monthsCardModel;

  HomeExpenseCard({required this.monthsCardModel});

  late String remainingPercent;
  late String expensePercent;

  @override
  Widget build(BuildContext context) {
    double remainingNum = 0.0;
    double expensesNum = 0.0;

    if (monthsCardModel.expenses != null) {
      for (ExpenseModel item in monthsCardModel.expenses!) {
        expensesNum += item.amount!;
      }
    }

    remainingNum = monthsCardModel.budget! - expensesNum;

    expensePercent =
        (expensesNum * 100 / monthsCardModel.budget!).toStringAsFixed(2);

    remainingPercent =
        ((remainingNum * 100) / monthsCardModel.budget!).toStringAsFixed(2);

    return Column(
      children: [
        Container(
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
              Expanded(
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 50.0,
                    // read about it in the PieChartData section
                    sections: [
                      PieChartSectionData(
                        value: double.parse(remainingPercent),
                        color: kPrimaryColor,
                        title: remainingPercent + '%',
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (expensesNum > 0.0)
                        PieChartSectionData(
                          value: double.parse(expensePercent),
                          title: expensePercent + '%',
                          color: kSecondaryColor,
                          titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
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
        ),
        const SizedBox(
          height: 60.0,
        ),
        FloatingActionButton(
          heroTag: monthsCardModel.monthName.toString() +
              monthsCardModel.year.toString(),
          onPressed: () {
            Get.to(() => AddExpense());
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
    );
  }
}
