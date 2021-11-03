import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/add_expense_controller.dart';
import 'package:expense_manager/utilities/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ExpenseDatePicker extends StatelessWidget {
  String month;
  String year;

  final DateFormat formatter = DateFormat('EEEE, d MMMM');

  ExpenseDatePicker({required this.month, required this.year});

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
      minDate: DateTime(int.parse(year), expenseDate.month, 1),
      maxDate: DateTime(
          int.parse(year),
          expenseDate.month,
          HelperClass.daysInMonth(
            DateTime(int.parse(year), expenseDate.month, 1),
          )),
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
