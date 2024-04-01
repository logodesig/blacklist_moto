import 'package:get/get.dart';

import '../controllers/motos_controller.dart';

class MotosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MotosController>(
      () => MotosController(),
    );
  }
}
