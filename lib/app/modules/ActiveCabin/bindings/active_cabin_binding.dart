import 'package:get/get.dart';

import '../controllers/active_cabin_controller.dart';

class ActiveCabinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveCabinController>(
      () => ActiveCabinController(),
    );
  }
}
