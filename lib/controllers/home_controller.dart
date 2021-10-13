import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Using rx list to get access refresh() when any changes occurs in list
  //e.g. adding expense to list
  RxList<MonthsCardModel> monthsCards = <MonthsCardModel>[].obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    super.onInit();
  }

  void addMonthsCard(MonthsCardModel monthsCardModel) =>
      monthsCards.add(monthsCardModel);

  void removeMonthsCard(MonthsCardModel monthsCardModel) =>
      monthsCards.remove(monthsCardModel);

  void addExpense(String guid, ExpenseModel expenseModel) {
    MonthsCardModel monthCardModel =
        monthsCards.firstWhere((element) => element.guid == guid);
    if (monthCardModel.expenses != null) {
      monthCardModel.expenses!.add(expenseModel);
    } else {
      monthCardModel.expenses = [expenseModel];
    }
    monthsCards.refresh();
  }

  MonthsCardModel getMonthModel(String guid) =>
      monthsCards.firstWhere((element) => element.guid == guid);

  double getTotalExpenses(MonthsCardModel monthsCardModel) {
    double expensesNum = 0;
    if (monthsCardModel.expenses != null) {
      for (ExpenseModel item in monthsCardModel.expenses!) {
        expensesNum += item.amount!;
      }
    }

    return expensesNum;
  }

  double getBudget(MonthsCardModel monthsCardModel) => monthsCardModel.budget!;

  double getRemainingBudget(MonthsCardModel monthsCardModel) =>
      getBudget(monthsCardModel) - getTotalExpenses(monthsCardModel);

  String getExpensePercent(MonthsCardModel monthsCardModel) =>
      (getTotalExpenses(monthsCardModel) * 100 / getBudget(monthsCardModel))
          .toStringAsFixed(2);

  String getRemainingPercent(MonthsCardModel monthsCardModel) =>
      ((getRemainingBudget(monthsCardModel) * 100) / getBudget(monthsCardModel))
          .toStringAsFixed(2);
}
