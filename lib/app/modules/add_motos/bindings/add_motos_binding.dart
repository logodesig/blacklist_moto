import 'package:get/get.dart';

import '../controllers/add_motos_controller.dart';

class AddMotosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMotosController>(
      () => AddMotosController(),
    );
  }
}
