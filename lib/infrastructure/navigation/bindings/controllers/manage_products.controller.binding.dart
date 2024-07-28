import 'package:get/get.dart';

import '../../../../presentation/admin_panel/modules/manage_products/controllers/manage_products.controller.dart';

class ManageProductsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageProductsController>(
      () => ManageProductsController(),
    );
  }
}
