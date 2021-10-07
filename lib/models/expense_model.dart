class ExpenseModel {
  String? expenseName;
  double? amount;
  String? note;
  String? timeStamp;

  ExpenseModel(
      {required this.expenseName,
      required this.amount,
      this.note,
      required this.timeStamp});
}
