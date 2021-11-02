import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/add_expense_controller.dart';
import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/widgets/selectable_tile_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddExpense extends StatelessWidget {
  HomeController homeController = Get.find();

  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  String guid;
  String month;

  final DateFormat formatter = DateFormat('EEEE, d MMMM');

  static ExpenseCategory? selectedCategory;

  AddExpense({required this.guid, required this.month});

  void addExpense() {
    Get.back();
    homeController.addExpense(
      guid,
      ExpenseModel(
          expenseName:
              selectedCategory.toString().split('.')[1].capitalizeFirst,
          amount: double.parse(amountController.text),
          timeStamp: DateTime.now().toString(),
          category: selectedCategory),
    );
    selectedCategory = null;
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  @override
  Widget build(BuildContext context) {
    String dateString =
        '${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day} ${month}';

    DateTime expenseDate = formatter.parse(dateString);

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
                      GetBuilder<AddExpenseController>(
                        init: AddExpenseController(month: month),
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
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (builder) {
                                return Material(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 50.0, left: 24.0, right: 24.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  month,
                                                  style: const TextStyle(
                                                    letterSpacing: 1.2,
                                                    fontSize: 26.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                                Text(
                                                  DateTime.now()
                                                      .year
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kSecondaryColor,
                                                      fontSize: 20.0),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: const Icon(
                                                Icons.close_rounded,
                                                size: 30.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 24.0, right: 24.0),
                                          child: SfDateRangePicker(
                                            monthCellStyle:
                                                DateRangePickerMonthCellStyle(),
                                            headerHeight: 0.0,
                                            selectionShape:
                                                DateRangePickerSelectionShape
                                                    .rectangle,
                                            monthViewSettings:
                                                const DateRangePickerMonthViewSettings(
                                              firstDayOfWeek: 1,
                                              viewHeaderStyle:
                                                  DateRangePickerViewHeaderStyle(
                                                textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // DateTime? picked = await showDatePicker(
                          //   context: context,
                          //   initialDate: DateTime(
                          //       DateTime.now().year, expenseDate.month, 1),
                          //   firstDate: DateTime(
                          //       DateTime.now().year, expenseDate.month, 1),
                          //   lastDate: DateTime(DateTime.now().year,
                          //       expenseDate.month, daysInMonth(DateTime.now())),
                          // );

                          // if (picked != null) {
                          //   AddExpenseController addExpenseController =
                          //       Get.find();
                          //   addExpenseController
                          //       .expenseDateStringChanged(picked);
                          // }
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
