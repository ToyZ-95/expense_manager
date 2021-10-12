import 'package:get/get.dart';

class StatsController extends GetxController {
  RxInt selectedTab =
      1.obs; //this is for General and Expense Log tabs in Stats screen

  void selectTab(int i) {
    selectedTab.value = i;
    selectedTab.refresh();
  }
}
