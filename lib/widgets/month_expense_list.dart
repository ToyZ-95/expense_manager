import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/home_model.dart';
import 'package:expense_manager/widgets/expense_date_card.dart';
import 'package:expense_manager/widgets/expense_details_card.dart';
import 'package:flutter/material.dart';

class MonthExpenseList extends StatelessWidget {
  MonthsCardModel? monthsCardModel;
  bool? onlyLast = false;

  MonthExpenseList({this.monthsCardModel, this.onlyLast});

  List<Widget> getWidgets(MonthsCardModel monthsCardModel, bool onlyLast) {
    List<Widget> list = [];

    if (onlyLast) {
      list.add(
        ExpenseDateCard(
          expenseModel: monthsCardModel.expenses!.last,
        ),
      );
      list.add(
        const SizedBox(
          height: 10.0,
        ),
      );
      list.add(ExpenseDetailsCard(
        expenseModel: monthsCardModel.expenses!.last,
      ));
    } else {
      String expenseTimeStamp = monthsCardModel.expenses![0].timeStamp!;
      list.add(ExpenseDateCard(expenseModel: monthsCardModel.expenses![0]));

      for (var i = 0; i < monthsCardModel.expenses!.length; i++) {
        if (expenseTimeStamp != monthsCardModel.expenses![i].timeStamp) {
          expenseTimeStamp = monthsCardModel.expenses![i].timeStamp!;
          list.add(ExpenseDateCard(expenseModel: monthsCardModel.expenses![i]));
        }
        list.add(
          const SizedBox(
            height: 10.0,
          ),
        );
        list.add(
            ExpenseDetailsCard(expenseModel: monthsCardModel.expenses![i]));
        list.add(
          const SizedBox(
            height: 10.0,
          ),
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
