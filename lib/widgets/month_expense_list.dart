import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/widgets/expense_date_card.dart';
import 'package:expense_manager/widgets/expense_details_card.dart';
import 'package:flutter/material.dart';

class MonthExpenseList extends StatelessWidget {
  MonthsCardModel? monthsCardModel;
  bool? onlyLast = false;

  MonthExpenseList({this.monthsCardModel, this.onlyLast});

  List<Widget> getWidgets(MonthsCardModel monthsCardModel, bool onlyLast) {
//Take expense list from model
    List<ExpenseModel> expenses = monthsCardModel.expenses!;

    //sort expense list as per day
    expenses.sort((a, b) => DateTime.parse(a.timeStamp!)
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
      children: getWidgets(monthsCardModel!, onlyLast!),
    );
  }
}
