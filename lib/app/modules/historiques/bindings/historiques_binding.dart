import 'package:get/get.dart';

import '../controllers/historiques_controller.dart';

class HistoriquesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriquesController>(
      () => HistoriquesController(),
    );
  }
}
