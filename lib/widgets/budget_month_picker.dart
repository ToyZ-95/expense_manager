import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/controllers/add_budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BudgetMonthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: (onSelectionChangedArgs) {
        AddBudgetController addBudgetController = Get.find();
        addBudgetController
            .selectedMonthYearChanged(onSelectionChangedArgs.value);
      },
      onViewChanged: (onViewChangedArgs) {
        AddBudgetController addBudgetController = Get.find();
        addBudgetController.selectedMonthYearChanged(
            onViewChangedArgs.visibleDateRange.startDate!);
      },
      view: DateRangePickerView.year,
      allowViewNavigation: false,
      navigationMode: DateRangePickerNavigationMode.snap,
      selectionColor: kPrimaryColor,
      selectionTextStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headerHeight: 0.0,
      selectionShape: DateRangePickerSelectionShape.circle,
      yearCellStyle: const DateRangePickerYearCellStyle(
        textStyle: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        todayTextStyle:
            TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        todayCellDecoration: BoxDecoration(),
      ),
    );
  }
}
