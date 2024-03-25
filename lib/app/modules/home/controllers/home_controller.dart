import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
