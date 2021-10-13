import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:uuid/uuid.dart';

class MonthsCardModel {
  String? guid;
  String? monthName;
  String? year;
  double? budget;
  List<ExpenseModel>? expenses;

  MonthsCardModel({
    required this.monthName,
    this.budget,
    this.year,
    this.expenses,
  }) {
    guid = const Uuid().v4();
  }
}

// List<MonthsCardModel> _monthsCardModel = [];

// List<MonthsCardModel> GetMonthsCard() {
//   return _monthsCardModel;
// }
