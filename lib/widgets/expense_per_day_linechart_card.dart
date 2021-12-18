import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensePerDayLineChartCard extends StatelessWidget {
  BudgetModel monthsCardModel;

  ExpensePerDayLineChartCard({required this.monthsCardModel});

  HomeController homeController = Get.find();

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
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          const Text(
            'Expenses / Day',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width * 2.5,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10.0, top: 10),
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      handleBuiltInTouches: true,
                      touchTooltipData: LineTouchTooltipData(
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        tooltipBgColor: Colors.white70,
                        tooltipRoundedRadius: 10.0,
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      drawHorizontalLine: false,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Colors.black12,
                          strokeWidth: 0.7,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 10,
                        interval: 1,
                        getTextStyles: (context, value) => const TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        getTitles: (value) {
                          return value.toString().split('.')[0];
                        },
                        margin: 20,
                      ),
                      leftTitles: SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border.symmetric(
                        vertical: BorderSide(color: Colors.black12, width: 0.7),
                      ),
                    ),
                    minX: 1,
                    maxX: 31,
                    minY: 0,
                    maxY: homeController
                        .getHighestExpenseInMonth(monthsCardModel),
                    lineBarsData: [
                      LineChartBarData(
                        spots: getFlSpots(31),
                        isCurved: false,
                        colors: <Color>[kPrimaryColor, kPrimaryColor],
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [kSecondaryColor, kPrimaryColor]
                              .map(
                                (color) => color.withOpacity(0.3),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> getFlSpots(int limit) {
    List<FlSpot> list = [];

    for (var i = 1; i <= limit; i++) {
      list.add(
        FlSpot(
          i.toDouble(),
          homeController.getPerDayExpenses(monthsCardModel, i),
        ),
      );
    }

    return list;
  }
}
