import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpenseController extends GetxController {
  String month;
  AddExpenseController({required this.month});

  String expenseDateString = '';
  DateTime? expenseDate;

  final DateFormat formatter = DateFormat('EEEE, d MMMM');

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    expenseDateString =
        '${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day} $month';
    super.onInit();
  }

  void expenseDateStringChanged(DateTime changedDate) {
    expenseDate = changedDate;
    expenseDateString = formatter.format(changedDate);
    update();
  }
}
