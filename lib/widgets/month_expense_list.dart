import 'package:expense_manager/controllers/home_controller.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/widgets/expense_date_card.dart';
import 'package:expense_manager/widgets/expense_details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonthExpenseList extends StatelessWidget {
  BudgetModel budgetModel;
  bool? onlyLast = false;

  HomeController homeController = Get.find();

  MonthExpenseList({required this.budgetModel, this.onlyLast});

  List<Widget> getWidgets(BudgetModel monthsCardModel, bool onlyLast) {
//Take expense list from model
    List<ExpenseModel>? expenses =
        homeController.getExpensesUsingMonthID(budgetModel.id!);

    //sort expense list as per day
    expenses!.sort((a, b) => DateTime.parse(a.timeStamp!)
        .day
        .compareTo(DateTime.parse(b.timeStamp!).day));

    List<Widget> list = [];

    if (onlyLast) {
      list.add(
        ExpenseDateCard(
          expenseModel: expenses.last,
        ),
      );
      list.add(
        const SizedBox(
          height: 10.0,
        ),
      );
      list.add(ExpenseDetailsCard(
        expenseModel: expenses.last,
      ));
    } else {
      int firstDay = DateTime.parse(expenses[0].timeStamp!).day;

      list.add(ExpenseDateCard(expenseModel: expenses[0]));

      for (var i = 0; i < expenses.length; i++) {
        int secondDay = DateTime.parse(expenses[i].timeStamp!).day;

        if (firstDay != secondDay) {
          firstDay = secondDay;
          list.add(
            const SizedBox(
              height: 10.0,
            ),
          );
          list.add(
            ExpenseDateCard(expenseModel: expenses[i]),
          );
        }

        list.add(
          const SizedBox(
            height: 10.0,
          ),
        );
        list.add(
          ExpenseDetailsCard(expenseModel: expenses[i]),
        );
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getWidgets(budgetModel!, onlyLast!),
    );
  }
}
