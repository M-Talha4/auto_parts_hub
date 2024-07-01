import 'package:get/get.dart';

import '../controllers/dashboard_drawer_controller.dart';

class DashboardDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardDrawerController>(
      () => DashboardDrawerController(),
    );
  }
}
