import 'package:get/get.dart';

import '../../../../../presentation/admin_panel/controllers/admin_panel.controller.dart';

class AdminPanelControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPanelController>(
      () => AdminPanelController(),
    );
  }
}
