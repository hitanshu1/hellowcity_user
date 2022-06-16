import 'package:get/get.dart';

import '../controllers/search_product_item_controller.dart';

class SearchProductItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProductItemController>(
      () => SearchProductItemController(),
    );
  }
}
