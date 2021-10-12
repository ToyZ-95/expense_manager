import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stats extends StatelessWidget {
  String? guid;

  StatsController statsController = Get.put(StatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: [
            Row(
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
            const SizedBox(
              height: 40.0,
            ),
            Container(
              decoration: const BoxDecoration(
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
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      statsController.selectTab(1);
                    },
                    child: Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width / 2 -
                            20, //20 is left right padding to subtracting it
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: statsController.selectedTab.value == 1
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
                                color: statsController.selectedTab.value == 1
                                    ? Colors.white
                                    : kSecondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      statsController.selectTab(2);
                    },
                    child: Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width / 2 -
                            20, //20 is left right padding to subtracting it
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: statsController.selectedTab.value == 1
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
                              color: statsController.selectedTab.value == 1
                                  ? kSecondaryColor
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'September',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '2019',
                      style: TextStyle(
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Text('abcd');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
