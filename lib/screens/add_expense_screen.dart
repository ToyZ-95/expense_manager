import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/add_expense_controller.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/widgets/expense_date_picker_dialog.dart';
import 'package:expense_manager/widgets/selectable_tile_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatelessWidget {
  HomeController homeController = Get.find();

  String guid;
  String month;
  String year;

  final DateFormat formatter = DateFormat('EEEE, d MMMM');

  AddExpense({required this.guid, required this.month, required this.year});

  void addExpense() {
    Get.back();
    AddExpenseController addExpenseController = Get.find();
    homeController.addExpense(
      guid,
      ExpenseModel(
          expenseName: addExpenseController.category
              .toString()
              .split('.')[1]
              .capitalizeFirst,
          amount: addExpenseController.amount,
          timeStamp: addExpenseController.expenseDate.toString(),
          category: addExpenseController.category),
    );
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(
        //     parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Add Expense',
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      AddExpenseController addExpenseController = Get.find();
                      addExpenseController.amountChanged(value);
                    },
                    cursorColor: kPrimaryColor,
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
                      GetBuilder<AddExpenseController>(
                        init: AddExpenseController(month: month, year: year),
                        builder: (value) => Text(
                          value.expenseDateString,
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
                                return ExpenseDatePickerDialog(
                                  month: month,
                                  year: year,
                                );
                              });
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
            const SizedBox(
              height: 24.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Select Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SelectableTileGrid(),
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'More Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      AddExpenseController addExpenseController = Get.find();
                      addExpenseController.expenseNoteChanged(value);
                    },
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
                        addExpense();
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
