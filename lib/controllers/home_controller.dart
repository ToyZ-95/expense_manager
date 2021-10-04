import 'package:expense_manager/models/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<MonthsCardModel> monthsCards = GetMonthsCard().obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    super.onInit();
  }

  void addMonthsCard(MonthsCardModel monthsCardModel) =>
      monthsCards.add(monthsCardModel);

  void removeMonthsCard(MonthsCardModel monthsCardModel) =>
      monthsCards.remove(monthsCardModel);
}
