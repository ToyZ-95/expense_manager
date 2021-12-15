class BudgetModel {
  int? id;
  String? monthName;
  String? year;
  double? budget;

  BudgetModel({
    this.id,
    required this.monthName,
    this.budget,
    this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "Month_Name": monthName,
      "Year": year,
      "Budget": budget,
    };
  }
}
