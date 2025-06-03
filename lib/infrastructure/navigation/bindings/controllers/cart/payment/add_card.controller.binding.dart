import '/domain/core/interfaces/payment_interface/payment_repository.dart';
import '/domain/core/usecase/payment_usecase/add_card_usecase.dart';
import '/infrastructure/dal/daos/payment_dao/payment_dao.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import '/presentation/dashboard/my_cart/payments/controllers/payments.controller.dart';
import 'package:get/get.dart';

import '../../../../../../presentation/dashboard/my_cart/payments/add_card/controllers/add_card.controller.dart';

class AddCardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentRepository>(
        () => PaymentDao(Get.find<FireStoreServices>()));
    Get.lazyPut<AddCardUsecase>(
        () => AddCardUsecase(Get.find<PaymentRepository>()));
    Get.lazyPut<AddCardController>(
      () => AddCardController(
          Get.find<AddCardUsecase>(), Get.find<PaymentsController>()),
    );
  }
}
