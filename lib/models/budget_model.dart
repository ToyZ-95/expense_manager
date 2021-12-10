import 'package:expense_manager/models/expense_model.dart';

class BudgetModel {
  int? id;
  String? monthName;
  String? year;
  double? budget;
  List<ExpenseModel>? expenses;

  BudgetModel({
    this.id,
    required this.monthName,
    this.budget,
    this.year,
    this.expenses,
  });

  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "Month_Name": monthName,
      "Year": year,
      "Budget": expenses,
    };
  }
}
