import 'package:get/get.dart';

import '../controllers/add_or_change_delivery_address_controller.dart';

class AddOrChangeDeliveryAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddOrChangeDeliveryAddressController>(
      () => AddOrChangeDeliveryAddressController(),
    );
  }
}
