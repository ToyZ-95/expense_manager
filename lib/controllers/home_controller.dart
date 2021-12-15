import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/services/database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Using rx list to get access refresh() when any changes occurs in list
  //e.g. adding expense to list
  RxList<BudgetModel> budgetsModels = <BudgetModel>[].obs;
  RxMap<int, List<ExpenseModel>> expensesMap = <int, List<ExpenseModel>>{}.obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    super.onInit();
  }

  Future<List<BudgetModel>> getAllBudgets() async {
    List<BudgetModel> budgets = await DBProvider.db.getAllBudgets();

    for (var element in budgets) {
      expensesMap[element.id!] =
          await DBProvider.db.getExpensesFromMonthId(element.id!);
    }

    return budgets;
  }

  List<ExpenseModel>? getExpensesUsingMonthID(int monthId) =>
      expensesMap.containsKey(monthId) ? expensesMap[monthId]! : null;

  void addBudgetModel(BudgetModel budgetModel) async {
    budgetModel.id = await DBProvider.db.insertBudget(budgetModel);
    budgetsModels.add(budgetModel);
    ex
  }

  void removeMonthsCard(BudgetModel monthsCardModel) =>
      budgetsModels.remove(monthsCardModel);

  void addExpense(ExpenseModel expenseModel) {
    int monthId =
        expensesMap.keys.firstWhere((id) => id == expenseModel.monthId);

    expensesMap[monthId]!.add(expenseModel);

    DBProvider.db.insertExpense(expenseModel);

    expensesMap.refresh();

    // BudgetModel budgetModel = budgetsModels
    //     .firstWhere((element) => element.id == expenseModel.monthId);

    // if (budgetModel.expenses != null) {
    //   budgetModel.expenses!.add(expenseModel);
    // } else {
    //   budgetModel.expenses = [expenseModel];
    // }

    //budgetsModels.refresh();
  }

  BudgetModel getMonthModel(int id) =>
      budgetsModels.firstWhere((element) => element.id == id);

  double getTotalExpenses(int monthId) {
    double totalExpensesOfMonth = 0;

    List<ExpenseModel>? monthExpenses = getExpensesUsingMonthID(monthId);
    if (monthExpenses != null) {
      for (ExpenseModel item in monthExpenses) {
        totalExpensesOfMonth += item.amount!;
      }
    }
    return totalExpensesOfMonth;
    // double expensesNum = 0;
    // if (monthsCardModel.expenses != null) {
    //   for (ExpenseModel item in monthsCardModel.expenses!) {
    //     expensesNum += item.amount!;
    //   }
    // }

    // return expensesNum;
  }

  double getBudget(BudgetModel budgetModel) => budgetModel.budget!;

  double getRemainingBudget(BudgetModel budgetModel) {
    double budgetOfMonth = getBudget(budgetModel);
    double totalExpensesOfMonth = getTotalExpenses(budgetModel.id!);

    return budgetOfMonth - totalExpensesOfMonth;
  }

  String getExpensePercent(BudgetModel budgetModel) {
    double totalExpensesOfMonth = getTotalExpenses(budgetModel.id!) * 100;
    return (totalExpensesOfMonth / getBudget(budgetModel)).toStringAsFixed(2);
  }

  String getRemainingPercent(BudgetModel monthsCardModel) {
    double remainingBudget = getRemainingBudget(monthsCardModel) * 100;
    return (remainingBudget / getBudget(monthsCardModel)).toStringAsFixed(2);
  }

  double getHighestExpenseInMonth(BudgetModel budgetModel) {
    //Take expense list from model
    // List<ExpenseModel> expenses = monthsCardModel.expenses!;
    double highestExpense = 0;
    double totalExpenseInADay = 0;

    List<ExpenseModel>? expenses = getExpensesUsingMonthID(budgetModel.id!);

    if (expenses != null) {
      //sort expense list as per day
      expenses.sort((a, b) => DateTime.parse(a.timeStamp!)
          .day
          .compareTo(DateTime.parse(b.timeStamp!).day));

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
    }
    return highestExpense;
  }

  double getPerDayExpenses(BudgetModel budgetModel, int day) {
    double amount = 0;

    List<ExpenseModel>? expenses = getExpensesUsingMonthID(budgetModel.id!);

    if (expenses != null) {
      expenses = expenses
          .where((element) => DateTime.parse(element.timeStamp!).day == day)
          .toList();

      for (var i = 0; i < expenses.length; i++) {
        amount += expenses[i].amount!;
      }
    }

    return amount;
  }

  int getLatestExpenseDay(BudgetModel budgetModel) {
    int day = 0;

    //Take expense list from model
    List<ExpenseModel>? expenses = getExpensesUsingMonthID(budgetModel.id!);

    if (expenses != null) {
      //sort expense list as per day
      expenses.sort((a, b) => DateTime.parse(a.timeStamp!)
          .day
          .compareTo(DateTime.parse(b.timeStamp!).day));

      day = DateTime.parse(expenses.last.timeStamp!).day;
    }
    return day;
  }

  // void getDummyData() {
  //   List<BudgetModel> list = [];

  //   list.add(
  //     BudgetModel(
  //       monthName: 'September',
  //       year: '2019',
  //       budget: 60000,
  //       expenses: <ExpenseModel>[
  //         ExpenseModel(
  //             amount: 5000,
  //             category: ExpenseCategory.clothes,
  //             expenseName: 'Clothes',
  //             timeStamp: DateTime.parse('2019-09-05').toString()),
  //         ExpenseModel(
  //             amount: 1000,
  //             category: ExpenseCategory.bills,
  //             expenseName: 'Bills',
  //             timeStamp: DateTime.parse('2019-09-01').toString()),
  //         ExpenseModel(
  //             amount: 2000,
  //             category: ExpenseCategory.fun,
  //             expenseName: 'Fun',
  //             timeStamp: DateTime.parse('2019-09-05').toString()),
  //         ExpenseModel(
  //             amount: 5000,
  //             category: ExpenseCategory.clothes,
  //             expenseName: 'Clothes',
  //             timeStamp: DateTime.parse('2019-09-01').toString()),
  //         ExpenseModel(
  //             amount: 6000,
  //             category: ExpenseCategory.fun,
  //             expenseName: 'Fun',
  //             timeStamp: DateTime.parse('2019-09-02').toString()),
  //         ExpenseModel(
  //             amount: 2000,
  //             category: ExpenseCategory.other,
  //             expenseName: 'Other',
  //             timeStamp: DateTime.parse('2019-09-02').toString()),
  //         ExpenseModel(
  //             amount: 500,
  //             category: ExpenseCategory.transport,
  //             expenseName: 'Transport',
  //             timeStamp: DateTime.parse('2019-09-05').toString()),
  //         ExpenseModel(
  //             amount: 100,
  //             category: ExpenseCategory.food,
  //             expenseName: 'Food',
  //             timeStamp: DateTime.parse('2019-09-05').toString()),
  //         ExpenseModel(
  //             amount: 7000,
  //             category: ExpenseCategory.transport,
  //             expenseName: 'Transport',
  //             timeStamp: DateTime.parse('2019-09-08').toString()),
  //         ExpenseModel(
  //             amount: 5000,
  //             category: ExpenseCategory.other,
  //             expenseName: 'Other',
  //             timeStamp: DateTime.parse('2019-09-08').toString()),
  //         ExpenseModel(
  //             amount: 3000,
  //             category: ExpenseCategory.fun,
  //             expenseName: 'Fun',
  //             timeStamp: DateTime.parse('2019-09-10').toString()),
  //         ExpenseModel(
  //             amount: 2000,
  //             category: ExpenseCategory.food,
  //             expenseName: 'Food',
  //             timeStamp: DateTime.parse('2019-09-13').toString()),
  //         ExpenseModel(
  //             amount: 1000,
  //             category: ExpenseCategory.fun,
  //             expenseName: 'Fun',
  //             timeStamp: DateTime.parse('2019-09-19').toString()),
  //         ExpenseModel(
  //             amount: 9000,
  //             category: ExpenseCategory.bills,
  //             expenseName: 'Bills',
  //             timeStamp: DateTime.parse('2019-09-13').toString()),
  //         ExpenseModel(
  //             amount: 4000,
  //             category: ExpenseCategory.other,
  //             expenseName: 'Other',
  //             timeStamp: DateTime.parse('2019-09-13').toString()),
  //         ExpenseModel(
  //             amount: 3000,
  //             category: ExpenseCategory.food,
  //             expenseName: 'Food',
  //             timeStamp: DateTime.parse('2019-09-19').toString()),
  //         ExpenseModel(
  //             amount: 100,
  //             category: ExpenseCategory.transport,
  //             expenseName: 'Transport',
  //             timeStamp: DateTime.parse('2019-09-22').toString()),
  //         ExpenseModel(
  //             amount: 500,
  //             category: ExpenseCategory.food,
  //             expenseName: 'Food',
  //             timeStamp: DateTime.parse('2019-09-22').toString()),
  //         // ExpenseModel(
  //         //     amount: 1000,
  //         //     category: ExpenseCategory.other,
  //         //     expenseName: 'Other',
  //         //     timeStamp: DateTime.parse('2019-09-29').toString()),
  //         // ExpenseModel(
  //         //     amount: 1000,
  //         //     category: ExpenseCategory.bills,
  //         //     expenseName: 'Bills',
  //         //     timeStamp: DateTime.parse('2019-09-30').toString()),
  //       ],
  //     ),
  //   );

  //   monthsCards.value = list;
  // }
}
