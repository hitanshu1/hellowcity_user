import 'package:get/get.dart';

import '../controllers/active_cabin_order_details_controller.dart';

class ActiveCabinOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveCabinOrderDetailsController>(
      () => ActiveCabinOrderDetailsController(),
    );
  }
}
