import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/screens/add_budget.dart';
import 'package:expense_manager/widgets/month_expense_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 20.0, right: 20.0),
            child: Row(
              children: [
                Text(
                  'Hi, ' + FirebaseAuth.instance.currentUser!.displayName!,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AddBudget());
                  },
                  child: const Icon(
                    Icons.add,
                    color: kPrimaryColor,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => PageView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: homeController.monthsCards.length,
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemBuilder: (context, index) {
                  return HomeExpenseData(
                    monthsCardModel: homeController.monthsCards[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
