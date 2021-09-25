import 'package:expense_manager/models/home_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeExpenseCard extends StatelessWidget {
  MonthsCardModel monthsCardModel;

  HomeExpenseCard({required this.monthsCardModel});

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
      height: MediaQuery.of(context).size.height / 2 - 50.0,
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
            height: 20.0,
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 32.0,
                // read about it in the PieChartData section
                sections: [
                  PieChartSectionData(
                    value: monthsCardModel.expense!,
                    color: const Color(0xFF9ba5f8),
                  ),
                  PieChartSectionData(
                    value: monthsCardModel.budget!,
                    color: const Color(0xFF1441F1),
                    titleStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
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
              ElevatedButton(
                onPressed: () {},
                child: Text('Edit Budget'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
