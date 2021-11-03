import 'package:expense_manager/enums/global_enums.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpenseController extends GetxController {
  String month;
  String year;

  AddExpenseController({required this.month, required this.year});

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

  void expenseCategoryChanged(ExpenseCategory selectedCategory) {
    category = selectedCategory;
    update();
  }

  void expenseNoteChanged(String changedNote) {
    extraNote = changedNote;
  }

  void expenseDateStringChanged(DateTime changedDate) {
    expenseDate = changedDate;
    expenseDateString = formatter.format(changedDate);
    update();
  }

  void amountChanged(String changedAmount) {
    if (changedAmount.isEmpty) return;
    amount = double.parse(changedAmount);
    amount ??= 0;
  }
}
