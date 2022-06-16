import 'package:get/get.dart';

import '../controllers/completed_order_details_controller.dart';

class CompletedOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedOrderDetailsController>(
      () => CompletedOrderDetailsController(),
    );
  }
}
