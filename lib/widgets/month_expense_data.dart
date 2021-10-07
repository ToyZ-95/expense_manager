import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/screens/add_expense_screen.dart';
import 'package:expense_manager/widgets/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeExpenseData extends StatelessWidget {
  MonthsCardModel monthsCardModel;

  HomeExpenseData({required this.monthsCardModel});

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

    return monthsCardModel.expenses == null || monthsCardModel.expenses!.isEmpty
        ? Column(
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
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
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
                              showTitle: false,
                              color: kPrimaryColor,
                              //title: remainingPercent + '%',
                              badgeWidget: Text(
                                remainingPercent + '%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              badgePositionPercentageOffset: 1.7,
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            if (expensesNum > 0.0)
                              PieChartSectionData(
                                value: double.parse(expensePercent),
                                showTitle: false,
                                //title: expensePercent + '%',
                                color: kSecondaryColor,
                                badgeWidget: Text(
                                  expensePercent + '%',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                badgePositionPercentageOffset: 1.7,
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
          )
        : Column(
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
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height / 2 + 50.0,
                padding: const EdgeInsets.all(20.0),
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
                              showTitle: false,
                              color: kPrimaryColor,
                              //title: remainingPercent + '%',
                              badgeWidget: Text(
                                remainingPercent + '%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              badgePositionPercentageOffset: 1.7,
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            if (expensesNum > 0.0)
                              PieChartSectionData(
                                value: double.parse(expensePercent),
                                showTitle: false,
                                //title: expensePercent + '%',
                                color: kSecondaryColor,
                                badgeWidget: Text(
                                  expensePercent + '%',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                badgePositionPercentageOffset: 1.7,
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
              ),
              const SizedBox(
                height: 16.0,
              ),
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
                          onTap: () {},
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
                  Container(
                    height: 45.0,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      children: const [
                        Text(
                          '1st',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'Sunday',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.attach_money_rounded,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 45.0,
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
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
                              children: const [
                                Text(
                                  'Bills',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  '500',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
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
                ],
              ),
            ],
          );
  }
}
