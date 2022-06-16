import 'package:get/get.dart';

import '../controllers/enter_location_controller.dart';

class EnterLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterLocationController>(
      () => EnterLocationController(),
    );
  }
}
