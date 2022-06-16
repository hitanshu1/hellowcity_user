import 'package:get/get.dart';

import '../controllers/allow_location_permission_controller.dart';

class AllowLocationPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllowLocationPermissionController>(
      () => AllowLocationPermissionController(),
    );
  }
}
