import 'package:expense_manager/models/expense_model.dart';

class MonthsCardModel {
  String? monthName;
  int? year;
  double? budget;
  List<ExpenseModel>? expenses;

  MonthsCardModel({
    required this.monthName,
    this.budget,
    this.year,
    this.expenses,
  });
}

List<MonthsCardModel> _monthsCardModel = [
  MonthsCardModel(
    monthName: 'September',
    budget: 60000.0,
    year: 2019,
    expenses: <ExpenseModel>[
      ExpenseModel(expenseName: 'Video Game', amount: 100.0),
      ExpenseModel(expenseName: 'Food', amount: 150.0),
      ExpenseModel(expenseName: 'Entertainment', amount: 500.0),
      ExpenseModel(expenseName: 'Rent', amount: 900.0),
      ExpenseModel(expenseName: 'Clothes', amount: 1000.0),
    ],
  ),
  MonthsCardModel(
    monthName: 'October',
    budget: 60000.0,
    year: 2019,
    expenses: <ExpenseModel>[
      ExpenseModel(expenseName: 'Food', amount: 463.0),
      ExpenseModel(expenseName: 'Entertainment', amount: 234.0),
      ExpenseModel(expenseName: 'Clothes', amount: 456.0),
      ExpenseModel(expenseName: 'Rent', amount: 745.0),
      ExpenseModel(expenseName: 'Video Game', amount: 234.0),
    ],
  ),
  MonthsCardModel(
    monthName: 'November',
    budget: 90000.0,
    year: 2019,
    expenses: <ExpenseModel>[
      ExpenseModel(expenseName: 'Video Game', amount: 345.0),
      ExpenseModel(expenseName: 'Entertainment', amount: 685.0),
      ExpenseModel(expenseName: 'Rent', amount: 234.0),
      ExpenseModel(expenseName: 'Clothes', amount: 3456.0),
      ExpenseModel(expenseName: 'Food', amount: 456.0),
    ],
  ),
  MonthsCardModel(
    monthName: 'December',
    budget: 100000.0,
    year: 2019,
    expenses: <ExpenseModel>[
      ExpenseModel(expenseName: 'Entertainment', amount: 678.0),
      ExpenseModel(expenseName: 'Video Game', amount: 5756.0),
      ExpenseModel(expenseName: 'Food', amount: 667.0),
      ExpenseModel(expenseName: 'Rent', amount: 453.0),
      ExpenseModel(expenseName: 'Clothes', amount: 956.0),
    ],
  ),
];

List<MonthsCardModel> GetMonthsCard() {
  return _monthsCardModel;
}
