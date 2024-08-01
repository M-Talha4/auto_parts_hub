import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/change_order_status_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/get_all_orders_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/order_dao/order_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';
import '../../../../../../presentation/admin_panel/modules/manage_orders/controllers/manage_orders.controller.dart';

class ManageOrdersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersRepository>(
        () => OrderDao(Get.find<FireStoreServices>()));
    Get.lazyPut<GetAllOrdersUsecase>(
        () => GetAllOrdersUsecase(Get.find<OrdersRepository>()));
    Get.lazyPut<ChangeOrderStatusUsecase>(
        () => ChangeOrderStatusUsecase(Get.find<OrdersRepository>()));
    Get.lazyPut<ManageOrdersController>(() => ManageOrdersController(
        Get.find<GetAllOrdersUsecase>(), Get.find<ChangeOrderStatusUsecase>()));
  }
}
