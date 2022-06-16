import 'package:get/get.dart';

import '../controllers/book_cabin_controller.dart';

class BookCabinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookCabinController>(
      () => BookCabinController(),
    );
  }
}
