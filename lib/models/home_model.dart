class MonthsCardModel {
  String? monthName;
  int? year;
  double? budget;
  double? expense;

  MonthsCardModel(
      {required this.monthName, this.budget, this.expense, this.year});
}

List<MonthsCardModel> _monthsCardModel = [
  MonthsCardModel(
      monthName: 'September', budget: 60000.0, expense: 40000.0, year: 2019),
  MonthsCardModel(
      monthName: 'October', budget: 60000.0, expense: 10000.0, year: 2019),
  MonthsCardModel(
      monthName: 'September', budget: 90000.0, expense: 15000.0, year: 2019),
  MonthsCardModel(
      monthName: 'September', budget: 100000.0, expense: 70000.0, year: 2019),
];

List<MonthsCardModel> GetMonthsCard() {
  return _monthsCardModel;
}
