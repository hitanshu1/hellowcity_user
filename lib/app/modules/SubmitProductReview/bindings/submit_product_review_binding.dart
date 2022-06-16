import 'package:get/get.dart';

import '../controllers/submit_product_review_controller.dart';

class SubmitProductReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmitProductReviewController>(
      () => SubmitProductReviewController(),
    );
  }
}
