import 'package:expense_manager/models/expense_model.dart';

class MonthsCardModel {
  String? monthName;
  String? year;
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
    budget: 6000.0,
    year: '2019',
    expenses: <ExpenseModel>[
      ExpenseModel(
          expenseName: 'Video Game',
          amount: 2000.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Food',
          amount: 1000.0,
          timeStamp:
              DateTime.now().subtract(const Duration(days: 1)).toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Entertainment',
          amount: 500.0,
          timeStamp:
              DateTime.now().subtract(const Duration(days: 2)).toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Rent',
          amount: 900.0,
          timeStamp:
              DateTime.now().subtract(const Duration(days: 2)).toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Clothes',
          amount: 1000.0,
          timeStamp:
              DateTime.now().subtract(const Duration(days: 3)).toString(),
          category: 1),
    ],
  ),
  MonthsCardModel(
    monthName: 'October',
    budget: 60000.0,
    year: '2019',
    expenses: <ExpenseModel>[
      ExpenseModel(
          expenseName: 'Food',
          amount: 463.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Entertainment',
          amount: 234.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Clothes',
          amount: 456.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Rent',
          amount: 745.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Video Game',
          amount: 234.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
    ],
  ),
  MonthsCardModel(
    monthName: 'November',
    budget: 90000.0,
    year: '2019',
    expenses: <ExpenseModel>[
      ExpenseModel(
          expenseName: 'Video Game',
          amount: 345.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Entertainment',
          amount: 685.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Rent',
          amount: 234.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Clothes',
          amount: 3456.0,
          timeStamp: DateTime.now().toString(),
          category: 2),
      ExpenseModel(
          expenseName: 'Food',
          amount: 456.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
    ],
  ),
  MonthsCardModel(
    monthName: 'December',
    budget: 100000.0,
    year: '2019',
    expenses: <ExpenseModel>[
      ExpenseModel(
          expenseName: 'Entertainment',
          amount: 678.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Video Game',
          amount: 5756.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Food',
          amount: 667.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Rent',
          amount: 453.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
      ExpenseModel(
          expenseName: 'Clothes',
          amount: 956.0,
          timeStamp: DateTime.now().toString(),
          category: 1),
    ],
  ),
];

List<MonthsCardModel> GetMonthsCard() {
  return _monthsCardModel;
}
