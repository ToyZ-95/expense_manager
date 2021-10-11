import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Using rx list to get access refresh() when any changes occurs in list
  //e.g. adding expense to list
  RxList<MonthsCardModel> monthsCards = GetMonthsCard().obs;

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
}
