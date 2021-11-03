import 'package:expense_manager/controllers/add_expense_controller.dart';
import 'package:expense_manager/enums/global_enums.dart';
import 'package:expense_manager/widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectableTileGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddExpenseController addExpenseController = Get.find();
    return GetBuilder<AddExpenseController>(
      builder: (value) {
        return Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    addExpenseController
                        .expenseCategoryChanged(ExpenseCategory.bills);
                    //changeSelectedCategory(ExpenseCategory.bills);
                  },
                  child: CategoryTile(
                    expenseCategory:
                        addExpenseController.category == ExpenseCategory.bills
                            ? ExpenseCategory.bills
                            : ExpenseCategory.billsSecondary,
                    selected:
                        addExpenseController.category == ExpenseCategory.bills
                            ? true
                            : false,
                    label: 'Bills',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    addExpenseController
                        .expenseCategoryChanged(ExpenseCategory.food);
                  },
                  child: CategoryTile(
                    expenseCategory:
                        addExpenseController.category == ExpenseCategory.food
                            ? ExpenseCategory.food
                            : ExpenseCategory.foodSecondary,
                    selected:
                        addExpenseController.category == ExpenseCategory.food
                            ? true
                            : false,
                    label: 'Food',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    addExpenseController
                        .expenseCategoryChanged(ExpenseCategory.clothes);
                  },
                  child: CategoryTile(
                    expenseCategory:
                        addExpenseController.category == ExpenseCategory.clothes
                            ? ExpenseCategory.clothes
                            : ExpenseCategory.clothesSecondary,
                    selected:
                        addExpenseController.category == ExpenseCategory.clothes
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
                    addExpenseController
                        .expenseCategoryChanged(ExpenseCategory.transport);
                  },
                  child: CategoryTile(
                    expenseCategory: addExpenseController.category ==
                            ExpenseCategory.transport
                        ? ExpenseCategory.transport
                        : ExpenseCategory.transportSecondary,
                    selected: addExpenseController.category ==
                            ExpenseCategory.transport
                        ? true
                        : false,
                    label: 'Transport',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    addExpenseController
                        .expenseCategoryChanged(ExpenseCategory.fun);
                  },
                  child: CategoryTile(
                    expenseCategory:
                        addExpenseController.category == ExpenseCategory.fun
                            ? ExpenseCategory.fun
                            : ExpenseCategory.funSecondary,
                    selected:
                        addExpenseController.category == ExpenseCategory.fun
                            ? true
                            : false,
                    label: 'Fun',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    addExpenseController
                        .expenseCategoryChanged(ExpenseCategory.other);
                  },
                  child: CategoryTile(
                    expenseCategory:
                        addExpenseController.category == ExpenseCategory.other
                            ? ExpenseCategory.other
                            : ExpenseCategory.otherSecondary,
                    selected:
                        addExpenseController.category == ExpenseCategory.other
                            ? true
                            : false,
                    label: 'Other',
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
