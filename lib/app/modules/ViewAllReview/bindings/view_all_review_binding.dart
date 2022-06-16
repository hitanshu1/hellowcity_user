import 'package:get/get.dart';

import '../controllers/view_all_review_controller.dart';

class ViewAllReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllReviewController>(
      () => ViewAllReviewController(),
    );
  }
}
