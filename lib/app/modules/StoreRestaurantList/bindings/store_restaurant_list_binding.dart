import 'package:get/get.dart';

import '../controllers/store_restaurant_list_controller.dart';

class StoreRestaurantListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreRestaurantListController>(
      () => StoreRestaurantListController(),
    );
  }
}
