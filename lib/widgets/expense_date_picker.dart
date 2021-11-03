import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/add_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ExpenseDatePicker extends StatelessWidget {
  String month;

  final DateFormat formatter = DateFormat('EEEE, d MMMM');

  ExpenseDatePicker({required this.month});

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  @override
  Widget build(BuildContext context) {
    String dateString =
        '${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day} $month';

    DateTime expenseDate = formatter.parse(dateString);

    return SfDateRangePicker(
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        AddExpenseController addExpenseController = Get.find();
        addExpenseController.expenseDateStringChanged(args.value);
      },
      minDate: DateTime(DateTime.now().year, expenseDate.month, 1),
      maxDate: DateTime(
          DateTime.now().year, expenseDate.month, daysInMonth(DateTime.now())),
      selectionColor: kPrimaryColor,
      selectionTextStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      todayHighlightColor: Colors.transparent,
      monthCellStyle: const DateRangePickerMonthCellStyle(
        textStyle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        todayTextStyle:
            TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      ),
      headerHeight: 0.0,
      selectionShape: DateRangePickerSelectionShape.circle,
      monthViewSettings: const DateRangePickerMonthViewSettings(
        firstDayOfWeek: 1,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
