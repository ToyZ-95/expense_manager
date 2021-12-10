import 'package:expense_manager/enums/global_enums.dart';

class ExpenseModel {
  int? monthId;
  String? expenseName;
  double? amount;
  String? note;
  String? timeStamp;
  ExpenseCategory? category;

  ExpenseModel(
      {required this.monthId,
      required this.expenseName,
      required this.amount,
      this.note,
      required this.timeStamp,
      required this.category});
}
