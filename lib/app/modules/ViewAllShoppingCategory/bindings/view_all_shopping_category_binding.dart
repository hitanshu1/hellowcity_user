import 'package:get/get.dart';

import '../controllers/view_all_shopping_category_controller.dart';

class ViewAllShoppingCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllShoppingCategoryController>(
      () => ViewAllShoppingCategoryController(),
    );
  }
}
