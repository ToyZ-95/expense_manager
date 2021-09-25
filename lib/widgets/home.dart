import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/widgets/month_expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: GetMonthsCard()
                  .map(
                    (e) => HomeExpenseCard(
                      monthsCardModel: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 60.0,
        ),
        Column(
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFF1441F1),
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
                color: Color(0xFF1441F1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
