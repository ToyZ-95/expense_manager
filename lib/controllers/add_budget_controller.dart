import 'package:get/get.dart';

class AddBudgetController extends GetxController {
  DateTime selectedMonthYear = DateTime.now();

  selectedMonthYearChanged(DateTime changedMonthYear) {
    selectedMonthYear = changedMonthYear;
    //update();
  }
}
