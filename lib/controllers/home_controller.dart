import 'package:expense_manager/enums/global_enums.dart';
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

  double getHighestExpenseInMonth(MonthsCardModel monthsCardModel) {
    //Take expense list from model
    List<ExpenseModel> expenses = monthsCardModel.expenses!;

    //sort expense list as per day
    expenses.sort((a, b) => DateTime.parse(a.timeStamp!)
        .day
        .compareTo(DateTime.parse(b.timeStamp!).day));

    double highestExpense = 0;
    double totalExpenseInADay = 0;

    int day = 1;
    for (var i = 0; i < expenses.length; i++) {
      DateTime timeStamp = DateTime.parse(expenses[i].timeStamp!);

      if (day != timeStamp.day) {
        day = timeStamp.day;

        if (highestExpense < totalExpenseInADay) {
          highestExpense = totalExpenseInADay;
        }

        totalExpenseInADay = expenses[i].amount!;
      } else {
        totalExpenseInADay += expenses[i].amount!;
      }
    }
    if (highestExpense < totalExpenseInADay) {
      highestExpense = totalExpenseInADay;
    }
    return highestExpense;
  }

  double getPerDayExpenses(MonthsCardModel monthsCardModel, int day) {
    double amount = 0;

    List<ExpenseModel> expenses = monthsCardModel.expenses!
        .where((element) => DateTime.parse(element.timeStamp!).day == day)
        .toList();

    for (var i = 0; i < expenses.length; i++) {
      amount += expenses[i].amount!;
    }

    return amount;
  }

  int getLatestExpenseDay(MonthsCardModel monthsCardModel) {
    int day = 0;

    //Take expense list from model
    List<ExpenseModel> expenses = monthsCardModel.expenses!;

    //sort expense list as per day
    expenses.sort((a, b) => DateTime.parse(a.timeStamp!)
        .day
        .compareTo(DateTime.parse(b.timeStamp!).day));

    day = DateTime.parse(expenses.last.timeStamp!).day;

    return day;
  }

  void getDummyData() {
    List<MonthsCardModel> list = [];

    list.add(
      MonthsCardModel(
        monthName: 'September',
        year: '2019',
        budget: 60000,
        expenses: <ExpenseModel>[
          ExpenseModel(
              amount: 5000,
              category: ExpenseCategory.clothes,
              expenseName: 'Clothes',
              timeStamp: DateTime.parse('2019-09-05').toString()),
          ExpenseModel(
              amount: 1000,
              category: ExpenseCategory.bills,
              expenseName: 'Bills',
              timeStamp: DateTime.parse('2019-09-01').toString()),
          ExpenseModel(
              amount: 2000,
              category: ExpenseCategory.fun,
              expenseName: 'Fun',
              timeStamp: DateTime.parse('2019-09-05').toString()),
          ExpenseModel(
              amount: 5000,
              category: ExpenseCategory.clothes,
              expenseName: 'Clothes',
              timeStamp: DateTime.parse('2019-09-01').toString()),
          ExpenseModel(
              amount: 6000,
              category: ExpenseCategory.fun,
              expenseName: 'Fun',
              timeStamp: DateTime.parse('2019-09-02').toString()),
          ExpenseModel(
              amount: 2000,
              category: ExpenseCategory.other,
              expenseName: 'Other',
              timeStamp: DateTime.parse('2019-09-02').toString()),
          ExpenseModel(
              amount: 500,
              category: ExpenseCategory.transport,
              expenseName: 'Transport',
              timeStamp: DateTime.parse('2019-09-05').toString()),
          ExpenseModel(
              amount: 100,
              category: ExpenseCategory.food,
              expenseName: 'Food',
              timeStamp: DateTime.parse('2019-09-05').toString()),
          ExpenseModel(
              amount: 7000,
              category: ExpenseCategory.transport,
              expenseName: 'Transport',
              timeStamp: DateTime.parse('2019-09-08').toString()),
          ExpenseModel(
              amount: 5000,
              category: ExpenseCategory.other,
              expenseName: 'Other',
              timeStamp: DateTime.parse('2019-09-08').toString()),
          ExpenseModel(
              amount: 3000,
              category: ExpenseCategory.fun,
              expenseName: 'Fun',
              timeStamp: DateTime.parse('2019-09-10').toString()),
          ExpenseModel(
              amount: 2000,
              category: ExpenseCategory.food,
              expenseName: 'Food',
              timeStamp: DateTime.parse('2019-09-13').toString()),
          ExpenseModel(
              amount: 1000,
              category: ExpenseCategory.fun,
              expenseName: 'Fun',
              timeStamp: DateTime.parse('2019-09-19').toString()),
          ExpenseModel(
              amount: 9000,
              category: ExpenseCategory.bills,
              expenseName: 'Bills',
              timeStamp: DateTime.parse('2019-09-13').toString()),
          ExpenseModel(
              amount: 4000,
              category: ExpenseCategory.other,
              expenseName: 'Other',
              timeStamp: DateTime.parse('2019-09-13').toString()),
          ExpenseModel(
              amount: 3000,
              category: ExpenseCategory.food,
              expenseName: 'Food',
              timeStamp: DateTime.parse('2019-09-19').toString()),
          ExpenseModel(
              amount: 100,
              category: ExpenseCategory.transport,
              expenseName: 'Transport',
              timeStamp: DateTime.parse('2019-09-22').toString()),
          ExpenseModel(
              amount: 500,
              category: ExpenseCategory.food,
              expenseName: 'Food',
              timeStamp: DateTime.parse('2019-09-22').toString()),
          // ExpenseModel(
          //     amount: 1000,
          //     category: ExpenseCategory.other,
          //     expenseName: 'Other',
          //     timeStamp: DateTime.parse('2019-09-29').toString()),
          // ExpenseModel(
          //     amount: 1000,
          //     category: ExpenseCategory.bills,
          //     expenseName: 'Bills',
          //     timeStamp: DateTime.parse('2019-09-30').toString()),
        ],
      ),
    );

    monthsCards.value = list;
  }
}
