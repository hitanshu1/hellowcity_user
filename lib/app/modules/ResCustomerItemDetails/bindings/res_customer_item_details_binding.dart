import 'package:get/get.dart';

import '../controllers/res_customer_item_details_controller.dart';

class ResCustomerItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResCustomerItemDetailsController>(
      () => ResCustomerItemDetailsController(),
    );
  }
}
