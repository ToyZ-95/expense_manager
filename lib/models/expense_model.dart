import 'package:expense_manager/enums/global_enums.dart';

class ExpenseModel {
  int? monthId;
  int? expenseId;
  String? expenseName;
  double? amount;
  String? note;
  String? timeStamp;
  ExpenseCategory? category;

  ExpenseModel(
      {required this.monthId,
      this.expenseId,
      required this.expenseName,
      required this.amount,
      this.note,
      required this.timeStamp,
      required this.category});
}
