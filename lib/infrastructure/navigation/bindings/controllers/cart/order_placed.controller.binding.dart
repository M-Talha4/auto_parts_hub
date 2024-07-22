import 'package:get/get.dart';

import '../../../../../presentation/dashboard/my_cart/order_placed/controllers/order_placed.controller.dart';

class OrderPlacedControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPlacedController>(
      () => OrderPlacedController(),
    );
  }
}
