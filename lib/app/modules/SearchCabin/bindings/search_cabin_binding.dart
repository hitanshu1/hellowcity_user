import 'package:get/get.dart';

import '../controllers/search_cabin_controller.dart';

class SearchCabinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchCabinController>(
      () => SearchCabinController(),
    );
  }
}
