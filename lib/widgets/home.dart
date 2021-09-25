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
        const Text('Add Expenses'),
      ],
    );
  }
}
