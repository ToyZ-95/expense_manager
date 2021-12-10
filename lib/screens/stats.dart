import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/controllers/stats_controller.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/widgets/expense_per_day_linechart_card.dart';
import 'package:expense_manager/widgets/month_expense_list.dart';
import 'package:expense_manager/widgets/remaining_expense_pie_chart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stats extends StatelessWidget {
  //String? guid;

  List<Color> gradientColors = [
    kPrimaryColor,
    kSecondaryColor,
  ];

  MonthsCardModel monthsCardModel;
  StatsController? statsController;
  int? selectedTab;

  HomeController homeController = Get.find();

  Stats({required this.monthsCardModel, this.selectedTab}) {
    statsController = Get.put(StatsController());
    statsController!.selectTab(selectedTab!);
  }

  List<Widget> getWidgets(BuildContext context) {
    List<Widget> list = [];
    list.add(
      Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Row(
          children: [
            const Text(
              'Stats',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                  letterSpacing: 1.2),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                libraSecondaryIconPath,
                height: 24.0,
              ),
            ),
            const SizedBox(
              width: 30.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                calendarSecondaryIconPath,
                height: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
    list.add(
      const SizedBox(
        height: 40.0,
      ),
    );
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              statsController!.selectTab(1);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2 -
                  20, //20 is left right padding to subtracting it
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: statsController!.selectedTab.value == 1
                    ? kPrimaryColor
                    : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'General',
                  style: TextStyle(
                      color: statsController!.selectedTab.value == 1
                          ? Colors.white
                          : kSecondaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              statsController!.selectTab(2);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2 -
                  20, //20 is left right padding to subtracting it
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: statsController!.selectedTab.value == 1
                    ? Colors.white
                    : kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Expense Log',
                  style: TextStyle(
                    color: statsController!.selectedTab.value == 1
                        ? kSecondaryColor
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    list.add(
      const SizedBox(
        height: 10.00,
      ),
    );

    if (statsController!.selectedTab.value == 1) {
      list.add(
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    RemainingExpensePieChartCard(
                      monthsCardModel: monthsCardModel,
                      editable: false,
                    ),
                    ExpensePerDayLineChartCard(
                      monthsCardModel: monthsCardModel,
                    ),
                  ],
                );
              }),
        ),
      );
      // list.add(
      //   RemainingExpensePieChartCard(
      //     monthsCardModel: monthsCardModel,
      //   ),
      // );
      // list.add(
      //   ExpensePerDayLineChartCard(
      //     monthsCardModel: monthsCardModel,
      //   ),
      // );
    } else if (statsController!.selectedTab.value == 2) {
      list.add(
        const SizedBox(
          height: 30.0,
        ),
      );
      list.add(
        Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthsCardModel.monthName!,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    monthsCardModel.year!,
                    style: const TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: const Text(
                    'Filters',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      list.add(
        const SizedBox(
          height: 20,
        ),
      );
      list.add(
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return MonthExpenseList(
                  monthsCardModel: monthsCardModel,
                  onlyLast: false,
                );
              }),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: getWidgets(context),
        ),
      ),
    );
  }
}
