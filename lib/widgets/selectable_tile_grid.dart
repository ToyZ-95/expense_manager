import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/screens/add_expense_screen.dart';
import 'package:expense_manager/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class SelectableTileGrid extends StatefulWidget {
  @override
  State<SelectableTileGrid> createState() => _SelectableTileGridState();
}

class _SelectableTileGridState extends State<SelectableTileGrid> {
  void changeSelectedCategory(ExpenseCategory expenseCategory) {
    AddExpense.selectedCategory = expenseCategory;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.bills);
              },
              child: CategoryTile(
                expenseCategory:
                    AddExpense.selectedCategory == ExpenseCategory.bills
                        ? ExpenseCategory.bills
                        : ExpenseCategory.billsSecondary,
                selected: AddExpense.selectedCategory == ExpenseCategory.bills
                    ? true
                    : false,
                label: 'Bills',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.food);
              },
              child: CategoryTile(
                expenseCategory:
                    AddExpense.selectedCategory == ExpenseCategory.food
                        ? ExpenseCategory.food
                        : ExpenseCategory.foodSecondary,
                selected: AddExpense.selectedCategory == ExpenseCategory.food
                    ? true
                    : false,
                label: 'Food',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.clothes);
              },
              child: CategoryTile(
                expenseCategory:
                    AddExpense.selectedCategory == ExpenseCategory.clothes
                        ? ExpenseCategory.clothes
                        : ExpenseCategory.clothesSecondary,
                selected: AddExpense.selectedCategory == ExpenseCategory.clothes
                    ? true
                    : false,
                label: 'Clothes',
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.transport);
              },
              child: CategoryTile(
                expenseCategory:
                    AddExpense.selectedCategory == ExpenseCategory.transport
                        ? ExpenseCategory.transport
                        : ExpenseCategory.transportSecondary,
                selected:
                    AddExpense.selectedCategory == ExpenseCategory.transport
                        ? true
                        : false,
                label: 'Transport',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.fun);
              },
              child: CategoryTile(
                expenseCategory:
                    AddExpense.selectedCategory == ExpenseCategory.fun
                        ? ExpenseCategory.fun
                        : ExpenseCategory.funSecondary,
                selected: AddExpense.selectedCategory == ExpenseCategory.fun
                    ? true
                    : false,
                label: 'Fun',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.other);
              },
              child: CategoryTile(
                expenseCategory:
                    AddExpense.selectedCategory == ExpenseCategory.other
                        ? ExpenseCategory.other
                        : ExpenseCategory.otherSecondary,
                selected: AddExpense.selectedCategory == ExpenseCategory.other
                    ? true
                    : false,
                label: 'Other',
              ),
            ),
          ],
        )
      ],
    );
  }
}
