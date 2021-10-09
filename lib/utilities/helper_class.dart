import 'package:expense_manager/constants/constants.dart';
import 'package:expense_manager/enums/global_enums.dart';

class HelperClass {
  static String getCategoryIconPath(ExpenseCategory category) {
    String iconPath = '';
    switch (category) {
      case ExpenseCategory.bills:
        iconPath = billsIconPath;
        break;
      case ExpenseCategory.billsSecondary:
        iconPath = billsSecondaryIconPath;
        break;
      case ExpenseCategory.food:
        iconPath = foodIconPath;
        break;
      case ExpenseCategory.foodSecondary:
        iconPath = foodSecondaryIconPath;
        break;
      case ExpenseCategory.clothes:
        iconPath = clothesIconPath;
        break;
      case ExpenseCategory.clothesSecondary:
        iconPath = clothesSecondaryIconPath;
        break;
      case ExpenseCategory.transport:
        iconPath = transportIconPath;
        break;
      case ExpenseCategory.transportSecondary:
        iconPath = transportSecondaryIconPath;
        break;
      case ExpenseCategory.fun:
        iconPath = funIconPath;
        break;
      case ExpenseCategory.funSecondary:
        iconPath = funSecondaryIconPath;
        break;
      case ExpenseCategory.other:
        iconPath = otherIconPath;
        break;
      case ExpenseCategory.otherSecondary:
        iconPath = otherSecondaryIconPath;
        break;
    }
    return iconPath;
  }
}
