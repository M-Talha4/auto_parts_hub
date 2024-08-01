import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/get_user_orders_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/order_dao/order_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../../../../../presentation/dashboard/my_orders/controllers/my_orders.controller.dart';

class MyOrdersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersRepository>(
        () => OrderDao(Get.find<FireStoreServices>()));
    Get.lazyPut<GetUserOrdersUsecase>(
        () => GetUserOrdersUsecase(Get.find<OrdersRepository>()));
    Get.lazyPut<MyOrdersController>(
        () => MyOrdersController(Get.find<GetUserOrdersUsecase>()));
  }
}
