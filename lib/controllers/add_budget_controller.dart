import 'package:get/get.dart';

class AddBudgetController extends GetxController {
  DateTime selectedMonthYear = DateTime.now();
  double budgetAmount = 0;
  String extraNote = '';

  selectedMonthYearChanged(DateTime changedMonthYear) {
    selectedMonthYear = changedMonthYear;
    Future.delayed(Duration.zero, () => update());
  }

  budgetAmountChanged(String changedBudget) {
    if (changedBudget.isEmpty) return;
    budgetAmount = double.parse(changedBudget);
    budgetAmount;
  }

  extraNoteChanged(String changedNote) {
    if (changedNote.isEmpty) return;
    extraNote = changedNote;
  }
}
