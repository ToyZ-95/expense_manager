import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/add_budget_controller.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/widgets/budget_month_picker_dialog.dart';
import 'package:expense_manager/widgets/expense_date_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddBudget extends StatelessWidget {
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  HomeController homeController = Get.find();

  final DateFormat formatter = DateFormat('MMMM,y');

  void addBudget(String dateTime) {
    homeController.addMonthsCard(
      MonthsCardModel(
        monthName: dateTime.split(',')[0],
        year: dateTime.split(',')[1],
        budget: double.parse(amountController.text),
      ),
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    String dateTime = formatter.format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              padding:
                  const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0),
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const Text(
                    'Add Budget',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0),
              decoration: kAppBackgroundThemeBox,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    cursorColor: kPrimaryColor,
                    controller: amountController,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter',
                      suffixIcon: Icon(
                        Icons.attach_money_rounded,
                        color: kPrimaryColor,
                      ),
                      hintStyle: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      GetBuilder<AddBudgetController>(
                        init: AddBudgetController(),
                        builder: (value) => Text(
                          formatter.format(value.selectedMonthYear),
                          textScaleFactor: 1.2,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (builder) {
                              return BudgetMonthPickerDialog();
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.calendar_today_rounded,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'More Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: noteController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 8,
                    decoration: const InputDecoration(
                      hintText: 'Enter here...',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 18.0, right: 18.0, bottom: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        addBudget(dateTime);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        primary: kPrimaryColor,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
