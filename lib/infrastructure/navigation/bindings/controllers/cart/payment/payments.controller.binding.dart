import 'package:auto_parts_hub/domain/core/interfaces/orders_interface/orders_repository.dart';
import 'package:auto_parts_hub/domain/core/interfaces/payment_interface/payment_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/orders_usecase/submit_orders_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/payment_usecase/delete_card_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/payment_usecase/get_card_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/order_dao/order_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/payment_dao/payment_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';
import '../../../../../../presentation/dashboard/my_cart/payments/controllers/payments.controller.dart';

class PaymentsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentRepository>(
        () => PaymentDao(Get.find<FireStoreServices>()));
    Get.lazyPut<OrdersRepository>(
        () => OrderDao(Get.find<FireStoreServices>()));
    Get.lazyPut<GetCardUsecase>(
        () => GetCardUsecase(Get.find<PaymentRepository>()));
    Get.lazyPut<DeleteCardUsecase>(
        () => DeleteCardUsecase(Get.find<PaymentRepository>()));
    Get.lazyPut<SubmitOrdersUsecase>(
        () => SubmitOrdersUsecase(Get.find<OrdersRepository>()));
    Get.lazyPut<PaymentsController>(() => PaymentsController(
        Get.find<GetCardUsecase>(),
        Get.find<DeleteCardUsecase>(),
        Get.find<SubmitOrdersUsecase>()));
  }
}
