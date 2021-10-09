import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class SelectableTileGrid extends StatefulWidget {
  @override
  State<SelectableTileGrid> createState() => _SelectableTileGridState();
}

class _SelectableTileGridState extends State<SelectableTileGrid> {
  ExpenseCategory? selectedCategory;

  void changeSelectedCategory(ExpenseCategory expenseCategory) {
    selectedCategory = expenseCategory;
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
                expenseCategory: selectedCategory == ExpenseCategory.bills
                    ? ExpenseCategory.bills
                    : ExpenseCategory.billsSecondary,
                selected:
                    selectedCategory == ExpenseCategory.bills ? true : false,
                label: 'Bills',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.food);
              },
              child: CategoryTile(
                expenseCategory: selectedCategory == ExpenseCategory.food
                    ? ExpenseCategory.food
                    : ExpenseCategory.foodSecondary,
                selected:
                    selectedCategory == ExpenseCategory.food ? true : false,
                label: 'Food',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.clothes);
              },
              child: CategoryTile(
                expenseCategory: selectedCategory == ExpenseCategory.clothes
                    ? ExpenseCategory.clothes
                    : ExpenseCategory.clothesSecondary,
                selected:
                    selectedCategory == ExpenseCategory.clothes ? true : false,
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
                expenseCategory: selectedCategory == ExpenseCategory.transport
                    ? ExpenseCategory.transport
                    : ExpenseCategory.transportSecondary,
                selected: selectedCategory == ExpenseCategory.transport
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
                expenseCategory: selectedCategory == ExpenseCategory.fun
                    ? ExpenseCategory.fun
                    : ExpenseCategory.funSecondary,
                selected:
                    selectedCategory == ExpenseCategory.fun ? true : false,
                label: 'Fun',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                changeSelectedCategory(ExpenseCategory.other);
              },
              child: CategoryTile(
                expenseCategory: selectedCategory == ExpenseCategory.other
                    ? ExpenseCategory.other
                    : ExpenseCategory.otherSecondary,
                selected:
                    selectedCategory == ExpenseCategory.other ? true : false,
                label: 'Other',
              ),
            ),
          ],
        )
      ],
    );
  }
}
