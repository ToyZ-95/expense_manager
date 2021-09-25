import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeExpenseCard extends StatelessWidget {
  MonthsCardModel monthsCardModel;

  HomeExpenseCard({required this.monthsCardModel});

  late String remaining;
  late String expense;

  @override
  Widget build(BuildContext context) {
    remaining = (monthsCardModel.expense! * 100 / monthsCardModel.budget!)
        .toStringAsFixed(2);

    expense = (((monthsCardModel.budget! - monthsCardModel.expense!) * 100) /
            monthsCardModel.budget!)
        .toStringAsFixed(2);

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
              color: Color(0xFF1441F1),
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
              color: Color(0xFF9ba5f8),
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
                    value: double.parse(remaining),
                    color: const Color(0xFF1441F1),
                    title: remaining + '%',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PieChartSectionData(
                    value: double.parse(expense),
                    title: expense + '%',
                    color: const Color(0xFF9ba5f8),
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
                color: Color(0xFF1441F1),
                text: 'Remaining',
                isSquare: true,
              ),
              SizedBox(
                width: 8.0,
              ),
              Indicator(
                color: Color(0xFF9ba5f8),
                text: 'Expense',
                isSquare: true,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       monthsCardModel.expense.toString(),
          //       style: const TextStyle(
          //         color: Color(0xFF1441F1),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16.0,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 2.0,
          //     ),
          //     const Text(
          //       '/',
          //       style: TextStyle(
          //         color: Color(0xFF9ba5f8),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16.0,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 2.0,
          //     ),
          //     Text(
          //       monthsCardModel.budget.toString(),
          //       style: const TextStyle(
          //         color: Color(0xFF9ba5f8),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16.0,
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Edit Budget',
                  style: TextStyle(
                    color: Color(0xFF1441F1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFF9ba5f8),
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
