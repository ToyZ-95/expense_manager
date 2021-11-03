import 'package:expense_manager/enums/global_enums.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpenseController extends GetxController {
  String month;
  AddExpenseController({required this.month});

  String expenseDateString = '';

  String? expenseName;
  double? amount;
  ExpenseCategory? category;
  DateTime? expenseDate;
  String? extraNote;

  final DateFormat formatter = DateFormat('EEEE, d MMMM');

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    expenseDateString =
        '${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day} $month';
    super.onInit();
  }

  void expenseNameChanged(String changedAmount) {
    amount = double.parse(changedAmount);
    update();
  }

  void expenseCategoryChanged(String changedAmount) {
    amount = double.parse(changedAmount);
    update();
  }

  void expenseNoteChanged(String changedAmount) {
    amount = double.parse(changedAmount);
    update();
  }

  void expenseDateStringChanged(DateTime changedDate) {
    expenseDate = changedDate;
    expenseDateString = formatter.format(changedDate);
    update();
  }

  void amountChanged(String changedAmount) {
    amount = double.parse(changedAmount);
    update();
  }
}
