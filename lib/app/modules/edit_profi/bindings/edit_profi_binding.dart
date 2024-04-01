import 'package:get/get.dart';

import '../controllers/edit_profi_controller.dart';

class EditProfiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfiController>(
      () => EditProfiController(),
    );
  }
}
