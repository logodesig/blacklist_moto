import 'package:get/get.dart';

import '../controllers/repport_moto_controller.dart';

class RepportMotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepportMotoController>(
      () => RepportMotoController(),
    );
  }
}
