import 'package:get/get.dart';

import '../../../../presentation/admin_panel/modules/add_products/controllers/add_products.controller.dart';

class AddProductsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductsController>(
      () => AddProductsController(),
    );
  }
}
