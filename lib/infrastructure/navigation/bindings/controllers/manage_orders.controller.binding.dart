import 'package:get/get.dart';

import '../../../../presentation/admin_panel/modules/manage_orders/controllers/manage_orders.controller.dart';

class ManageOrdersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageOrdersController>(
      () => ManageOrdersController(),
    );
  }
}
